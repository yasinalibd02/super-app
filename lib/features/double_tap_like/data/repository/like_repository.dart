import 'package:fpdart/fpdart.dart';

abstract class LikeRepository {
  Future<Either<Exception, bool>> toggleLike(bool currentStatus);
}

class LikeRepositoryImpl implements LikeRepository {
  @override
  Future<Either<Exception, bool>> toggleLike(bool currentStatus) async {
    // Mock network call
    return Right(!currentStatus);
  }
}
