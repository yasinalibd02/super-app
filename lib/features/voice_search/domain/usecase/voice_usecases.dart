import 'package:fpdart/fpdart.dart';
import '../repository/voice_repository.dart';

class InitVoiceUseCase {
  final VoiceRepository repository;
  InitVoiceUseCase(this.repository);
  Future<bool> call() => repository.initialize();
}

class StartListeningUseCase {
  final VoiceRepository repository;
  StartListeningUseCase(this.repository);
  Future<Either<Exception, void>> call(Function(String) onResult) =>
      repository.startListening(onResult);
}

class StopListeningUseCase {
  final VoiceRepository repository;
  StopListeningUseCase(this.repository);
  Future<Either<Exception, void>> call() => repository.stopListening();
}
