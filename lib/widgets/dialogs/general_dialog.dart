import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kh_easy_dev/kh_easy_dev.dart';

class GeneralDialog extends StatelessWidget {
  final String title;
  final String? description;
  final String? imageSvgPath;
  final String? imagePath;
  final bool? noOkCancelButtons;
  final bool oneButton;
  final Widget? child;

  const GeneralDialog({
    super.key,
    required this.title,
    this.description,
    this.noOkCancelButtons,
    this.oneButton = false,
    this.imagePath,
    this.imageSvgPath,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return KheasydevDialog(
      primaryColor: Colors.white,
      title: title,
      description: description,
      buttons: noOkCancelButtons == true
          ? []
          : [
              GenericButtonModel(
                  text: "אישור",
                  type: GenericButtonType.elevated,
                  color: AppColors.primaryColor,
                  textStyle: AppTextStyle().bigTitle,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  }),
              if (!oneButton)
                GenericButtonModel(
                  text: "ביטול",
                  textStyle: AppTextStyle().cardTitle,
                  type: GenericButtonType.outlined,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
            ],
      child: Column(
        children: [
          if (imageSvgPath != null)
            SvgPicture.asset(imageSvgPath!, height: 200),
          if (imagePath != null) Image.asset(imagePath!, height: 200),
          if (child != null) child!,
        ],
      ),
    );
  }
}
