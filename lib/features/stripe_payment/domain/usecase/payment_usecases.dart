import 'package:fpdart/fpdart.dart';
import '../repository/payment_repository.dart';

class CreatePaymentIntentUseCase {
  final PaymentRepository repository;
  CreatePaymentIntentUseCase(this.repository);
  Future<Either<Exception, String>> call(double amount, String currency) =>
      repository.createPaymentIntent(amount, currency);
}

class ConfirmPaymentUseCase {
  final PaymentRepository repository;
  ConfirmPaymentUseCase(this.repository);
  Future<Either<Exception, bool>> call(String clientSecret) =>
      repository.confirmPayment(clientSecret);
}
