import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

/// Edits a saved category: [change] gets the latest copy of [category] (the
/// caller's copy may be stale) and sets only the fields the caller edits, so
/// the other one's concurrent edits of the same category survive. [change]
/// may run more than once. Returns the category as written; throws
/// `AppException(notFound)` when it no longer exists.
class UpdateCategoryUseCase {
  final EventRepository repository;
  UpdateCategoryUseCase(this.repository);

  Future<CategoryModel> call(
    CategoryModel category,
    CategoryModel Function(CategoryModel latest) change,
  ) async {
    final String? id = category.id;
    if (id == null) {
      throw const AppException(
        AppErrorType.notFound,
        message: 'Category has no id',
      );
    }
    return repository.updateCategory(id, change);
  }
}
