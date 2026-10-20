import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class GetEventUseCase {
  final EventRepository repository;
  GetEventUseCase(this.repository);

  Future<EventModel?> call([String? eventId]) => repository.getEvent(eventId);
}
