import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';

class SendPhoneLoginRequestUseCase {
  final WearOsRepository repository;
  SendPhoneLoginRequestUseCase(this.repository);

  Future<void> call() => repository.sendPhoneLoginRequest();
}
