import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';

class ClearEventIdUseCase {
  final WearOsRepository repository;
  ClearEventIdUseCase(this.repository);

  Future<void> call() => repository.clearEventId();
}
