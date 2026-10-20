import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class SavePartnerUseCase {
  final UserRepository repository;
  SavePartnerUseCase(this.repository);

  Future<void> call(PersonaModel partner) => repository.savePartner(partner);
}
