import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/widgets/design/display_screens_top.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/video_player_widget.dart';
import 'package:easy_birthday/widgets/general/video_thumbnail_widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

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
    final mediaUrls = widget.category.urls ?? [];

    return Scaffold(
      appBar: appAppBar(title: widget.category.titleAppear!),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DisplayScreensTop(category: widget.category),
              Expanded(
                child: GridView.builder(
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
                          ? imageCacheDisplay(mediaUrl)
                          : VideoThumbnailWidget(videoUrl: mediaUrl),
                      index,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Image imageFileDisplay(File newImageFile) {
    return Image.file(
      newImageFile,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.white,
          ),
        );
      },
    );
  }

  CachedNetworkImage imageCacheDisplay(String mediaUrl) {
    return CachedNetworkImage(
      imageUrl: mediaUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey,
        child: const Icon(
          Icons.image_not_supported,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showImageDialog(int initialIndex) {
    final Size screenSize = MediaQuery.of(context).size;
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
            child: PageView.builder(
              controller: PageController(initialPage: initialIndex),
              itemCount: widget.category.urls?.length ?? 0,
              itemBuilder: (context, index) {
                final mediaUrl = widget.category.urls![index];
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
