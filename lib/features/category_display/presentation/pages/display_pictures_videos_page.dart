import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/video_thumbnail_widget.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screen_layout.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/video_player_widget.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

class DisplayPicturesVideosScreen extends StatefulWidget {
  const DisplayPicturesVideosScreen({
    super.key,
    required this.category,
    required this.isImages,
  });

  final CategoryModel category;
  final bool isImages;

  @override
  State<DisplayPicturesVideosScreen> createState() =>
      _DisplayPicturesVideosScreenState();
}

class _DisplayPicturesVideosScreenState
    extends State<DisplayPicturesVideosScreen> {
  List<String> get _mediaUrls => widget.category.urls ?? const [];

  int get _screenCacheWidth =>
      (MediaQuery.sizeOf(context).width *
              MediaQuery.devicePixelRatioOf(context))
          .round();

  Widget imageContainer(Widget child, int index) {
    return GestureDetector(
      onTap: () => _showImageDialog(index),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaUrls = _mediaUrls;
    return Scaffold(
      appBar: appAppBar(
        title: widget.category.displayTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: DisplayScreenLayout(
          category: widget.category,
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: mediaUrls.length,
            itemBuilder: (context, index) {
              final mediaUrl = mediaUrls[index];
              return imageContainer(
                widget.isImages
                    ? imageCacheDisplay(mediaUrl, thumbnail: true)
                    : VideoThumbnailWidget(videoUrl: mediaUrl),
                index,
              );
            },
          ),
        ),
      ),
    );
  }

  // Decode at most at screen size: grid thumbnails are small and the dialog
  // is never wider than the screen.
  Widget imageCacheDisplay(String mediaUrl, {bool thumbnail = false}) =>
      AppNetworkImage(
        url: mediaUrl,
        memCacheWidth: thumbnail ? 400 : _screenCacheWidth,
      );

  void _showImageDialog(int initialIndex) {
    final Size screenSize = MediaQuery.sizeOf(context);
    showDialog(
      context: context,
      builder: (context) {
        return generalDialog(
          title: "",
          noButtons: true,
          child: Container(
            width: screenSize.width,
            height: screenSize.height * 0.7,
            padding: const EdgeInsets.all(12),
            child: _MediaPager(
              initialIndex: initialIndex,
              itemCount: _mediaUrls.length,
              itemBuilder: (context, index) {
                final mediaUrl = _mediaUrls[index];
                return widget.isImages
                    ? imageCacheDisplay(mediaUrl)
                    : VideoPlayerWidget(videoUrl: mediaUrl);
              },
            ),
          ),
        );
      },
    );
  }
}

/// PageView that owns (and disposes) its PageController.
class _MediaPager extends StatefulWidget {
  final int initialIndex;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  const _MediaPager({
    required this.initialIndex,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<_MediaPager> createState() => _MediaPagerState();
}

class _MediaPagerState extends State<_MediaPager> {
  late final PageController _controller = PageController(
    initialPage: widget.initialIndex,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
