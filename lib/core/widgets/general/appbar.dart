import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/app_router.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

AppBar appAppBar({
  required String title,
  List<Widget>? actions,
  VoidCallback? onBackButtonPressed,
  BuildContext? context,
}) {
  return kheasydevAppBar(
    title: title,
    logoPath: 'assets/logo.png',
    primaryColor: AppColors.primaryColor,
    shadowColor: AppColors.shadowColor,
    titleColor: Colors.white,
    actions: actions,
    developerRoute: SessionService().user.role.isAdmin()
        ? Routing.developer
        : null,
    leading: onBackButtonPressed != null
        ? IconButton(
            tooltip: t.back,
            onPressed: onBackButtonPressed,
            icon: const Icon(Icons.arrow_back),
          )
        : null,
    context: context ?? rootNavigatorKey.currentContext,
  );
}
