import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/utils/media_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class EventRemoteDataSource {
  Future<Map<String, dynamic>?> getEvent(String eventId);
  Stream<Map<String, dynamic>?> watchEvent(String eventId);
  Future<void> createEvent(String eventId, Map<String, dynamic> data);
  Future<void> updateEvent(String eventId, Map<String, dynamic> data);
  Future<void> deleteEvent(String eventId);

  /// Rewrites the event's `categories` atomically: in a transaction, reads
  /// the latest server copy, applies [change] to it and writes the result, so
  /// a concurrent edit of another category isn't lost. [change] may run more
  /// than once (retries) and returns null to write nothing. Returns what was
  /// written, or null when [change] returned null. Throws
  /// `AppException(notFound)` when the event doesn't exist.
  Future<List<Map<String, dynamic>>?> updateCategories(
    String eventId,
    List<Map<String, dynamic>>? Function(List<Map<String, dynamic>> latest)
    change,
  );

  /// Compresses and uploads [file] to `folder/fileName`; returns its URL.
  Future<String> uploadMedia({
    required String folder,
    required String fileName,
    required File file,
  });
  Future<void> deleteMediaByUrl(String url);
  Future<void> deleteMediaFolder(String folder);
}

/// Firestore `events/{eventId}` documents and their Storage media.
class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  static const int _maxImageBytes = 500 * 1024;
  static const int _maxVideoBytes = 3 * 1024 * 1024;

  CollectionReference<Map<String, dynamic>> get _events =>
      FirebaseFirestore.instance.collection('events');

  @override
  Future<Map<String, dynamic>?> getEvent(String eventId) async =>
      (await _events.doc(eventId).get()).data();

  @override
  Stream<Map<String, dynamic>?> watchEvent(String eventId) =>
      _events.doc(eventId).snapshots().map((snapshot) => snapshot.data());

  @override
  Future<void> createEvent(String eventId, Map<String, dynamic> data) =>
      _events.doc(eventId).set(data);

  @override
  Future<void> updateEvent(String eventId, Map<String, dynamic> data) =>
      _events.doc(eventId).update(data);

  @override
  Future<void> deleteEvent(String eventId) => _events.doc(eventId).delete();

  @override
  Future<List<Map<String, dynamic>>?> updateCategories(
    String eventId,
    List<Map<String, dynamic>>? Function(List<Map<String, dynamic>> latest)
    change,
  ) async {
    final ref = _events.doc(eventId);
    bool missing = false;
    final written = await FirebaseFirestore.instance.runTransaction((
      transaction,
    ) async {
      final data = (await transaction.get(ref)).data();
      missing = data == null;
      if (data == null) return null;
      final categories = change(categoriesFromJson(data['categories']));
      if (categories != null) {
        transaction.update(ref, {'categories': categories});
      }
      return categories;
    });
    if (missing) {
      throw AppException(
        AppErrorType.notFound,
        message: 'Event $eventId not found',
      );
    }
    return written;
  }

  @override
  Future<String> uploadMedia({
    required String folder,
    required String fileName,
    required File file,
  }) async {
    final extension = file.path.split('.').last.toLowerCase();
    final bool video = isVideoFile(extension);
    final File? processed = isImageFile(extension)
        ? await resizeImageIfNeeded(file, _maxImageBytes)
        : video
        ? await compressVideoIfNeeded(file, _maxVideoBytes)
        : null;
    if (processed == null) {
      throw AppException(
        AppErrorType.invalidInput,
        message: 'Unsupported or unreadable file: $extension',
      );
    }
    if (await processed.length() > (video ? _maxVideoBytes : _maxImageBytes)) {
      throw const AppException(
        AppErrorType.invalidInput,
        message: 'File size exceeds the allowed limit',
      );
    }
    final ref = FirebaseStorage.instance.ref().child('$folder/$fileName');
    final snapshot = await ref.putFile(processed);
    return snapshot.ref.getDownloadURL();
  }

  @override
  Future<void> deleteMediaByUrl(String url) =>
      FirebaseStorage.instance.refFromURL(url).delete();

  @override
  Future<void> deleteMediaFolder(String folder) =>
      _deleteFolder(FirebaseStorage.instance.ref(folder));

  Future<void> _deleteFolder(Reference folder) async {
    final result = await folder.listAll();
    await Future.wait([
      for (final item in result.items) item.delete(),
      for (final prefix in result.prefixes) _deleteFolder(prefix),
    ]);
  }
}

/// The `categories` field of an event document as JSON maps.
List<Map<String, dynamic>> categoriesFromJson(Object? categories) => [
  for (final category in (categories as List<dynamic>?) ?? const [])
    Map<String, dynamic>.from(category as Map),
];
