import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class GetCurrentCategoryUseCase {
  final EventRepository repository;
  GetCurrentCategoryUseCase(this.repository);

  CategoryModel call(CategoryModel category) =>
      repository.currentCategory(category);
}
