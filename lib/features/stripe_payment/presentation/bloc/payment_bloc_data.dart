import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
  @override
  List<Object> get props => [];
}

class CreatePayment extends PaymentEvent {
  final double amount;
  final String currency;
  const CreatePayment(this.amount, this.currency);
}

class ConfirmPayment extends PaymentEvent {
  const ConfirmPayment();
}

abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSecretReady extends PaymentState {
  final String clientSecret;
  const PaymentSecretReady(this.clientSecret);
}

class PaymentSuccess extends PaymentState {}

class PaymentFailure extends PaymentState {
  final String message;
  const PaymentFailure(this.message);
}
