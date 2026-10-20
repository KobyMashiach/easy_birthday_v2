import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screen_layout.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

class DisplayBirthdaySurprise extends StatefulWidget {
  const DisplayBirthdaySurprise({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<DisplayBirthdaySurprise> createState() =>
      _DisplayBirthdaySurpriseState();
}

class _DisplayBirthdaySurpriseState extends State<DisplayBirthdaySurprise> {
  late final List<Widget> items = surpriseMapToWidgets(
    widget.category.surpriseMap,
  );

  /// URL of each item that is a network image (null for texts), so images can
  /// be shown cached and opened full size.
  late final List<String?> _imageUrls = items.map(_networkImageUrl).toList();

  static String? _networkImageUrl(Widget item) {
    if (item is! Image) return null;
    // Images built with a cache size wrap their provider in a ResizeImage.
    final ImageProvider provider = switch (item.image) {
      ResizeImage(:final imageProvider) => imageProvider,
      final ImageProvider image => image,
    };
    return provider is NetworkImage ? provider.url : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(
        title: widget.category.displayTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: DisplayScreenLayout(
          category: widget.category,
          body: ListView.separated(
            itemBuilder: (context, index) {
              final String? path = _imageUrls[index];
              return GestureDetector(
                onTap: path != null ? () => _showImageDialog(path) : null,
                child: Center(
                  child: path != null ? imageCacheDisplay(path) : items[index],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: items.length,
          ),
        ),
      ),
    );
  }

  // Shown 200 high (also in the dialog); don't decode at full resolution.
  Widget imageCacheDisplay(String mediaUrl) =>
      AppNetworkImage(url: mediaUrl, height: 200, memCacheHeight: 600);

  void _showImageDialog(String mediaUrl) {
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
            child: imageCacheDisplay(mediaUrl),
          ),
        );
      },
    );
  }
}
