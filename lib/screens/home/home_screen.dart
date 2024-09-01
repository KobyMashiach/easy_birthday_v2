import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.home_screen),
      drawer: appSideMenuV2(context, 'home'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(t.hello),
          Text(t.greeter(context: globalGender, name: "Koby")),
          const SizedBox(height: 20),
          AppButton(
            text: "Change to english",
            onTap: () {
              changeLanguage(AppLocale.en);
            },
          ),
          const SizedBox(height: 20),
          AppButton(
            text: "Change to hebrew",
            onTap: () {
              changeLanguage(AppLocale.he);
            },
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            // width: 200,
            child: Row(
              children: [
                Expanded(child: Container(color: AppColors.primaryColor)),
                Expanded(child: Container(color: AppColors.shadowColor)),
                Expanded(child: Container(color: AppColors.disableColor)),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
