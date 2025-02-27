import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/screens/settings/setting_screen.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

appSideMenuV2(BuildContext context, String pageName) {
  return kheasydevAppDrawerV2(
    name: globalUser.name,
    profileImage: globalEvent?.profileImageUrl,
    color: AppColors.primaryColor,
    contactsScreenButtomBackground: AppColors.buttomBackground,
    contactsScreenDialogColor: AppColors.primaryColor,
    appBar: appAppBar(title: t.contact_us),
    context: context,
    appDetails: (globalAppName, globalAppVersion),
    languageCode: getLanguageCode(),
    buttonsTextSize: 24,
    buttons: [
      DrawerButtonModel(
        text: t.home_screen,
        enableColor: pageName == 'home',
        icon: const Icon(Icons.home),
        page: const HomeScreen(),
      ),
      DrawerButtonModel(
        text: t.settings,
        enableColor: pageName == 'settings',
        icon: const Icon(Icons.settings),
        page: const SettingsScreen(),
      ),
    ],
  );
}
