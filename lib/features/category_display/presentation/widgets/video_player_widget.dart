import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late final VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then(
        (_) {
          if (!mounted) return;
          setState(() => _isInitialized = true);
        },
        onError: (Object e) {
          debugPrint('Video failed to load: $e');
          if (mounted) setState(() => _hasError = true);
        },
      )
      ..play();
    _controller.addListener(_onControllerUpdate);
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    _controller.dispose();
    super.dispose();
  }

  // The controller listener rebuilds on every change, including play/pause
  // and reaching the end, so the icon always follows the real state.
  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _isInitialized
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _togglePlayPause,
                  // Keeps the video's own proportions (letterboxed on the
                  // black box) instead of stretching it to the box.
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : _hasError
              ? const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.white),
                )
              : const Center(child: CircularProgressIndicator()),
          _isInitialized
              ? Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                )
              : const SizedBox.shrink(),
          _isInitialized
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: AppColors.primaryColor,
                          bufferedColor: Colors.grey,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_controller.value.duration),
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            _formatDuration(_controller.value.position),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
