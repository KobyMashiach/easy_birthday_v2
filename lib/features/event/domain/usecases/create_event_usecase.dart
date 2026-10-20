import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class CreateEventUseCase {
  final EventRepository repository;
  CreateEventUseCase(this.repository);

  Future<void> call() => repository.createEvent();
}
