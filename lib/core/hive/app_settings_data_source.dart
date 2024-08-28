import 'package:easy_birthday/models/app_settings_model/app_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSettingsDataSource {
  static const _boxKey = AppSettingsModel.hiveKey;

  static Future initialise() async {
    if (!Hive.isBoxOpen(_boxKey)) {
      await Hive.openBox<AppSettingsModel>(_boxKey);
    }
  }

  Future addNewAppSettings({required AppSettingsModel appSettings}) async {
    final box = Hive.box<AppSettingsModel>(_boxKey);
    await box.add(appSettings);
  }

  Future updateAppSettings({required AppSettingsModel appSettings}) async {
    final box = Hive.box<AppSettingsModel>(_boxKey);
    box.clear();
    await box.add(appSettings);
  }

  AppSettingsModel getAppSettings() {
    final box = Hive.box<AppSettingsModel>(_boxKey);
    final appSettings = box.values.map((e) => e).toList();

    return appSettings.isNotEmpty
        ? appSettings.first
        : AppSettingsModel(appColor: Colors.red);
  }

  Future clearAppSettings() async {
    final box = Hive.box<AppSettingsModel>(_boxKey);
    await box.clear();
  }
}
