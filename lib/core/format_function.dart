import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

bool isImageFile(String extension) {
  const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
  return imageExtensions.contains(extension);
}

bool isVideoFile(String extension) {
  const videoExtensions = ['mp4', 'mov', 'avi', 'mkv', 'flv', 'wmv', 'webm'];
  return videoExtensions.contains(extension);
}

Future<File?> resizeImageIfNeeded(File imageFile, int maxSize) async {
  final bytes = await imageFile.readAsBytes();

  if (bytes.lengthInBytes <= maxSize) {
    return imageFile;
  }

  img.Image? image = img.decodeImage(bytes);

  if (image == null) return null;

  int quality = 100;
  Uint8List? resizedBytes;

  do {
    quality -= 10;
    resizedBytes = Uint8List.fromList(img.encodeJpg(image, quality: quality));
  } while (resizedBytes.lengthInBytes > maxSize && quality > 0);

  if (quality <= 0) return null;

  Directory tempDir = await getTemporaryDirectory();
  File resizedFile =
      File('${tempDir.path}/resized_${imageFile.path.split('/').last}');
  await resizedFile.writeAsBytes(resizedBytes);

  return resizedFile;
}

Future<File?> compressVideoIfNeeded(File videoFile, int maxSize) async {
  File compressedFile = videoFile;

  VideoQuality currentQuality = VideoQuality.MediumQuality;

  while (compressedFile.lengthSync() > maxSize) {
    final MediaInfo? compressedVideo = await VideoCompress.compressVideo(
      compressedFile.path,
      quality: currentQuality,
      deleteOrigin: false,
    );

    if (compressedVideo == null) return null;

    compressedFile = File(compressedVideo.path!);

    if (currentQuality == VideoQuality.LowQuality) break;

    currentQuality = VideoQuality.LowQuality;
  }

  return compressedFile;
}
