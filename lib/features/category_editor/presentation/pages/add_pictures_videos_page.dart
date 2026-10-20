import 'dart:io';
import 'dart:math';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:easy_birthday/core/widgets/general/video_thumbnail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddPicturesVideosScreen extends StatefulWidget {
  const AddPicturesVideosScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.isImagesPicker,
    required this.onAddFiles,
    required this.onDeleteFiles,
  });

  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final bool isImagesPicker;
  final void Function(CategoryModel category, List<File> files) onAddFiles;
  final void Function(CategoryModel category, List<int> indexes) onDeleteFiles;

  @override
  State<AddPicturesVideosScreen> createState() =>
      _AddPicturesVideosScreenState();
}

class _AddPicturesVideosScreenState extends State<AddPicturesVideosScreen> {
  bool lock = false;
  bool isMarkAllChecked = false;
  bool isMarkingMode = false;
  List<File> newFiles = [];
  Set<int> selectedIndexes = {};
  int canUploadFilesNumber = freeImagesLimit;

  @override
  void initState() {
    canUploadFilesNumber = getUploadLimit(widget.isImagesPicker);
    lock = widget.category.lock;
    super.initState();
  }

  void onDeleteFiles() {
    final List<int> deletedFiles = [];
    final int remoteCount = widget.category.urls?.length ?? 0;
    setState(() {
      List<int> sortedIndexes = selectedIndexes.toList()
        ..sort((a, b) => b.compareTo(a));

      for (int index in sortedIndexes) {
        if (index < remoteCount) {
          deletedFiles.add(index);
        } else {
          newFiles.removeAt(index - remoteCount);
        }
      }

      selectedIndexes.clear();
      isMarkingMode = false;
      isMarkAllChecked = false;
    });
    // Deleting uploaded files reopens this page, so only do it when some
    // were selected: otherwise the remaining unsaved picks would be dropped.
    if (deletedFiles.isNotEmpty) {
      widget.onDeleteFiles.call(widget.category, deletedFiles);
    }
  }

  Widget imageContainer(Widget child, int index) {
    return GestureDetector(
      onTap: isMarkingMode
          ? () => setState(() {
              if (selectedIndexes.contains(index)) {
                selectedIndexes.remove(index);
              } else {
                selectedIndexes.add(index);
              }

              if (selectedIndexes.length ==
                  (widget.category.urls?.length ?? 0) + newFiles.length) {
                isMarkAllChecked = true;
              } else {
                isMarkAllChecked = false;
              }

              if (selectedIndexes.isEmpty) {
                isMarkingMode = false;
              }
            })
          : null,
      child: Stack(
        children: [
          SizedBox(
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
          if (isMarkingMode || selectedIndexes.isNotEmpty)
            Positioned(
              top: -5,
              right: -5,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedIndexes.contains(index)
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: selectedIndexes.contains(index)
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ),
                width: 30,
                height: 30,
                child: selectedIndexes.contains(index)
                    ? const Icon(Icons.check, size: 20, color: Colors.white)
                    : null,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isImagesPicker = widget.isImagesPicker;
    final mediaUrls = widget.category.urls ?? [];

    return Scaffold(
      appBar: appAppBar(title: isImagesPicker ? t.add_pictures : t.add_videos),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                isImagesPicker ? t.add_pictures : t.add_videos,
                style: AppTextStyle().bigTitle,
              ),
              SvgPicture.asset(writeLetterIllustration, height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      isImagesPicker
                          ? t.add_pictures_to(
                              title: widget.category.displayTitle,
                            )
                          : t.add_videos_to(
                              title: widget.category.displayTitle,
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
                              widget.category.copyWith(titleAppear: text),
                            );
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              buttons(mediaUrls),
              kheasydevDivider(
                black: true,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              Row(
                children: [
                  Checkbox.adaptive(
                    value: isMarkAllChecked,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        isMarkAllChecked = value!;
                        if (isMarkAllChecked) {
                          selectedIndexes = List.generate(
                            mediaUrls.length + newFiles.length,
                            (index) => index,
                          ).toSet();
                          isMarkingMode = true;
                        } else {
                          selectedIndexes.clear();
                          isMarkingMode = false;
                        }
                      });
                    },
                  ),
                  Text(t.mark_all),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: mediaUrls.length + newFiles.length,
                  itemBuilder: (context, index) {
                    if (index < mediaUrls.length) {
                      final mediaUrl = mediaUrls[index];
                      return GestureDetector(
                        onLongPress: () {
                          setState(() {
                            isMarkingMode = true;
                            selectedIndexes.add(index);
                          });
                        },
                        child: imageContainer(
                          widget.isImagesPicker
                              ? imageCacheDisplay(mediaUrl)
                              : VideoThumbnailWidget(videoUrl: mediaUrl),
                          index,
                        ),
                      );
                    } else {
                      final newImageIndex = index - mediaUrls.length;
                      final newImageFile = newFiles[newImageIndex];
                      return GestureDetector(
                        onLongPress: () {
                          setState(() {
                            isMarkingMode = true;
                            selectedIndexes.add(index);
                          });
                        },
                        child: imageContainer(
                          widget.isImagesPicker
                              ? imageFileDisplay(newImageFile)
                              : VideoThumbnailWidget(videoFile: newImageFile),
                          index,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: isMarkingMode
          ? FloatingActionButton(
              onPressed: onDeleteFiles,
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.delete),
            )
          : null,
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {
          widget.onAddFiles.call(
            widget.category.copyWith(lock: lock),
            newFiles,
          );
          context.popIfPossible();
        },
        oneButton: true,
      ),
    );
  }

  Row buttons(List<String> mediaUrls) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonContainer(
          icon: Icons.add_a_photo,
          title: t.add(context: SessionService().gender),
          onTap: () async {
            final int remainingSlots =
                canUploadFilesNumber - (mediaUrls.length + newFiles.length);
            if (remainingSlots <= 0) {
              kheasydevAppToast(
                t.cant_upload_more_than(
                  context: SessionService().gender,
                  number: canUploadFilesNumber,
                ),
              );
              return;
            }

            final List<File> pickedMediaFiles = await pickMultipleFiles(
              videos: !widget.isImagesPicker,
              limit: remainingSlots,
            );

            if (pickedMediaFiles.isNotEmpty && mounted) {
              setState(() {
                // Videos can't be capped by the picker: trim here.
                newFiles.addAll(
                  pickedMediaFiles.take(
                    max(
                      0,
                      canUploadFilesNumber -
                          (mediaUrls.length + newFiles.length),
                    ),
                  ),
                );
              });
            }
          },
        ),
        buttonContainer(
          icon: lock ? Icons.lock_outline : Icons.lock_open,
          title: lock ? t.lock : t.unlock,
          onTap: () => setState(() => lock = !lock),
        ),
      ],
    );
  }

  Image imageFileDisplay(File newImageFile) {
    return Image.file(
      newImageFile,
      fit: BoxFit.cover,
      // Grid thumbnail: decode at a bounded size, not full resolution.
      cacheWidth: 400,
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

  Widget imageCacheDisplay(String mediaUrl) =>
      AppNetworkImage(url: mediaUrl, memCacheWidth: 400);

  int getUploadLimit(bool isImage) {
    final plan = SessionService().event?.planSubscribe;
    if (isImage) {
      return plan == null || plan.isFree
          ? freeImagesLimit
          : plan.isStandard
          ? standardImagesLimit
          : platinumImagesLimit;
    } else {
      return plan == null || plan.isFree
          ? freeVideosLimit
          : plan.isStandard
          ? standardVideosLimit
          : platinumVideosLimit;
    }
  }
}
