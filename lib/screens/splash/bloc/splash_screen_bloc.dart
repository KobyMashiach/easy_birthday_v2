import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/check_platform.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/core/persona_functions.dart';
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

    changeAppColors(globalAppSettings.appColor);
    changeLanguage(LanguageModel.getAppLocale(globalAppSettings.languageCode));
    changeGender(male: checkIfMaleGender(globalUser.gender));
    final bool isWearOs = await checkIfWearOS();
    if (globalUser.phoneNumber != "") {
      globalUser =
          await personaRepo.getPersona(phoneNumber: globalUser.phoneNumber);
      if (globalUser.eventId != null) {
        globalEvent = await eventRepo.getEventFromServer();
        if (globalUser.role != RoleModel.partner && globalEvent != null) {
          globalPartnerUser = await personaRepo.getPersona(
              phoneNumber: globalEvent!.users
                  .firstWhere((e) => e != globalUser.phoneNumber));
        }
      }

      if (globalUser.role.isNotPartner()) {
        if (globalUser.registerComplete) {
          emit(!isWearOs
              ? SplashScreenNavigationToHomeScreen()
              : SplashScreenNavigationToCategoriesWearOs());
        } else {
          emit(!isWearOs
              ? SplashScreenNavigationToFirstRegister()
              : SplashScreenNavigationToLoginWearOs());
        }
      } else {
        if (isWearOs) {
          emit(SplashScreenNavigationToLoginWearOs());
        } else {
          final event = await eventRepo.getEventFromServer();
          final partnerPhone = event!.users
              .where((user) => user != globalUser.phoneNumber)
              .first;
          final partnerUser =
              await personaRepo.getPersona(phoneNumber: partnerPhone);
          await personaRepo.updatePartnerPersona(partnerUser);
          if (globalUser.registerComplete) {
            emit(SplashScreenNavigationToHomeScreen());
          } else {
            emit(SplashScreenNavigationToFirstLoginScreen());
          }
        }
      }
    } else {
      emit(
        !isWearOs
            ? SplashScreenNavigationToLoginScreen()
            : SplashScreenNavigationToLoginWearOs(),
      );
    }
  }
}
