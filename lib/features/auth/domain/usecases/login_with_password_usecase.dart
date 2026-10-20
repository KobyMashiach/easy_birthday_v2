import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/auth/domain/repositories/auth_repository.dart';

class LoginWithPasswordUseCase {
  final AuthRepository repository;
  LoginWithPasswordUseCase(this.repository);

  Future<PersonaModel> call({
    required String phoneNumber,
    required String password,
  }) => repository.loginWithPassword(
    phoneNumber: phoneNumber,
    password: password,
  );
}
