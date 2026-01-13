import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/record_repository.dart';

abstract class RecordEvent extends Equatable {
  const RecordEvent();
  @override
  List<Object> get props => [];
}

class StartRecording extends RecordEvent {}

class StopRecording extends RecordEvent {}

abstract class RecordState extends Equatable {
  const RecordState();
  @override
  List<Object> get props => [];
}

class RecordInitial extends RecordState {}

class RecordRecording extends RecordState {}

class RecordProcessing extends RecordState {}

class RecordFinished extends RecordState {
  final String path;
  const RecordFinished(this.path);
  @override
  List<Object> get props => [path];
}

class RecordError extends RecordState {
  final String message;
  const RecordError(this.message);
  @override
  List<Object> get props => [message];
}

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  final RecordRepository repository;

  RecordBloc({required this.repository}) : super(RecordInitial()) {
    on<StartRecording>((event, emit) async {
      emit(RecordRecording());
      await repository.startRecording();
    });

    on<StopRecording>((event, emit) async {
      emit(RecordProcessing());
      final result = await repository.stopRecording();
      result.fold(
        (l) => emit(RecordError(l.toString())),
        (path) => emit(RecordFinished(path)),
      );
    });
  }
}
