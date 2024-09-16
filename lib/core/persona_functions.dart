import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';

GenderContext getUserGender() =>
    globalUser.gender == "male" ? GenderContext.male : GenderContext.female;

String? getTranslateGender(String gender) {
  return switch (gender) {
    'male' || 'זכר' => t.male,
    'female' || 'נקבה' => t.female,
    _ => null,
  };
}
