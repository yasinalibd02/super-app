import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/swipe_repository.dart';

abstract class SwipeEvent extends Equatable {
  const SwipeEvent();
  @override
  List<Object> get props => [];
}

class ConfirmSwipe extends SwipeEvent {}

class ResetSwipe extends SwipeEvent {}

abstract class SwipeState extends Equatable {
  const SwipeState();
  @override
  List<Object> get props => [];
}

class SwipeInitial extends SwipeState {}

class SwipeLoading extends SwipeState {}

class SwipeSuccess extends SwipeState {}

class SwipeError extends SwipeState {
  final String message;
  const SwipeError(this.message);
}

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final SwipeRepository repository;

  SwipeBloc({required this.repository}) : super(SwipeInitial()) {
    on<ConfirmSwipe>((event, emit) async {
      emit(SwipeLoading());
      final result = await repository.processPayment();
      result.fold(
        (l) => emit(SwipeError(l.toString())),
        (r) => emit(SwipeSuccess()),
      );
    });

    on<ResetSwipe>((event, emit) {
      emit(SwipeInitial());
    });
  }
}
