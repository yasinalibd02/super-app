import 'package:fpdart/fpdart.dart';

abstract class PaymentRepository {
  Future<Either<Exception, String>> createPaymentIntent(
    double amount,
    String currency,
  );
  Future<Either<Exception, bool>> confirmPayment(String clientSecret);
}
