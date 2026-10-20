import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/memory_game_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_category_files_usecase.dart';

/// Saves the memory game editor: a new image set and/or the lock.
class ReplaceMemoryGameImagesUseCase {
  final EventRepository repository;
  final UploadCategoryFilesUseCase _upload;
  final UpdateCategoryUseCase _update;

  ReplaceMemoryGameImagesUseCase(this.repository)
    : _upload = UploadCategoryFilesUseCase(repository),
      _update = UpdateCategoryUseCase(repository);

  /// The game's image set becomes [keptUrls] (saved images the editor kept)
  /// plus [newFiles], uploaded here; saved images left out are then deleted
  /// from storage. Sending the saved set unchanged and no files is a
  /// lock-only change. A partial upload keeps the saved set: the new uploads
  /// are deleted and the last failure is thrown (after saving a lock change,
  /// if any). Writes go onto the latest copy of [category].
  Future<void> call({
    required String eventId,
    required CategoryModel category,
    required List<String> keptUrls,
    required List<File> newFiles,
    required bool lock,
    UploadProgress? onProgress,
  }) async {
    final upload = await _upload(
      eventId: eventId,
      category: category,
      files: newFiles,
      onProgress: onProgress,
    );
    final List<String> uploaded = upload.urls;
    final List<String> images = [...keptUrls, ...uploaded];
    final CategoryModel shown = repository.currentCategory(category);
    final bool replace =
        upload.error == null &&
        !_sameList(images, shown.memoryGame?.imagesUrls ?? const []);
    List<String> previous = const [];
    if (replace || shown.lock != lock) {
      try {
        await _update(category, (latest) {
          final MemoryGameModel? game = latest.memoryGame;
          previous = game?.imagesUrls ?? const [];
          return latest.copyWith(
            lock: lock,
            memoryGame: !replace
                ? game
                : game == null
                ? MemoryGameModel(imagesUrls: images)
                : game.copyWith(imagesUrls: images),
          );
        });
      } catch (_) {
        uploaded.forEach(_deleteInBackground);
        rethrow;
      }
    }
    final Iterable<String> orphans = replace
        ? previous.where((url) => !images.contains(url))
        : uploaded;
    orphans.forEach(_deleteInBackground);
    if (upload.error case final Object error) throw error;
  }

  static bool _sameList(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void _deleteInBackground(String url) =>
      unawaited(repository.deleteMedia(url));
}
