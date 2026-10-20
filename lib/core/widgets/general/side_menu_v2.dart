import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

Widget appSideMenuV2(BuildContext context, String pageName) {
  return kheasydevAppDrawerV2(
    name: SessionService().user.name,
    profileImage: SessionService().event?.profileImageUrl,
    color: AppColors.primaryColor,
    context: context,
    appDetails: (SessionService().appName, SessionService().appVersion),
    buttonsTextSize: 24,
    buttons: [
      DrawerButtonModel(
        text: t.home_screen,
        enableColor: pageName == 'home',
        icon: const Icon(Icons.home),
        routeName: Routing.home,
      ),
      DrawerButtonModel(
        text: t.settings,
        enableColor: pageName == 'settings',
        icon: const Icon(Icons.settings),
        routeName: Routing.settings,
      ),
    ],
  );
}
