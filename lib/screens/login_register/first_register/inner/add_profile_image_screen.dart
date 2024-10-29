import 'dart:io';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProfileImageScreen extends StatefulWidget {
  final Function(File image) onContinue;
  final VoidCallback onPrevious;

  const AddProfileImageScreen({
    super.key,
    required this.onContinue,
    required this.onPrevious,
  });

  @override
  _AddProfileImageScreenState createState() => _AddProfileImageScreenState();
}

class _AddProfileImageScreenState extends State<AddProfileImageScreen> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          children: [
            SvgPicture.asset(profileImageIllustrations, height: 300),
            Text(t.choose_couple_profile_image, style: AppTextStyle().title),
            const SizedBox(height: 16),
            uploadImageWidget()
          ],
        )),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonText: t.continue_,
        activeButtonDisable: image == null,
        activeButtonOnTap:
            image != null ? () => widget.onContinue.call(image!) : null,
        inactiveButtonText: t.back,
        inactiveButtonOnTap: widget.onPrevious,
      ),
    );
  }

  Stack uploadImageWidget() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          child: image != null
              ? ClipOval(
                  child: Image.file(
                    image!,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.grey[600],
                ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () async {
              final newImage = await pickSingleImage();
              if (newImage != null) {
                setState(() => image = newImage);
              }
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
              child: const Icon(
                Icons.add,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
