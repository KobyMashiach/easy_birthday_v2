import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';

class SaveEventIdUseCase {
  final WearOsRepository repository;
  SaveEventIdUseCase(this.repository);

  Future<void> call(String eventId) => repository.saveEventId(eventId);
}
