import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/models/language_model/language_model.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final AppSettingsDataSource appSettingsDB;
  final PersonaRepo personaRepo;
  final EventRepo eventRepo;
  SplashScreenBloc({
    required this.appSettingsDB,
    required this.personaRepo,
    required this.eventRepo,
  }) : super(SplashScreenInitial()) {
    on<SplashScreenInitialized>(_splashScreenInitialized);
  }

  FutureOr<void> _splashScreenInitialized(
      SplashScreenInitialized event, Emitter<SplashScreenState> emit) async {
    await AppSettingsDataSource.initialise();
    await PersonaDataSource.initialise();

    globalAppSettings = appSettingsDB.getAppSettings();
    globalUser = personaRepo.getLocalPersona();
    if (globalUser.role != RoleModel.partner) {
      globalPartnerUser = personaRepo.getLocalPartnerPersona();
    }

    globalEvent = await eventRepo.getEventFromServer();

    changeAppColors(globalAppSettings.appColor);
    changeLanguage(LanguageModel.getAppLocale(globalAppSettings.languageCode));
    changeGender(male: globalUser.gender == "male");
    emit(SplashScreenNavigationToHomeScreen());
  }
}
