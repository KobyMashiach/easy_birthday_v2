import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/language_model/language_model.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/cards/change_language_card.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class ChangeLanguageScreen extends StatefulWidget {
  final Function(String languageCode) onLanguageChange;
  const ChangeLanguageScreen({super.key, required this.onLanguageChange});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String languageCode = '';
  @override
  Widget build(BuildContext context) {
    final languages = LanguageModel.getAllLanguages();

    return Scaffold(
      appBar: appAppBar(
          title: t.change_language,
          onBackButtonPreesed: () {
            if (globalAppSettings.languageCode != languageCode) {
              changeLanguage(
                  LanguageModel.getAppLocale(globalAppSettings.languageCode));
              KheasydevNavigatePage().pop(context);
            }
          }),
      body: PopScope(
        canPop: false,
        child: Padding(
          padding: const EdgeInsets.all(24),
          // child: Container(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final language = languages[index];
              return ChangeLanguageCard(
                language: language,
                onLanguageChange: (languageCodeVal) {
                  setState(() {
                    languageCode = languageCodeVal;
                  });
                },
              );
            },
            separatorBuilder: (context, index) => kheasydevDivider(black: true),
            itemCount: languages.length,
          ),
          // ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () => widget.onLanguageChange.call(languageCode),
      ),
    );
  }
}
