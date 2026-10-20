import 'dart:io';

import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddImagesMemoryGame extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;

  /// The game's new image set: the saved images kept ([keptUrls]) plus
  /// [newFiles] to upload.
  final void Function(
    CategoryModel category,
    List<String> keptUrls,
    List<File> newFiles,
  )
  onDone;
  final VoidCallback openMemoryAgain;
  const AddImagesMemoryGame({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
    required this.openMemoryAgain,
  });

  @override
  State<AddImagesMemoryGame> createState() => _AddImagesMemoryGameState();
}

class _AddImagesMemoryGameState extends State<AddImagesMemoryGame> {
  bool lock = false;
  bool change = false;

  /// Each slot: a saved image's URL or a picked image's local path.
  final List<String?> _imageUrls = List.filled(6, null);

  bool get _areAllImagesUploaded => _imageUrls.every((url) => url != null);

  @override
  void initState() {
    super.initState();
    lock = widget.category.lock;
    final List<String> saved = widget.category.memoryGame?.imagesUrls ?? [];
    final urls = saved.take(6).toList();
    for (int i = 0; i < urls.length; i++) {
      _imageUrls[i] = urls[i];
    }
  }

  /// The picker returns a downscaled JPEG at a new path for every pick (a
  /// reused path would make FileImage's cache show the previous image).
  Future<void> _pickImage(int index) async {
    final File? image = await pickImageImagePicker();
    if (image == null || !mounted) return;
    setState(() {
      change = true;
      _imageUrls[index] = image.path;
    });
  }

  Widget _buildImageContainer(int index) {
    final String? source = _imageUrls[index];
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
        child: source != null && source.isNotEmpty
            ? (_isSaved(source)
                  ? AppNetworkImage(url: source, memCacheWidth: 400)
                  : Image.file(
                      File(source),
                      fit: BoxFit.cover,
                      // 150pt thumbnail: decode at ~3x, not full resolution.
                      cacheWidth: 450,
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
            child: Column(
              children: [
                Text(t.memory_game, style: AppTextStyle().bigTitle),
                SvgPicture.asset(memoryIllustrations, height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        t.upload_six_images(
                          context: SessionService().gender,
                        ),
                        style: AppTextStyle().title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AddTitleDialog(
                            title: widget.category.displayTitle,
                            onInputText: (text) {
                              widget.onChangeTitle.call(
                                widget.category.copyWith(
                                  titleAppear: text,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                buttonContainer(
                  icon: lock ? Icons.lock_outline : Icons.lock_open,
                  title: lock ? t.lock : t.unlock,
                  onTap: () => setState(() {
                    lock = !lock;
                    change = true;
                  }),
                ),
                if (widget.category.memoryGame?.lock ?? false) ...[
                  Text(
                    t.memory_game_done(
                      context: SessionService().gender,
                      name: SessionService().partner?.name ?? '',
                      score: widget.category.memoryGame!.score,
                    ),
                  ),
                  appButton(
                    text: t.open_new_memory_game,
                    unfillColors: true,
                    onTap: () {
                      context.popIfPossible();
                      widget.openMemoryAgain.call();
                    },
                  ),
                  const SizedBox(height: 28),
                ],
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    6,
                    (index) => _buildImageContainer(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonDisable: !_areAllImagesUploaded || !change,
        activeButtonOnTap: _areAllImagesUploaded && change
            ? () async {
                final userChoice = await showDialog(
                  context: context,
                  builder: (context) => generalDialog(title: t.confirm_images),
                );
                if (userChoice != true || !context.mounted) return;
                final List<String> sources = _imageUrls.nonNulls.toList();
                context.popIfPossible();
                // Saved images are kept by URL, only new picks are uploaded.
                widget.onDone.call(
                  widget.category.copyWith(lock: lock),
                  sources.where(_isSaved).toList(),
                  [
                    for (final source in sources)
                      if (!_isSaved(source)) File(source),
                  ],
                );
              }
            : null,
      ),
    );
  }

  static bool _isSaved(String source) => source.startsWith('http');
}
