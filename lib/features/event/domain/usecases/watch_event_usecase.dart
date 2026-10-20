import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class WatchEventUseCase {
  final EventRepository repository;
  WatchEventUseCase(this.repository);

  Stream<EventModel?> call(String eventId) => repository.watchEvent(eventId);
}
