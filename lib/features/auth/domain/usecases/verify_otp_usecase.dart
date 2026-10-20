import 'package:easy_birthday/features/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;
  VerifyOtpUseCase(this.repository);

  Future<void> call({
    required String verificationId,
    required String smsCode,
  }) => repository.verifyOtp(verificationId: verificationId, smsCode: smsCode);
}
