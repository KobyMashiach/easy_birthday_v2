import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Cached network image with the app's spinner and grey
/// "not available" box. Pass a cache size so it isn't decoded at full
/// resolution.
class AppNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final int? memCacheWidth;
  final int? memCacheHeight;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.memCacheWidth,
    this.memCacheHeight,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      fit: BoxFit.cover,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey,
        child: const Icon(Icons.image_not_supported, color: Colors.white),
      ),
    );
  }
}
