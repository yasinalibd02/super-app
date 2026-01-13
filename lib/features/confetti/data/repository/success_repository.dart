import 'package:fpdart/fpdart.dart';

abstract class SuccessRepository {
  Future<Either<Exception, bool>> processOrder();
}

class SuccessRepositoryImpl implements SuccessRepository {
  @override
  Future<Either<Exception, bool>> processOrder() async {
    await Future.delayed(const Duration(seconds: 2));
    return const Right(true);
  }
}
