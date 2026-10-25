import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class UpdateChildrenUseCase {
  final EventRepository repository;
  UpdateChildrenUseCase(this.repository);

  Future<void> call(List<ChildModel> children) =>
      repository.updateChildren(children);
}
