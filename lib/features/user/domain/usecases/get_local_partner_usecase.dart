import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';

class GetLocalPartnerUseCase {
  final UserRepository repository;
  GetLocalPartnerUseCase(this.repository);

  PersonaModel? call() => repository.getLocalPartner();
}
