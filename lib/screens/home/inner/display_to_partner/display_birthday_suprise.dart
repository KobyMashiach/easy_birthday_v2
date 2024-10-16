import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/widgets/design/display_screens_top.dart';
import 'package:flutter/material.dart';

import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

class DisplayBirthdaySuprise extends StatefulWidget {
  const DisplayBirthdaySuprise({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<DisplayBirthdaySuprise> createState() => _DisplayBirthdaySupriseState();
}

class _DisplayBirthdaySupriseState extends State<DisplayBirthdaySuprise> {
  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    items = supriseMapToWidgets(widget.category.supriseMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: widget.category.titleAppear!),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DisplayScreensTop(category: widget.category),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => items[index],
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemCount: items.length)
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
                return imageCacheDisplay(mediaUrl);
              },
            ),
          ),
        );
      },
    );
  }
}
