import 'dart:ui';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';

/// Completes once the locale is active. Hebrew is a deferred library, so the
/// first switch to it loads asynchronously: await this before rebuilding
/// widgets that read `t`.
Future<void> changeLanguage(AppLocale lang) => LocaleSettings.setLocale(lang);

void changeGender({required bool male}) =>
    SessionService().gender = male ? GenderContext.male : GenderContext.female;

String getLanguageCode() => LocaleSettings.currentLocale.languageCode;

/// Language for a user who never chose one: the device language when the app
/// supports it, otherwise Hebrew.
String defaultLanguageCode([Locale? deviceLocale]) {
  final device =
      (deviceLocale ?? PlatformDispatcher.instance.locale).languageCode;
  return AppLocale.values.any((locale) => locale.languageCode == device)
      ? device
      : AppLocale.he.languageCode;
}
