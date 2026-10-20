import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class DeleteCategoryUseCase {
  final EventRepository repository;
  DeleteCategoryUseCase(this.repository);

  Future<void> call(CategoryModel category) =>
      repository.deleteCategory(category);
}
