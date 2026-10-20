import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/features/settings/data/datasources/app_settings_local_data_source.dart';
import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final AppSettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  AppSettingsModel getAppSettings() =>
      localDataSource.getAppSettings() ??
      AppSettingsModel(
        appColor: AppColors.primaryColor,
        languageCode: defaultLanguageCode(),
      );

  @override
  Future<void> saveAppSettings(AppSettingsModel settings) async {
    await localDataSource.saveAppSettings(settings);
    SessionService().appSettings = settings;
  }
}
