import 'dart:async';

import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';

/// Removes saved pictures/videos from a category.
class DeleteCategoryFilesUseCase {
  final EventRepository repository;
  final UpdateCategoryUseCase _update;

  DeleteCategoryFilesUseCase(this.repository)
    : _update = UpdateCategoryUseCase(repository);

  /// [indexes] refer to the URLs of [shown], the copy the editor displayed;
  /// they're removed by value from the latest copy so a newer list isn't
  /// overwritten. The media is deleted from storage only after the save.
  /// Returns the saved category.
  Future<CategoryModel> call({
    required CategoryModel shown,
    required List<int> indexes,
  }) async {
    final List<String> shownUrls = shown.urls ?? const [];
    final Set<String> removedUrls = {
      for (final index in indexes)
        if (index >= 0 && index < shownUrls.length) shownUrls[index],
    };
    final CategoryModel saved = await _update(
      shown,
      (latest) => latest.copyWith(
        urls: [
          for (final url in latest.urls ?? const <String>[])
            if (!removedUrls.contains(url)) url,
        ],
      ),
    );
    for (final url in removedUrls) {
      unawaited(repository.deleteMedia(url));
    }
    return saved;
  }
}
