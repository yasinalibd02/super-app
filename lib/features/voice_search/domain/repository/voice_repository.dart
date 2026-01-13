import 'package:fpdart/fpdart.dart';

abstract class VoiceRepository {
  Future<bool> initialize();
  Future<Either<Exception, void>> startListening(Function(String) onResult);
  Future<Either<Exception, void>> stopListening();
  bool get isListening;
}
