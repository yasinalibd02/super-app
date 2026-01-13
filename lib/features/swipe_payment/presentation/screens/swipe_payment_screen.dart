import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';

import '../bloc/swipe_bloc.dart';
import '../widgets/swipe_button.dart';

class SwipePaymentScreen extends StatelessWidget {
  const SwipePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SwipeBloc>(),
      child: const _SwipePaymentView(),
    );
  }
}

class _SwipePaymentView extends StatelessWidget {
  const _SwipePaymentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Swipe Payment")),
      body: Center(
        child: BlocConsumer<SwipeBloc, SwipeState>(
          listener: (context, state) {
            if (state is SwipeSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Payment Confirmed!")),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "\$150.00",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                SwipeButton(
                  isLoading: state is SwipeLoading,
                  onSwipeCompleted: () {
                    context.read<SwipeBloc>().add(ConfirmSwipe());
                  },
                ),
                if (state is SwipeSuccess)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () =>
                          context.read<SwipeBloc>().add(ResetSwipe()),
                      child: const Text("Reset"),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
