import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class SaveUserUseCase {
  final UserRepository repository;
  SaveUserUseCase(this.repository);

  Future<void> call(PersonaModel user) => repository.saveUser(user);
}
