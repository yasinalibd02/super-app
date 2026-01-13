import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/story_entity.dart';
import '../../domain/repository/story_repository.dart';

// Events
abstract class StoryEvent extends Equatable {
  const StoryEvent();
  @override
  List<Object> get props => [];
}

class LoadStories extends StoryEvent {}

class NextStory extends StoryEvent {}

class PreviousStory extends StoryEvent {}

class PauseStory extends StoryEvent {}

class ResumeStory extends StoryEvent {}

class _Tick extends StoryEvent {
  final double percent;
  const _Tick(this.percent);
  @override
  List<Object> get props => [percent];
}

// State
abstract class StoryState extends Equatable {
  const StoryState();
  @override
  List<Object> get props => [];
}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final List<StoryEntity> stories;
  final int currentIndex;
  final double percent; // 0.0 to 1.0

  const StoryLoaded({
    required this.stories,
    this.currentIndex = 0,
    this.percent = 0.0,
  });

  StoryLoaded copyWith({
    List<StoryEntity>? stories,
    int? currentIndex,
    double? percent,
  }) {
    return StoryLoaded(
      stories: stories ?? this.stories,
      currentIndex: currentIndex ?? this.currentIndex,
      percent: percent ?? this.percent,
    );
  }

  @override
  List<Object> get props => [stories, currentIndex, percent];
}

class StoryFinished extends StoryState {}

class StoryError extends StoryState {
  final String message;
  const StoryError(this.message);
}

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository repository;

  Timer? _timer;
  final _tickInterval = const Duration(milliseconds: 50);

  StoryBloc({required this.repository}) : super(StoryInitial()) {
    on<LoadStories>(_onLoadStories);
    on<NextStory>(_onNextStory);
    on<PreviousStory>(_onPreviousStory);
    on<PauseStory>(_onPause);
    on<ResumeStory>(_onResume);
    on<_Tick>(_onTick);
  }

  Future<void> _onLoadStories(
    LoadStories event,
    Emitter<StoryState> emit,
  ) async {
    emit(StoryLoading());
    final result = await repository.getStories();
    result.fold((err) => emit(StoryError(err.toString())), (stories) {
      if (stories.isNotEmpty) {
        emit(StoryLoaded(stories: stories));
        _startTimer(stories[0].duration);
      } else {
        emit(const StoryError("No stories found"));
      }
    });
  }

  void _onNextStory(NextStory event, Emitter<StoryState> emit) {
    if (state is StoryLoaded) {
      final s = state as StoryLoaded;
      if (s.currentIndex < s.stories.length - 1) {
        emit(s.copyWith(currentIndex: s.currentIndex + 1, percent: 0));
        _startTimer(s.stories[s.currentIndex + 1].duration);
      } else {
        emit(StoryFinished());
        _timer?.cancel();
      }
    }
  }

  void _onPreviousStory(PreviousStory event, Emitter<StoryState> emit) {
    if (state is StoryLoaded) {
      final s = state as StoryLoaded;
      if (s.currentIndex > 0) {
        emit(s.copyWith(currentIndex: s.currentIndex - 1, percent: 0));
        _startTimer(s.stories[s.currentIndex - 1].duration);
      } else {
        // Reset current story
        emit(s.copyWith(percent: 0));
      }
    }
  }

  void _onPause(PauseStory event, Emitter<StoryState> emit) {
    _timer?.cancel();
  }

  void _onResume(ResumeStory event, Emitter<StoryState> emit) {
    if (state is StoryLoaded) {
      final s = state as StoryLoaded;
      final remaining = s.stories[s.currentIndex].duration * (1 - s.percent);
      // Simply restart logic or continue? For simplicity, we just continue timer
      // We need to know duration.
      // A better way is to rely on percent.
      // _timer is just periodic.
      _resumeTimer(s.stories[s.currentIndex].duration);
    }
  }

  void _onTick(_Tick event, Emitter<StoryState> emit) {
    if (state is StoryLoaded) {
      final s = state as StoryLoaded;
      if (event.percent >= 1.0) {
        add(NextStory());
      } else {
        emit(s.copyWith(percent: event.percent));
      }
    }
  }

  void _startTimer(Duration duration) {
    _timer?.cancel();
    double currentPercent = 0;
    // Calculation: tickInterval / duration
    double step = _tickInterval.inMilliseconds / duration.inMilliseconds;

    _timer = Timer.periodic(_tickInterval, (timer) {
      currentPercent += step;
      if (currentPercent > 1.0) currentPercent = 1.0;
      add(_Tick(currentPercent));
      if (currentPercent >= 1.0) {
        timer.cancel();
      }
    });
  }

  void _resumeTimer(Duration duration) {
    if (state is StoryLoaded) {
      double currentPercent = (state as StoryLoaded).percent;
      double step = _tickInterval.inMilliseconds / duration.inMilliseconds;

      _timer = Timer.periodic(_tickInterval, (timer) {
        currentPercent += step;
        if (currentPercent > 1.0) currentPercent = 1.0;
        add(_Tick(currentPercent));
        if (currentPercent >= 1.0) {
          timer.cancel();
        }
      });
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
