import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;
  GetUserUseCase(this.repository);

  Future<PersonaModel> call(String phoneNumber) =>
      repository.getUser(phoneNumber);
}
