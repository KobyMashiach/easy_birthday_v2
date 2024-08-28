import 'package:easy_birthday/i18n/strings.g.dart';

changeLanguage(AppLocale lang) {
  LocaleSettings.setLocale(lang);
}

getLanguageCode() => LocaleSettings.currentLocale.languageCode;

Map<String, Map<String, String>> getAllLanguages() {
  return {
    'he': {"name": "עברית", "flag": "israel"},
    'en': {"name": "English", "flag": "usa"},
  };
}
