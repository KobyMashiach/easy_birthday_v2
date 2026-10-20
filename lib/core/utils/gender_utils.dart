import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';

/// Partner's grammatical gender; male when there is no partner yet.
GenderContext getPartnerGender() =>
    checkIfMaleGender(SessionService().partner?.gender ?? '')
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
