import 'package:fpdart/fpdart.dart';

abstract class OtpRepository {
  Future<Either<Exception, bool>> verifyOtp(String otp);
}

class OtpRepositoryImpl implements OtpRepository {
  @override
  Future<Either<Exception, bool>> verifyOtp(String otp) async {
    await Future.delayed(const Duration(seconds: 1));
    if (otp == "123456") {
      return const Right(true);
    } else {
      return Left(Exception("Invalid OTP"));
    }
  }
}
