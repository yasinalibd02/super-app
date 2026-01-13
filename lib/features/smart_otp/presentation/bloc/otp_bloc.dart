import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/otp_repository.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
  @override
  List<Object> get props => [];
}

class VerifyOtp extends OtpEvent {
  final String otp;
  const VerifyOtp(this.otp);
  @override
  List<Object> get props => [otp];
}

class ClearOtpState extends OtpEvent {}

abstract class OtpState extends Equatable {
  const OtpState();
  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {}

class OtpFailure extends OtpState {
  final String message;
  const OtpFailure(this.message);
  @override
  List<Object> get props => [message];
}

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository repository;

  OtpBloc({required this.repository}) : super(OtpInitial()) {
    on<VerifyOtp>((event, emit) async {
      emit(OtpLoading());
      final result = await repository.verifyOtp(event.otp);
      result.fold(
        (l) => emit(OtpFailure(l.toString())),
        (r) => emit(OtpSuccess()),
      );
    });

    on<ClearOtpState>((event, emit) {
      emit(OtpInitial());
    });
  }
}
