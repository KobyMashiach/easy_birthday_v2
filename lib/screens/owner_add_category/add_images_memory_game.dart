import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:path_provider/path_provider.dart';

import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;

class AddImagesMemoryGame extends StatefulWidget {
  final CategoryModel category;
  final Function(List<File> files) onDone;
  final VoidCallback openMemoryAgain;
  const AddImagesMemoryGame(
      {super.key,
      required this.category,
      required this.onDone,
      required this.openMemoryAgain});

  @override
  State<AddImagesMemoryGame> createState() => _AddImagesMemoryGameState();
}

class _AddImagesMemoryGameState extends State<AddImagesMemoryGame> {
  bool change = false;
  bool loading = false;
  final List<String?> _imageUrls = List.filled(6, null);

  bool get _areAllImagesUploaded => _imageUrls.every((url) => url != null);

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    if (widget.category.memoryGame != null &&
        widget.category.memoryGame!.imagesUrls.isNotEmpty) {
      final urls = widget.category.memoryGame!.imagesUrls.take(6).toList();
      setState(() {
        for (int i = 0; i < urls.length; i++) {
          _imageUrls[i] = urls[i];
        }
      });
    }
  }

  Future<void> _pickImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      change = true;
      final bytes = await image.readAsBytes();
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/picked_image_$index.png');
      await file.writeAsBytes(bytes);

      setState(() {
        _imageUrls[index] = file.path;
      });
    }
  }

  Widget _buildImageContainer(int index) {
    return GestureDetector(
      onTap: () => _pickImage(index),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: _imageUrls[index] != null && _imageUrls[index]!.isNotEmpty
            ? (_imageUrls[index]!.startsWith('http')
                ? CachedNetworkImage(
                    imageUrl: _imageUrls[index]!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image.file(
                    File(_imageUrls[index]!),
                    fit: BoxFit.cover,
                  ))
            : const Icon(Icons.add, color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.upload_images),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: loading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Text(t.memory_game, style: AppTextStyle().bigTitle),
                      SvgPicture.asset(memoryIllustrations, height: 200),
                      Text(
                        t.upload_six_images(context: globalGender),
                        style: AppTextStyle().title,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      if (widget.category.memoryGame?.lock ?? false) ...[
                        Text(t.memory_game_done(
                            context: globalGender,
                            name: globalPartnerUser!.name,
                            score: widget.category.memoryGame!.score)),
                        appButton(
                            text: t.open_new_memory_game,
                            unfillColors: true,
                            onTap: () {
                              KheasydevNavigatePage().pop(context);
                              widget.openMemoryAgain.call();
                            }),
                        const SizedBox(height: 28),
                      ],
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                            6, (index) => _buildImageContainer(index)),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonDisable: !_areAllImagesUploaded || !change,
        activeButtonOnTap: _areAllImagesUploaded || !change
            ? () async {
                final userChoice = await showDialog(
                  context: context,
                  builder: (context) => generalDialog(title: t.confirm_images),
                );
                if (userChoice == true) {
                  final List<File> imageFiles =
                      await _convertImagesToFileList();
                  KheasydevNavigatePage().pop(context);
                  widget.onDone.call(imageFiles);
                }
              }
            : null,
      ),
    );
  }

  Future<List<File>> _convertImagesToFileList() async {
    setState(() => loading = true);
    final tempDir = await getTemporaryDirectory();
    List<File> files = [];
    for (int i = 0; i < _imageUrls.length; i++) {
      if (_imageUrls[i] != null) {
        File file;
        if (_imageUrls[i]!.startsWith("http")) {
          // For online images, download and save them to the temp directory
          final response = await http.get(Uri.parse(_imageUrls[i]!));
          file = File('${tempDir.path}/image_$i.png');
          await file.writeAsBytes(response.bodyBytes);
        } else {
          // For local images, copy to the temp directory
          file = File(_imageUrls[i]!);
          await file.copy('${tempDir.path}/image_$i.png');
        }
        files.add(file);
      }
    }
    setState(() => loading = false);

    return files;
  }
}
