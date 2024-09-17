import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';

GenderContext getUserGender() => checkIfMaleGender(globalUser.gender)
    ? GenderContext.male
    : GenderContext.female;

String? getTranslateGender(String gender) {
  return switch (gender) {
    'male' || 'זכר' => t.male,
    'female' || 'נקבה' => t.female,
    _ => null,
  };
}

bool checkIfMaleGender(String gender) {
  return switch (gender) {
    'male' || 'זכר' => true,
    'female' || 'נקבה' => false,
    _ => true,
  };
}
