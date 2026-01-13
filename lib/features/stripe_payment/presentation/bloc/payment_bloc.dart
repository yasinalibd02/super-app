import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/payment_usecases.dart';
import 'payment_bloc_data.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final CreatePaymentIntentUseCase createPaymentIntent;
  final ConfirmPaymentUseCase confirmPayment;
  String? _clientSecret;

  PaymentBloc({required this.createPaymentIntent, required this.confirmPayment})
    : super(PaymentInitial()) {
    on<CreatePayment>((event, emit) async {
      emit(PaymentLoading());
      final result = await createPaymentIntent(event.amount, event.currency);
      result.fold((error) => emit(PaymentFailure(error.toString())), (secret) {
        _clientSecret = secret;
        emit(PaymentSecretReady(secret));
      });
    });

    on<ConfirmPayment>((event, emit) async {
      if (_clientSecret == null) {
        emit(const PaymentFailure("No payment intent created"));
        return;
      }
      emit(PaymentLoading());
      // Simulate confirmation
      final result = await confirmPayment(_clientSecret!);
      result.fold(
        (error) => emit(PaymentFailure(error.toString())),
        (success) => emit(PaymentSuccess()),
      );
    });
  }
}
