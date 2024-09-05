import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';

GenderContext getUserGender() =>
    globalUser.gender == "male" ? GenderContext.male : GenderContext.female;
