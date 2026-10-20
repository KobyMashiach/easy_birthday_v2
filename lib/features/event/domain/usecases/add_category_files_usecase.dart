import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_category_files_usecase.dart';

/// Adds new pictures/videos to a category.
class AddCategoryFilesUseCase {
  final EventRepository repository;
  final UploadCategoryFilesUseCase _upload;
  final UpdateCategoryUseCase _update;

  AddCategoryFilesUseCase(this.repository)
    : _upload = UploadCategoryFilesUseCase(repository),
      _update = UpdateCategoryUseCase(repository);

  /// Uploads [files] and appends their URLs to the latest copy of [category]
  /// (the editor's copy may be stale), saving [lock] with them; a lock-only
  /// change saves without files. Files that failed are skipped and the last
  /// failure is thrown after the save. When the save fails the new uploads
  /// are deleted.
  Future<void> call({
    required String eventId,
    required CategoryModel category,
    required List<File> files,
    required bool lock,
    UploadProgress? onProgress,
  }) async {
    final upload = await _upload(
      eventId: eventId,
      category: category,
      files: files,
      onProgress: onProgress,
    );
    final List<String> urls = upload.urls;
    if (urls.isNotEmpty || repository.currentCategory(category).lock != lock) {
      try {
        await _update(
          category,
          (latest) =>
              latest.copyWith(lock: lock, urls: [...?latest.urls, ...urls]),
        );
      } catch (_) {
        urls.forEach(_deleteInBackground);
        rethrow;
      }
    }
    if (upload.error case final Object error) throw error;
  }

  void _deleteInBackground(String url) =>
      unawaited(repository.deleteMedia(url));
}
