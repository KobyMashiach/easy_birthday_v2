import 'dart:io';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Back pressed on a root screen. Android asks to confirm and then closes the
/// app. iOS apps must never quit themselves (App Store guideline / HIG), so
/// there it does nothing.
Future<void> appOnWillPop(BuildContext context) async {
  if (Platform.isIOS) return;
  final bool exit = await kheasydevOnWillPop(
    context,
    primaryColor: AppColors.primaryColor,
    buttonBackground: AppColors.buttonBackground,
    title: t.exit_app_title,
    description: t.exit_app_description,
    yesText: t.yes,
    noText: t.no,
  );
  if (exit) await SystemNavigator.pop();
}
