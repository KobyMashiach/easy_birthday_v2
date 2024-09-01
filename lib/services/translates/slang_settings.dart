import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';

changeLanguage(AppLocale lang) {
  LocaleSettings.setLocale(lang);
}

changeGender({required bool male}) =>
    globalGender = male ? GenderContext.male : GenderContext.female;

getLanguageCode() => LocaleSettings.currentLocale.languageCode;
