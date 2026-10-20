import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class RegisterOwnerUseCase {
  final UserRepository repository;
  RegisterOwnerUseCase(this.repository);

  Future<void> call({required String phoneNumber, required String password}) =>
      repository.registerOwner(phoneNumber: phoneNumber, password: password);
}
