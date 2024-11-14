import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/widgets/design/general/button_container.dart';
import 'package:easy_birthday/widgets/general/video_thumbnail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddPicturesVideosScreen extends StatefulWidget {
  const AddPicturesVideosScreen({
    super.key,
    required this.category,
    required this.isImagesPicker,
    required this.onAddFiles,
    required this.onDeleteFiles,
  });

  final CategoryModel category;
  final bool isImagesPicker;
  final Function(CategoryModel category, List<File> files) onAddFiles;
  final Function(CategoryModel category, List<int> indexes) onDeleteFiles;

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
    List<int> deletedFiles = [];
    setState(() {
      List<int> sortedIndexes = selectedIndexes.toList()
        ..sort((a, b) => b.compareTo(a));

      for (int index in sortedIndexes) {
        if (index < widget.category.urls!.length) {
          deletedFiles.add(index);
        } else {
          newFiles.removeAt(index - widget.category.urls!.length);
        }
      }

      selectedIndexes.clear();
      isMarkingMode = false;
      isMarkAllChecked = false;
    });
    widget.onDeleteFiles.call(widget.category, deletedFiles);
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
              Text(isImagesPicker ? t.add_pictures : t.add_videos,
                  style: AppTextStyle().bigTitle),
              SvgPicture.asset(writeLetterIllustration, height: 200),
              Text(
                  isImagesPicker
                      ? t.add_pictures_to(title: widget.category.titleAppear!)
                      : t.add_videos_to(title: widget.category.titleAppear!),
                  style: AppTextStyle().title,
                  textAlign: TextAlign.center),
              buttons(mediaUrls),
              kheasydevDivider(
                  black: true,
                  padding: const EdgeInsets.symmetric(vertical: 12)),
              Row(
                children: [
                  Checkbox(
                    value: isMarkAllChecked,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        isMarkAllChecked = value!;
                        if (isMarkAllChecked) {
                          selectedIndexes = List.generate(
                              mediaUrls.length + newFiles.length,
                              (index) => index).toSet();
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
              )
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
          if (newFiles.isNotEmpty) {
            widget.onAddFiles
                .call(widget.category.copyWith(lock: lock), newFiles);
          } else {
            widget.onAddFiles.call(widget.category.copyWith(lock: lock), []);
          }
          KheasydevNavigatePage().pop(context);
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
            title: t.add(context: globalGender),
            onTap: () async {
              if ((mediaUrls.length + newFiles.length) >=
                  canUploadFilesNumber) {
                kheasydevAppToast(t.cant_upload_more_than(
                    context: globalGender, number: canUploadFilesNumber));
                return;
              }

              final List<File> pickedMediaFiles =
                  await pickMultipleFiles(videos: !widget.isImagesPicker);

              if (pickedMediaFiles.isNotEmpty) {
                setState(() {
                  int remainingSlots = canUploadFilesNumber -
                      (mediaUrls.length + newFiles.length);
                  newFiles.addAll(
                    pickedMediaFiles.take(remainingSlots),
                  );
                });
              }
            }),
        buttonContainer(
            icon: lock ? Icons.lock_outline : Icons.lock_open,
            title: lock ? t.lock : t.unlock,
            onTap: () => setState(() => lock = !lock)),
      ],
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

  int getUploadLimit(bool isImage) {
    if (isImage) {
      return globalEvent!.planSubscribe.isFree
          ? freeImagesLimit
          : globalEvent!.planSubscribe.isStandard
              ? standardImagesLimit
              : platinumImagesLimit;
    } else {
      return globalEvent!.planSubscribe.isFree
          ? freeVideosLimit
          : globalEvent!.planSubscribe.isStandard
              ? standardVideosLimit
              : platinumVideosLimit;
    }
  }
}
