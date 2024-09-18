import 'package:easy_birthday/models/app_settings_model/app_settings_model.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

clearAllHiveBoxes() {
  Hive.box<AppSettingsModel>(AppSettingsModel.hiveKey).clear();
  Hive.box<PersonaModel>(PersonaModel.hiveKey).clear();
}
