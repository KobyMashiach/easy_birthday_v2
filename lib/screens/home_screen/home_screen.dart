import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/cards/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Home Screen"),
      // drawer: appSideMenu(context, index: 0),
      drawer: appSideMenuV2(context),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(t.hello),
          Text(t.greeter(context: GenderContext.male, name: "Koby")),
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
          )
        ],
      ),
    );
  }
}
