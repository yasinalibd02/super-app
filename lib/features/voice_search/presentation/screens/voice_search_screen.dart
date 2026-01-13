import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/import.dart';
import '../bloc/voice_bloc.dart';
import '../bloc/voice_bloc_data.dart';
import '../../../../core/di/service_locator.dart';

class VoiceSearchScreen extends StatelessWidget {
  const VoiceSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VoiceBloc>()..add(InitializeVoice()),
      child: const _VoiceSearchView(),
    );
  }
}

class _VoiceSearchView extends StatefulWidget {
  const _VoiceSearchView();

  @override
  State<_VoiceSearchView> createState() => _VoiceSearchViewState();
}

class _VoiceSearchViewState extends State<_VoiceSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Voice Search",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocConsumer<VoiceBloc, VoiceState>(
        listener: (context, state) {
          if (state is VoiceSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Result: ${state.finalResult}")),
            );
          }
        },
        builder: (context, state) {
          String text = "Press the mic to search";
          bool isListening = false;

          if (state is VoiceListening) {
            text = state.text.isEmpty ? "Listening..." : state.text;
            isListening = true;
          } else if (state is VoiceSuccess) {
            text = state.finalResult;
          } else if (state is VoiceError) {
            text = state.message;
          }

          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                AvatarGlow(
                  animate: isListening,
                  glowColor: Colors.blue,
                  startDelay: const Duration(milliseconds: 100),
                  glowShape: BoxShape.circle,
                  duration: const Duration(milliseconds: 2000),
                  repeat: true,
                  child: Material(
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 40.0,
                      child: IconButton(
                        icon: Icon(
                          isListening ? Icons.mic : Icons.mic_none,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          if (isListening) {
                            context.read<VoiceBloc>().add(StopListening());
                          } else {
                            context.read<VoiceBloc>().add(StartListening());
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
