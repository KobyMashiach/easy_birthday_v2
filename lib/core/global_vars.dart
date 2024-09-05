import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/app_settings_model/app_settings_model.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';

PersonaModel globalUser = PersonaModel(
    name: "",
    phoneNumber: "",
    password: "",
    role: RoleModel.partner,
    registerComplete: false);

String globalAppName = "";
String globalAppVersion = "";

GenderContext globalGender = GenderContext.male;

AppSettingsModel globalAppSettings =
    AppSettingsModel(appColor: AppColors.primaryColor, languageCode: 'he');
