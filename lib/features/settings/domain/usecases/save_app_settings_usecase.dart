import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/settings/domain/repositories/settings_repository.dart';

class SaveAppSettingsUseCase {
  final SettingsRepository repository;
  SaveAppSettingsUseCase(this.repository);

  Future<void> call(AppSettingsModel settings) =>
      repository.saveAppSettings(settings);
}
