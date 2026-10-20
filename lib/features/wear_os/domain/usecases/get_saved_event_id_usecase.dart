import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';

class GetSavedEventIdUseCase {
  final WearOsRepository repository;
  GetSavedEventIdUseCase(this.repository);

  String? call() => repository.getSavedEventId();
}
