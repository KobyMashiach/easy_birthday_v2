import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_button.dart';

Widget appButton({
  VoidCallback? onTap,
  required String text,
  bool unfillColors = false,
  bool disableColors = false,
  EdgeInsets? padding,
  EdgeInsets? margin,
  double? textSize,
}) {
  return kheasydevAppButton(
    text: text,
    onTap: onTap,
    unfillColors: unfillColors,
    disableColors: disableColors,
    margin: margin ?? EdgeInsets.zero,
    textSize: textSize,
    padding: padding,
    primaryColor: AppColors.primaryColor,
  );
}
