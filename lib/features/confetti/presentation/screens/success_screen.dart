import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/import.dart';
import '../../../../core/di/service_locator.dart';
import '../bloc/success_bloc.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SuccessBloc>(),
      child: const _SuccessView(),
    );
  }
}

class _SuccessView extends StatefulWidget {
  const _SuccessView();

  @override
  State<_SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<_SuccessView> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success Animation")),
      body: BlocConsumer<SuccessBloc, SuccessState>(
        listener: (context, state) {
          if (state is SuccessCompleted) {
            _controller.play();
          }
        },
        builder: (context, state) {
          bool isLoading = state is SuccessLoading;
          bool isSuccess = state is SuccessCompleted;

          return Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isSuccess)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100,
                      )
                    else
                      const Icon(Icons.shopping_cart, size: 100),

                    const SizedBox(height: 20),

                    if (isLoading)
                      const CircularProgressIndicator()
                    else if (!isSuccess)
                      ElevatedButton(
                        onPressed: () {
                          context.read<SuccessBloc>().add(TriggerSuccess());
                        },
                        child: const Text("Complete Order"),
                      )
                    else
                      const Text(
                        "Order Placed!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
