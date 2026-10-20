import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/i18n/language_model.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/features/settings/presentation/widgets/change_language_card.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class ChangeLanguageScreen extends StatefulWidget {
  final void Function(String languageCode) onLanguageChange;
  const ChangeLanguageScreen({super.key, required this.onLanguageChange});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  late String languageCode = SessionService().appSettings.languageCode;

  /// Leaving without confirming undoes the live preview of the language.
  void _revertPreview() {
    if (SessionService().appSettings.languageCode != languageCode) {
      unawaited(
        changeLanguage(
          LanguageModel.getAppLocale(SessionService().appSettings.languageCode),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final languages = LanguageModel.getAllLanguages();

    return Scaffold(
      appBar: appAppBar(
        title: t.change_language,
        onBackButtonPressed: () {
          context.popIfPossible();
        },
      ),
      body: PopScope(
        // Allow back (and the iOS edge swipe); just undo the preview.
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) _revertPreview();
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
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
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonDisable:
            languageCode.isEmpty ||
            languageCode == SessionService().appSettings.languageCode,
        activeButtonOnTap:
            languageCode.isEmpty ||
                languageCode == SessionService().appSettings.languageCode
            ? null
            : () => widget.onLanguageChange.call(languageCode),
      ),
    );
  }
}
