import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/dev/developer_screen.dart';
import 'package:easy_birthday/main.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

appAppBar({
  required String title,
  List<Widget>? actions,
  Widget? developerPage,
  VoidCallback? onBackButtonPreesed,
  BuildContext? context,
  (String, Function(String))? searchAppBar,
}) {
  return kheasydevAppBar(
    title: title,
    logoPath: 'assets/logo.png',
    primaryColor: AppColors.primaryColor,
    shadowColor: AppColors.shadowColor,
    titleColor: Colors.white,
    actions: actions,
    developerPage: developerPage ?? DeveloperScreen(),
    leading: onBackButtonPreesed != null
        ? IconButton(
            onPressed: onBackButtonPreesed, icon: Icon(Icons.arrow_back))
        : null,
    context: context ?? NavigationContextService.navigatorKey.currentContext,
    searchAppBar: searchAppBar,
  );
}
