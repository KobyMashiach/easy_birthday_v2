import 'package:easy_birthday/core/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/language_model/language_model.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ChangeLanguageCard extends StatelessWidget {
  final LanguageModel language;
  final Function(String languageCode) onLanguageChange;
  const ChangeLanguageCard(
      {super.key, required this.language, required this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: language.enable
          ? () {
              changeLanguage(LanguageModel.getAppLocale(language.languageCode));
              onLanguageChange.call(language.languageCode);
            }
          : null,
      title: language.enable
          ? language.languageCode == getLanguageCode()
              ? titleText(
                  text: t.selected(context: globalGender), color: Colors.green)
              : null
          : titleText(text: t.soon, color: Colors.red),
      trailing: Text(
        language.name,
        style: language.enable
            ? AppTextStyle().description
            : AppTextStyle().description.copyWith(color: Colors.grey),
      ),
      leading: SvgPicture.asset(
        colorFilter: language.enable
            ? null
            : const ColorFilter.mode(Colors.grey, BlendMode.darken),
        width: 50,
        getFlag(language.flag),
      ),
    );
  }

  Align titleText({required String text, required Color color}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        color: color,
        child: Text(
          text,
          style: AppTextStyle().description.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
