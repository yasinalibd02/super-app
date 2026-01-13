import 'package:fpdart/fpdart.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../domain/repository/voice_repository.dart';

class VoiceRepositoryImpl implements VoiceRepository {
  final SpeechToText _speechToText;

  VoiceRepositoryImpl(this._speechToText);

  @override
  Future<bool> initialize() async {
    return await _speechToText.initialize();
  }

  @override
  bool get isListening => _speechToText.isListening;

  @override
  Future<Either<Exception, void>> startListening(
    Function(String) onResult,
  ) async {
    try {
      if (!_speechToText.isAvailable) {
        return Left(Exception("Speech to text not available"));
      }
      await _speechToText.listen(
        onResult: (result) {
          onResult(result.recognizedWords);
        },
      );
      return const Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> stopListening() async {
    try {
      await _speechToText.stop();
      return const Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
