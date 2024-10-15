import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/app_settings_model/app_settings_model.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

clearAllHiveBoxes() {
  Hive.box<AppSettingsModel>(AppSettingsModel.hiveKey).clear();
  Hive.box<PersonaModel>(PersonaModel.hiveKey).clear();
  resetAllGlobalVars();
}

removeAllStorageAndCatch() async {
  final cacheDir = await getTemporaryDirectory();

  if (cacheDir.existsSync()) {
    cacheDir.deleteSync(recursive: true);
  }
  final appDir = await getApplicationSupportDirectory();

  if (appDir.existsSync()) {
    appDir.deleteSync(recursive: true);
  }
  resetAllGlobalVars();
}

void resetAllGlobalVars() {
  globalUser = PersonaModel(
      name: "",
      phoneNumber: "",
      password: "",
      role: RoleModel.partner,
      registerComplete: false);
  globalPartnerUser = null;
  globalEvent = null;
  globalGender = GenderContext.male;
}
