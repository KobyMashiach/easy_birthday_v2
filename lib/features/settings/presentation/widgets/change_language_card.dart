import 'package:easy_birthday/core/services/session_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/i18n/language_model.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ChangeLanguageCard extends StatelessWidget {
  final LanguageModel language;
  final void Function(String languageCode) onLanguageChange;
  const ChangeLanguageCard({
    super.key,
    required this.language,
    required this.onLanguageChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: language.enable
          ? () async {
              // Hebrew is deferred-loaded: report the change once it applied.
              await changeLanguage(
                LanguageModel.getAppLocale(language.languageCode),
              );
              if (context.mounted) onLanguageChange(language.languageCode);
            }
          : null,
      title: language.enable
          ? language.languageCode == getLanguageCode()
                ? titleText(
                    text: t.selected(context: SessionService().gender),
                    color: Colors.green,
                  )
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
