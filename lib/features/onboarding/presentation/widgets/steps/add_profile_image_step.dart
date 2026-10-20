import 'dart:io';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProfileImageScreen extends StatefulWidget {
  final void Function(File image) onContinue;
  final VoidCallback onPrevious;

  const AddProfileImageScreen({
    super.key,
    required this.onContinue,
    required this.onPrevious,
  });

  @override
  State<AddProfileImageScreen> createState() => _AddProfileImageScreenState();
}

class _AddProfileImageScreenState extends State<AddProfileImageScreen> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) widget.onPrevious();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // Scrolls on short screens; looks the same when everything fits.
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(profileImageIllustrations, height: 300),
                Text(
                  t.choose_couple_profile_image,
                  style: AppTextStyle().title,
                ),
                const SizedBox(height: 16),
                uploadImageWidget(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AppButtonsBottomNavigationBar(
          activeButtonText: t.continue_,
          activeButtonDisable: image == null,
          activeButtonOnTap: image != null
              ? () => widget.onContinue.call(image!)
              : null,
          inactiveButtonText: t.back,
          inactiveButtonOnTap: widget.onPrevious,
        ),
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
                    cacheWidth: (120 * MediaQuery.devicePixelRatioOf(context))
                        .round(),
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(Icons.person, size: 60, color: Colors.grey[600]),
        ),
        PositionedDirectional(
          end: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () async {
              final newImage = await pickImageImagePicker();
              if (newImage != null && mounted) {
                setState(() => image = newImage);
              }
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.add, size: 24, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
