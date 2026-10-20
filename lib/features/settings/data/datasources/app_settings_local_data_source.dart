import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:hive_ce/hive.dart';

abstract class AppSettingsLocalDataSource {
  AppSettingsModel? getAppSettings();
  Future<void> saveAppSettings(AppSettingsModel settings);
}

class AppSettingsLocalDataSourceImpl implements AppSettingsLocalDataSource {
  static const _key = 'current';

  Box<AppSettingsModel> get _box =>
      Hive.box<AppSettingsModel>(AppSettingsModel.hiveKey);

  // Older versions stored settings with box.add (auto-increment key).
  @override
  AppSettingsModel? getAppSettings() => _box.isEmpty ? null : _box.values.first;

  @override
  Future<void> saveAppSettings(AppSettingsModel settings) async {
    await _box.clear();
    await _box.put(_key, settings);
  }
}
