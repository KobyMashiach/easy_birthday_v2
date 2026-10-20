import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class UserExistsUseCase {
  final UserRepository repository;
  UserExistsUseCase(this.repository);

  Future<bool> call(String phoneNumber) => repository.userExists(phoneNumber);
}
