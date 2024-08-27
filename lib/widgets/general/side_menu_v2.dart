import 'dart:developer';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/screens/settings/setting_screen.dart';
import 'package:easy_birthday/services/package_info.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

appSideMenuV2(BuildContext context) {
  return kheasydevAppDrawerV2(
    name: "קובי",
    profileImage:
        "https://media.easy.co.il/images/UserPics/10116330_1673229445567.png",
    color: AppColor.primaryColor,
    buttomBackground: AppColor.buttomBackground,
    appBar: appAppBar(title: 'יצירת קשר'),
    context: context,
    appDetails: (globalAppName, globalAppVersion),
    buttonsTextSize: 24,
    buttons: [
      DrawerButtonModel(
        text: "home",
        icon: Icon(Icons.home),
        onTap: () => log("checl"),
      ),
      DrawerButtonModel(
        text: "settings",
        icon: Icon(Icons.settings),
        page: SettingsScreen(),
      ),
    ],
  );
}
