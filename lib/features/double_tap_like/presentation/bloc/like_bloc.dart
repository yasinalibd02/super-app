import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/like_repository.dart';

abstract class LikeEvent extends Equatable {
  const LikeEvent();
  @override
  List<Object> get props => [];
}

class ToggleLike extends LikeEvent {}

abstract class LikeState extends Equatable {
  final bool isLiked;
  const LikeState(this.isLiked);
  @override
  List<Object> get props => [isLiked];
}

class LikeInitial extends LikeState {
  const LikeInitial(super.isLiked);
}

class LikeChanged extends LikeState {
  const LikeChanged(super.isLiked);
}

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final LikeRepository repository;

  LikeBloc({required this.repository}) : super(const LikeInitial(false)) {
    on<ToggleLike>((event, emit) async {
      // Optimistic update
      bool newState = !state.isLiked;
      emit(LikeChanged(newState));

      final result = await repository.toggleLike(!newState); // pass old state
      result.fold(
        (l) => emit(LikeChanged(!newState)), // Revert on failure
        (r) => null, // Success, state already updated
      );
    });
  }
}
