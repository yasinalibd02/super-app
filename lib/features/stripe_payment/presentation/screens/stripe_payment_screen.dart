import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../app/import.dart';
import '../../../../core/di/service_locator.dart';
import '../bloc/payment_bloc.dart';
import '../bloc/payment_bloc_data.dart';

class StripePaymentScreen extends StatelessWidget {
  const StripePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentBloc>(),
      child: const _StripePaymentView(),
    );
  }
}

class _StripePaymentView extends StatelessWidget {
  const _StripePaymentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stripe Payment Demo")),
      body: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Payment Successful!")),
            );
          } else if (state is PaymentFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
          }
        },
        builder: (context, state) {
          if (state is PaymentSuccess) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 80),
                  SizedBox(height: 16),
                  Text("Success!", style: TextStyle(fontSize: 24)),
                ],
              ),
            );
          }

          bool isLoading = state is PaymentLoading;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Text(
                  "\$50.00",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                const Text("Card Information"),
                const SizedBox(height: 8),
                const CardField(enablePostalCode: true),
                const Spacer(),
                if (state is PaymentInitial)
                  ElevatedButton(
                    onPressed: () {
                      context.read<PaymentBloc>().add(
                        const CreatePayment(5000, "usd"),
                      );
                    },
                    child: const Text("Checkout"),
                  ),
                if (state is PaymentSecretReady || state is PaymentLoading)
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<PaymentBloc>().add(
                              const ConfirmPayment(),
                            );
                          },
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Pay \$50.00"),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
