import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class AddCategoryUseCase {
  final EventRepository repository;
  AddCategoryUseCase(this.repository);

  Future<CategoryModel> call(CategoryModel category) =>
      repository.addCategory(category);
}
