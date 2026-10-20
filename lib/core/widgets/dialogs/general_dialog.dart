import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/design_kit/dialogs.dart';
import 'package:flutter/widgets.dart';

Widget generalDialog({
  String? title,
  String? description,
  bool oneButton = false,
  bool noButtons = false,
  List<Widget>? buttons,
  String? okButtonText,
  bool childBeforeTitle = false,
  Widget? child,
  double? height,
  double? width,
  VoidCallback? okButtonOnTap,
}) {
  return KhEasydevDialogV2(
    title: title,
    description: description,
    primaryColor: AppColors.primaryColor,
    titleTextSize: 24,
    descriptionTextSize: 20,
    oneButton: oneButton,
    noButtons: noButtons,
    buttons: buttons,
    okButtonText: okButtonText ?? t.ok,
    cancelButtonText: t.cancel,
    childBeforeTitle: childBeforeTitle,
    height: height,
    width: width,
    okButtonOnTap: okButtonOnTap,
    child: child,
  );
}
