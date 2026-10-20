import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class UpdateEventUseCase {
  final EventRepository repository;
  UpdateEventUseCase(this.repository);

  Future<void> call(EventModel event) => repository.updateEvent(event);
}
