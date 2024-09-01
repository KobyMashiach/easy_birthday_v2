import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';

isAdmin() => globalUser.role == "admin";
isOwner() => globalUser.role == "owner";
isPartner() => globalUser.role == "partner";

GenderContext getUserGender() =>
    globalUser.gender == "male" ? GenderContext.male : GenderContext.female;
