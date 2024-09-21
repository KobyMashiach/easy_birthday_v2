import 'package:flutter/widgets.dart';
import 'package:kh_easy_dev/widgets/general/dialog_v2.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/i18n/strings.g.dart';

Widget GeneralDialog({
  required final String title,
  final String? description,
  final bool shouldDisplayX = true,
  final Color? backgroundColor,
  final Color? primaryColor,
  final Color? buttonsTextColor,
  final double? buttonsTextSize,
  final double? titleTextSize,
  final double? descriptionTextSize,
  final bool oneButton = false,
  final bool noButtons = false,
  final List<Widget>? buttons,
  final String? okButtonText,
  final String? cancelButtonText,
  final bool childBeforeTitle = false,
  final Widget? child,
  final double? height,
  final double? width,
  final VoidCallback? okButtonOnTap,
}) {
  return KhEasydevDialogV2(
    title: title,
    description: description,
    shouldDisplayX: shouldDisplayX,
    backgroundColor: backgroundColor,
    primaryColor: primaryColor ?? AppColors.primaryColor,
    buttonsTextColor: buttonsTextColor,
    buttonsTextSize: buttonsTextSize,
    titleTextSize: titleTextSize ?? 24,
    descriptionTextSize: descriptionTextSize ?? 20,
    oneButton: oneButton,
    noButtons: noButtons,
    buttons: buttons,
    okButtonText: okButtonText ?? t.ok,
    cancelButtonText: cancelButtonText ?? t.cancel,
    childBeforeTitle: childBeforeTitle,
    child: child,
    height: height,
    width: width,
    okButtonOnTap: okButtonOnTap,
  );
}
