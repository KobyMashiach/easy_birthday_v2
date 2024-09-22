import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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
  const AddPicturesVideosScreen(
      {super.key,
      required this.category,
      required this.isImagesPicker,
      required this.onAddFiles});

  final CategoryModel category;
  final bool isImagesPicker;
  final Function(CategoryModel category, List<File> files) onAddFiles;

  @override
  State<AddPicturesVideosScreen> createState() =>
      _AddPicturesVideosScreenState();
}

class _AddPicturesVideosScreenState extends State<AddPicturesVideosScreen> {
  List<File> newFiles = [];
  Set<int> selectedIndexes = {};

  bool isMarkingMode = false;
  bool isMarkAllChecked = false;

  Widget imageContainer(Widget child, int index) {
    return GestureDetector(
      onTap: isMarkingMode
          ? () {
              setState(() {
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
              });
            }
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
                      ? Colors.blue // Checked state color
                      : Colors.transparent, // Unchecked state color
                  border: Border.all(
                    color: selectedIndexes.contains(index)
                        ? Colors.blue
                        : Colors.grey, // Border color for unchecked state
                  ),
                ),
                width: 30, // Circle size
                height: 30,
                child: selectedIndexes.contains(index)
                    ? Icon(Icons.check,
                        size: 20,
                        color: Colors.white) // Checkmark icon when selected
                    : null, // No icon when not selected
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
              kheasydevDivider(
                  black: true,
                  padding: const EdgeInsets.symmetric(vertical: 12)),
              Row(
                children: [
                  Checkbox(
                    value: isMarkAllChecked,
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          CachedNetworkImage(
                            imageUrl: mediaUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey,
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
                          Image.file(
                            newImageFile,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey,
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
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
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {
          if (newFiles.isNotEmpty) {
            widget.onAddFiles.call(widget.category, newFiles);
          }
          KheasydevNavigatePage().pop(context);
        },
        inactiveButtonText: t.add(context: globalGender),
        inactiveButtonOnTap: () async {
          final List<File> pickedMediaFiles = await pickMultipleFiles();
          if (pickedMediaFiles.isNotEmpty) {
            setState(() {
              newFiles.addAll(pickedMediaFiles);
            });
          }
        },
      ),
    );
  }
}
