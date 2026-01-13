import 'package:fpdart/fpdart.dart';

abstract class SwipeRepository {
  Future<Either<Exception, bool>> processPayment();
}

class SwipeRepositoryImpl implements SwipeRepository {
  @override
  Future<Either<Exception, bool>> processPayment() async {
    await Future.delayed(const Duration(seconds: 2));
    return const Right(true);
  }
}
