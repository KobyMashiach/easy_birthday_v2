import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class CreatePartnerUseCase {
  final UserRepository repository;
  CreatePartnerUseCase(this.repository);

  Future<void> call(PersonaModel partner) => repository.createPartner(partner);
}
