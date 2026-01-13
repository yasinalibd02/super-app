import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/import.dart';
import '../../../../core/di/service_locator.dart';
import '../bloc/record_bloc.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RecordBloc>(),
      child: const _RecordView(),
    );
  }
}

class _RecordView extends StatefulWidget {
  const _RecordView();

  @override
  State<_RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<_RecordView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Max record duration
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<RecordBloc>().add(StopRecording());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hold to Record")),
      body: BlocConsumer<RecordBloc, RecordState>(
        listener: (context, state) {
          if (state is RecordFinished) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Recorded to: ${state.path}")),
            );
            _controller.reset();
          }
        },
        builder: (context, state) {
          bool isRecording = state is RecordRecording;
          bool isProcessing = state is RecordProcessing;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isProcessing) const CircularProgressIndicator(),
                if (!isProcessing)
                  GestureDetector(
                    onLongPressStart: (_) {
                      context.read<RecordBloc>().add(StartRecording());
                      _controller.forward();
                    },
                    onLongPressEnd: (_) {
                      context.read<RecordBloc>().add(StopRecording());
                      _controller.reset();
                    },
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Container(
                          width:
                              100 * (isRecording ? _scaleAnimation.value : 1.0),
                          height:
                              100 * (isRecording ? _scaleAnimation.value : 1.0),
                          decoration: BoxDecoration(
                            color: isRecording
                                ? Colors.red
                                : Colors.grey.shade300,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: isRecording
                                ? [
                                    BoxShadow(
                                      color: Colors.red.withOpacity(0.5),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Icon(
                              isRecording ? Icons.stop : Icons.mic,
                              color: isRecording ? Colors.white : Colors.black,
                              size: 40,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  isRecording ? "Recording..." : "Hold to Record",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
