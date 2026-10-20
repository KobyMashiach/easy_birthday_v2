import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

bool isImageFile(String extension) {
  const imageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'bmp',
    'webp',
    'heic',
    'heif',
  ];
  return imageExtensions.contains(extension);
}

bool isVideoFile(String extension) {
  const videoExtensions = ['mp4', 'mov', 'avi', 'mkv', 'flv', 'wmv', 'webm'];
  return videoExtensions.contains(extension);
}

Future<File?> resizeImageIfNeeded(File imageFile, int maxSize) async {
  if (await imageFile.length() <= maxSize) return imageFile;

  final String path = imageFile.path;
  // Decoding/encoding a 12MP photo takes seconds: keep it off the UI isolate.
  final Uint8List? resizedBytes = await Isolate.run(
    () => _shrinkJpeg(path, maxSize),
  );
  if (resizedBytes == null) return null;

  final Directory tempDir = await getTemporaryDirectory();
  final String baseName = path.split('/').last.split('.').first;
  final File resizedFile = File(
    '${tempDir.path}/resized_${DateTime.now().microsecondsSinceEpoch}_$baseName.jpg',
  );
  await resizedFile.writeAsBytes(resizedBytes);
  return resizedFile;
}

/// Downscales to at most [_maxImageDimension] px on the long edge, then lowers
/// JPEG quality until the result fits in [maxSize] bytes.
const int _maxImageDimension = 1600;

Uint8List? _shrinkJpeg(String path, int maxSize) =>
    shrinkImageBytes(File(path).readAsBytesSync(), maxSize);

/// Returns a JPEG of [bytes] that fits in [maxSize] bytes, or null when the
/// format can't be decoded. Shrinking resolution first is what guarantees a
/// fit: lowering quality alone left big photos over the limit, and those
/// uploads used to be saved as empty (broken) image URLs.
@visibleForTesting
Uint8List? shrinkImageBytes(Uint8List bytes, int maxSize) {
  img.Image? image = img.decodeImage(bytes);
  if (image == null) return null;
  image = img.bakeOrientation(image);

  for (int dimension = _maxImageDimension; dimension >= 400; dimension ~/= 2) {
    final img.Image resized = image.width >= image.height
        ? (image.width > dimension
              ? img.copyResize(image, width: dimension)
              : image)
        : (image.height > dimension
              ? img.copyResize(image, height: dimension)
              : image);
    for (int quality = 85; quality >= 40; quality -= 15) {
      final bytes = img.encodeJpg(resized, quality: quality);
      if (bytes.lengthInBytes <= maxSize) return bytes;
    }
  }
  return null;
}

/// Returns [videoFile] when it already fits in [maxSize]; otherwise compresses
/// it (medium quality, then low) and returns the first result that fits, or
/// the smallest attempt. Null when the compressor fails. Each attempt starts
/// from the original so quality isn't lost twice.
Future<File?> compressVideoIfNeeded(File videoFile, int maxSize) async {
  if (await videoFile.length() <= maxSize) return videoFile;

  // The plugin runs a single compression at a time and throws when a second
  // one starts (e.g. two uploads started back to back), so queue them.
  final Future<void> previous = _videoCompressionQueue;
  final Completer<void> done = Completer<void>();
  _videoCompressionQueue = done.future;
  try {
    await previous;
    return await _compressVideo(videoFile, maxSize);
  } finally {
    done.complete();
  }
}

Future<void> _videoCompressionQueue = Future<void>.value();

Future<File?> _compressVideo(File videoFile, int maxSize) async {
  File? compressed;
  for (final VideoQuality quality in const [
    VideoQuality.MediumQuality,
    VideoQuality.LowQuality,
  ]) {
    final MediaInfo? info = await VideoCompress.compressVideo(
      videoFile.path,
      quality: quality,
      deleteOrigin: false,
    );
    final String? path = info?.path;
    if (path == null) return null;
    // On Android the plugin writes to app storage that is never cleared, so
    // an attempt that is replaced by a smaller one is deleted right away (the
    // plugin may reuse the same name within one second).
    if (compressed != null && compressed.path != path) {
      unawaited(_deleteQuietly(compressed));
    }
    compressed = File(path);
    if (await compressed.length() <= maxSize) break;
  }
  return compressed;
}

Future<void> _deleteQuietly(File file) async {
  try {
    await file.delete();
  } catch (_) {}
}
