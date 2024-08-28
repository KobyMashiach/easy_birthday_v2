import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/repos/app_settings_repo.dart';
import 'package:easy_birthday/services/global_vars.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final AppSettingsRepo appSettingsRepo;
  SplashScreenBloc({required this.appSettingsRepo})
      : super(SplashScreenInitial()) {
    on<SplashScreenInitialized>(_splashScreenInitialized);
  }

  FutureOr<void> _splashScreenInitialized(
      SplashScreenInitialized event, Emitter<SplashScreenState> emit) async {
    await AppSettingsDataSource.initialise();

    await AppSettingsDataSource.initialise();
    globalAppSettings = appSettingsRepo.getAppSettings();
    changeAppColors(globalAppSettings.appColor);
    emit(SplashScreenNavigationToHomeScreen());
  }
}
