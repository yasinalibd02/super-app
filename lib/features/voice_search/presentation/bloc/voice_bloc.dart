import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/voice_usecases.dart';
import 'voice_bloc_data.dart';

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  final InitVoiceUseCase initVoice;
  final StartListeningUseCase startListening;
  final StopListeningUseCase stopListening;

  VoiceBloc({
    required this.initVoice,
    required this.startListening,
    required this.stopListening,
  }) : super(VoiceInitial()) {
    on<InitializeVoice>((event, emit) async {
      bool available = await initVoice();
      if (available) {
        emit(VoiceReady());
      } else {
        emit(const VoiceError("Speech recognition not available"));
      }
    });

    on<StartListening>((event, emit) async {
      emit(const VoiceListening(""));
      final result = await startListening((text) {
        add(_VoiceUpdate(text));
      });
      result.fold((error) => emit(VoiceError(error.toString())), (_) => null);
    });

    on<StopListening>((event, emit) async {
      await stopListening();
      if (state is VoiceListening) {
        emit(VoiceSuccess((state as VoiceListening).text));
      }
    });

    on<_VoiceUpdate>((event, emit) {
      emit(VoiceListening(event.text));
    });
  }
}

class _VoiceUpdate extends VoiceEvent {
  final String text;
  const _VoiceUpdate(this.text);
}
