import 'package:easy_birthday/features/auth/domain/repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;
  SendOtpUseCase(this.repository);

  /// `null` = verified instantly and already signed in: skip the code page.
  Future<String?> call(String phoneNumber) => repository.sendOtp(phoneNumber);
}
