import 'package:easy_birthday/services/countries_list.dart';

class CountriesFunctions {
  (String? countryCode, String phone) splitPhone(String phone) {
    final dialCode = getCountryDialCode(phone);

    if (dialCode != null) {
      final splitPhone = phone.substring(dialCode.length);
      return (dialCode, splitPhone);
    }

    return (null, phone);
  }

  String? getCountryDialCode(String phone) {
    for (var country in countriesList) {
      final dialCode = country['dial_code'];
      if (phone.startsWith(dialCode ?? "null")) {
        return dialCode;
      }
    }
    return null;
  }
}
