import 'package:easy_birthday/core/utils/i18n/strings.g.dart';

enum LanguageCodeEnum { he, en, ar, ru, fr }

class LanguageModel {
  final String languageCode;
  final String name;
  final String flag;
  final bool enable;

  const LanguageModel({
    required this.languageCode,
    required this.name,
    required this.flag,
    required this.enable,
  });

  static List<LanguageModel> getAllLanguages() {
    return languages.values.toList();
  }

  static AppLocale getAppLocale(String languageCode) {
    return switch (languageCode) {
      "he" => AppLocale.he,
      "en" => AppLocale.en,
      _ => AppLocale.en,
    };
  }
}

const Map<LanguageCodeEnum, LanguageModel> languages = {
  LanguageCodeEnum.he: LanguageModel(
    languageCode: "he",
    name: "עברית",
    flag: "israel",
    enable: true,
  ),
  LanguageCodeEnum.en: LanguageModel(
    languageCode: "en",
    name: "English",
    flag: "usa",
    enable: true,
  ),
  LanguageCodeEnum.ar: LanguageModel(
    languageCode: "ar",
    name: "العربية",
    flag: "druze",
    enable: false,
  ),
  LanguageCodeEnum.ru: LanguageModel(
    languageCode: "ru",
    name: "Русский",
    flag: "russia",
    enable: false,
  ),
  LanguageCodeEnum.fr: LanguageModel(
    languageCode: "fr",
    name: "Français",
    flag: "france",
    enable: false,
  ),
};
