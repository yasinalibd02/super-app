import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/success_repository.dart';

abstract class SuccessEvent extends Equatable {
  const SuccessEvent();
  @override
  List<Object> get props => [];
}

class TriggerSuccess extends SuccessEvent {}

abstract class SuccessState extends Equatable {
  const SuccessState();
  @override
  List<Object> get props => [];
}

class SuccessInitial extends SuccessState {}

class SuccessLoading extends SuccessState {}

class SuccessCompleted extends SuccessState {}

class SuccessBloc extends Bloc<SuccessEvent, SuccessState> {
  final SuccessRepository repository;

  SuccessBloc({required this.repository}) : super(SuccessInitial()) {
    on<TriggerSuccess>((event, emit) async {
      emit(SuccessLoading());
      await repository.processOrder();
      emit(SuccessCompleted());
    });
  }
}
