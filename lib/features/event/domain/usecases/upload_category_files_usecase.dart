import 'dart:io';
import 'dart:math';

import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

/// Upload progress: [uploaded] of [total] files are done (failed ones too).
typedef UploadProgress = void Function(int uploaded, int total);

/// The outcome of [UploadCategoryFilesUseCase].
class CategoryFilesUpload {
  /// The URL of each file, in file order; null where its upload failed.
  final List<String?> results;

  /// The last upload failure, or null when every file uploaded.
  final Object? error;

  const CategoryFilesUpload(this.results, this.error);

  /// The URLs that uploaded, in file order.
  List<String> get urls => results.nonNulls.toList();
}

/// Uploads files into a category's storage folder (`eventId/categoryId`).
/// A failed file doesn't stop the others (see [CategoryFilesUpload.error]).
class UploadCategoryFilesUseCase {
  /// Image uploads in flight at once. Videos go one at a time: the video
  /// compressor handles a single file at a time.
  static const int _parallelImageUploads = 3;

  final EventRepository repository;
  UploadCategoryFilesUseCase(this.repository);

  Future<CategoryFilesUpload> call({
    required String eventId,
    required CategoryModel category,
    required List<File> files,
    UploadProgress? onProgress,
  }) async {
    final List<String?> results = List.filled(files.length, null);
    if (files.isEmpty) return CategoryFilesUpload(results, null);
    final String folder = '$eventId/${category.id}';
    Object? error;
    int next = 0;
    int done = 0;
    onProgress?.call(0, files.length);

    Future<void> uploadRemaining() async {
      while (next < files.length) {
        final int index = next++;
        try {
          results[index] = await repository.uploadMedia(
            folder: folder,
            file: files[index],
          );
        } catch (e) {
          error = e;
        }
        onProgress?.call(++done, files.length);
      }
    }

    final int workers = category.categoryType == CategoryEnum.videos
        ? 1
        : min(_parallelImageUploads, files.length);
    await Future.wait([for (int i = 0; i < workers; i++) uploadRemaining()]);
    return CategoryFilesUpload(results, error);
  }
}
