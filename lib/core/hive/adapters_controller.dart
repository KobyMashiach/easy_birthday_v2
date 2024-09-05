import 'package:easy_birthday/core/hive/color_adapter.dart';
import 'package:easy_birthday/core/hive/role_adapter.dart';
import 'package:easy_birthday/models/app_settings_model/app_settings_model.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class AdaptersController {
  static void registerAdapters() {
    Hive.registerAdapter<PersonaModel>(PersonaModelAdapter());
    Hive.registerAdapter<AppSettingsModel>(AppSettingsModelAdapter());
    Hive.registerAdapter<Color>(ColorAdapter());
    Hive.registerAdapter<RoleModel>(RoleModelAdapter());
  }
}
