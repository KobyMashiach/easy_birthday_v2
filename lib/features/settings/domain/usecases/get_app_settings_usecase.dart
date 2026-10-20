import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/settings/domain/repositories/settings_repository.dart';

class GetAppSettingsUseCase {
  final SettingsRepository repository;
  GetAppSettingsUseCase(this.repository);

  AppSettingsModel call() => repository.getAppSettings();
}
