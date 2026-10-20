import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class DeleteMediaUseCase {
  final EventRepository repository;
  DeleteMediaUseCase(this.repository);

  Future<void> call(String url) => repository.deleteMedia(url);
}
