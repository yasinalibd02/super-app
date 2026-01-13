import 'package:fpdart/fpdart.dart';

abstract class RecordRepository {
  Future<Either<Exception, bool>> startRecording();
  Future<Either<Exception, String>> stopRecording();
}

class RecordRepositoryImpl implements RecordRepository {
  @override
  Future<Either<Exception, bool>> startRecording() async {
    // Mock
    return const Right(true);
  }

  @override
  Future<Either<Exception, String>> stopRecording() async {
    // Mock return path
    await Future.delayed(const Duration(milliseconds: 500));
    return const Right("/path/to/video.mp4");
  }
}
