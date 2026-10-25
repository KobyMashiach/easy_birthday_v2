import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

/// Saves the order the partner sees the categories in.
class ReorderCategoriesUseCase {
  final EventRepository repository;
  ReorderCategoriesUseCase(this.repository);

  Future<void> call(List<String> ids) => repository.reorderCategories(ids);
}
