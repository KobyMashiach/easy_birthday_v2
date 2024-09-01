import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/language_model/language_model.dart';
import 'package:easy_birthday/widgets/cards/change_language_card.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final languages = LanguageModel.getAllLanguages();

    return Scaffold(
      appBar: appAppBar(title: t.change_language),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final language = languages[index];
              return ChangeLanguageCard(
                language: language,
                onLanguageChange: () => setState(() {}),
              );
            },
            separatorBuilder: (context, index) => kheasydevDivider(black: true),
            itemCount: languages.length,
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonText: t.back,
      ),
    );
  }
}
