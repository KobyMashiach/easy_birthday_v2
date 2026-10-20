import 'package:easy_birthday/core/utils/countries/countries_list.dart';

class CountriesFunctions {
  (String? countryCode, String phone) splitPhone(String phone) {
    final dialCode = getCountryDialCode(phone);

    if (dialCode != null) {
      final splitPhone = phone.substring(dialCode.length);
      return (dialCode, splitPhone);
    }

    return (null, phone);
  }

  /// The longest matching dial code, so +1684… is American Samoa and not
  /// the +1 of Canada/US.
  String? getCountryDialCode(String phone) {
    String? best;
    for (final country in countriesList) {
      final String? dialCode = country['dial_code'];
      if (dialCode != null &&
          phone.startsWith(dialCode) &&
          dialCode.length > (best?.length ?? 0)) {
        best = dialCode;
      }
    }
    return best;
  }
}
