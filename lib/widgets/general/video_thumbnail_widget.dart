import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class VideoThumbnailWidget extends StatefulWidget {
  final String? videoUrl;
  final File? videoFile;

  const VideoThumbnailWidget({super.key, this.videoUrl, this.videoFile})
      : assert(videoUrl != null || videoFile != null,
            'Either videoUrl or videoFile must be provided');

  @override
  _VideoThumbnailWidgetState createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  Uint8List? _thumbnail;
  final CacheManager _cacheManager = DefaultCacheManager();

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    String? videoPath;

    if (widget.videoUrl != null) {
      videoPath = widget.videoUrl;
    } else if (widget.videoFile != null) {
      videoPath = widget.videoFile!.path;
    }

    if (videoPath != null) {
      final cacheKey = videoPath.hashCode.toString();

      final cachedFile = await _cacheManager.getFileFromCache(cacheKey);
      if (cachedFile != null && mounted) {
        setState(() {
          _thumbnail = cachedFile.file.readAsBytesSync();
        });
        return;
      }

      final thumbnail = await VideoThumbnail.thumbnailData(
        video: videoPath,
        imageFormat: ImageFormat.PNG,
        maxWidth: 128,
        quality: 75,
      );

      if (thumbnail != null) {
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/$cacheKey.png';
        final file = File(filePath)..writeAsBytesSync(thumbnail);
        await _cacheManager.putFile(cacheKey, file.readAsBytesSync());

        if (mounted) {
          setState(() {
            _thumbnail = thumbnail;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _thumbnail != null
        ? Image.memory(
            _thumbnail!,
            fit: BoxFit.cover,
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
