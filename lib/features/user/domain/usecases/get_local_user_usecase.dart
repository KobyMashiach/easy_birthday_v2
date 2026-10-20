import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class GetLocalUserUseCase {
  final UserRepository repository;
  GetLocalUserUseCase(this.repository);

  PersonaModel call() => repository.getLocalUser();
}
