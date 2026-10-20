import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';

abstract class SettingsRepository {
  /// Saved settings, or defaults when nothing is saved yet.
  AppSettingsModel getAppSettings();

  /// Updates the session, then saves locally.
  Future<void> saveAppSettings(AppSettingsModel settings);
}
