import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatefulWidget {
  final String? videoUrl;
  final File? videoFile;

  const VideoThumbnailWidget({super.key, this.videoUrl, this.videoFile})
    : assert(
        videoUrl != null || videoFile != null,
        'Either videoUrl or videoFile must be provided',
      );

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  Uint8List? _thumbnail;
  bool _failed = false;
  final CacheManager _cacheManager = DefaultCacheManager();

  String? get _videoPath => widget.videoUrl ?? widget.videoFile?.path;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  @override
  void didUpdateWidget(VideoThumbnailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // List items get reused: regenerate when this slot shows another video.
    final String? oldPath = oldWidget.videoUrl ?? oldWidget.videoFile?.path;
    if (oldPath != _videoPath) {
      // build() runs right after didUpdateWidget, no setState needed.
      _thumbnail = null;
      _failed = false;
      _generateThumbnail();
    }
  }

  Future<void> _generateThumbnail() async {
    final String? videoPath = _videoPath;
    if (videoPath == null) return;
    // The path itself: hashCode can collide and show another video's frame.
    final String cacheKey = 'video_thumbnail:$videoPath';

    Uint8List? thumbnail;
    try {
      final FileInfo? cached = await _cacheManager.getFileFromCache(cacheKey);
      thumbnail = await cached?.file.readAsBytes();
    } catch (e) {
      debugPrint('Video thumbnail cache read failed for $videoPath: $e');
    }
    if (thumbnail == null) {
      try {
        thumbnail = await VideoThumbnail.thumbnailData(
          video: videoPath,
          imageFormat: ImageFormat.PNG,
          maxWidth: 128,
          quality: 75,
        );
      } catch (e) {
        debugPrint('Video thumbnail failed for $videoPath: $e');
      }
      if (thumbnail != null) {
        // Caching is best effort; showing the thumbnail doesn't wait for it.
        unawaited(
          _cacheManager
              .putFile(cacheKey, thumbnail, fileExtension: 'png')
              .then<void>(
                (_) {},
                onError: (Object e) =>
                    debugPrint('Video thumbnail cache write failed: $e'),
              ),
        );
      }
    }
    // Ignore a late result for a video this widget no longer shows.
    if (!mounted || videoPath != _videoPath) return;
    setState(() {
      _thumbnail = thumbnail;
      _failed = thumbnail == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_thumbnail case final Uint8List thumbnail) {
      return Image.memory(thumbnail, fit: BoxFit.cover, gaplessPlayback: true);
    }
    return Center(
      // No endless spinner when the frame can't be extracted.
      child: _failed
          ? const Icon(Icons.videocam_outlined, color: Colors.grey)
          : const CircularProgressIndicator(),
    );
  }
}
