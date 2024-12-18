import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/core/hive/hive_functions.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/services/encryption.dart';
import 'package:easy_birthday/services/firebase/firebase_auth.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:flutter/widgets.dart';

part 'settings_screen_event.dart';
part 'settings_screen_state.dart';

class SettingsScreenBloc
    extends Bloc<SettingsScreenEvent, SettingsScreenState> {
  final AppSettingsDataSource appSettingsDB;
  final PersonaRepo personaRepo;
  final EventRepo eventRepo;
  SettingsScreenBloc(
      {required this.appSettingsDB,
      required this.personaRepo,
      required this.eventRepo})
      : super(SettingsScreenInitial()) {
    on<SettingsScreenEventInit>(_settingsScreenEventInit);
    on<SettingsScreenEventChangeColor>(_settingsScreenEventChangeColor);
    on<SettingsScreenEventOpenAppColorDialog>(
        _settingsScreenEventOpenAppColorDialog);
    on<SettingsScreenEventNavigateToAppBuildScreen>(
        _settingsScreenEventNavigateToAppBuildScreen);
    on<SettingsScreenEventNavigateToGenderChange>(
        _settingsScreenEventNavigateToGenderChange);
    on<SettingsScreenEventNavigateToAppInfo>(
        _settingsScreenEventNavigateToAppInfo);
    on<SettingsScreenEventNavigateToChangeLanguage>(
        _settingsScreenEventNavigateToChangeLanguage);
    on<SettingsScreenEventChangeLanguage>(_settingsScreenEventChangeLanguage);
    on<SettingsScreenEventChangeGender>(_settingsScreenEventChangeGender);
    on<SettingsScreenEventLogout>(_settingsScreenEventLogout);
    on<SettingsScreenEventLogoutDialog>(_settingsScreenEventLogoutDialog);
    on<SettingsScreenEventNavToChangePassword>(
        _settingsScreenEventNavToChangePassword);
    on<SettingsScreenEventChangePassword>(_settingsScreenEventChangePassword);
    on<SettingsScreenEventNavigateToChangePlan>(
        _settingsScreenEventNavigateToChangePlan);
    on<SettingsScreenEventPlanPurchase>(_settingsScreenEventPlanPurchase);
  }
  FutureOr<void> _settingsScreenEventInit(
      SettingsScreenEventInit event, Emitter<SettingsScreenState> emit) async {
    await AppSettingsDataSource.initialise();
    await PersonaDataSource.initialise();
  }

  FutureOr<void> _settingsScreenEventChangeColor(
      SettingsScreenEventChangeColor event,
      Emitter<SettingsScreenState> emit) async {
    changeAppColors(event.color);
    await appSettingsDB.updateAppSettings(
        appSettings: globalAppSettings.copyWith(appColor: event.color));
    emit(SettingsScreenNavigateToBuildAppPage());
  }

  FutureOr<void> _settingsScreenEventOpenAppColorDialog(
      SettingsScreenEventOpenAppColorDialog event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenNavigateOpenColorPicker());
  }

  FutureOr<void> _settingsScreenEventNavigateToAppBuildScreen(
      SettingsScreenEventNavigateToAppBuildScreen event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenNavigateToBuildAppPage());
  }

  FutureOr<void> _settingsScreenEventNavigateToGenderChange(
      SettingsScreenEventNavigateToGenderChange event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenNavigateToGenderChangePage());
  }

  FutureOr<void> _settingsScreenEventNavigateToAppInfo(
      SettingsScreenEventNavigateToAppInfo event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenNavigateToAppInfoPage());
  }

  FutureOr<void> _settingsScreenEventNavigateToChangeLanguage(
      SettingsScreenEventNavigateToChangeLanguage event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenNavigateToChangeLanguage());
  }

  FutureOr<void> _settingsScreenEventChangeLanguage(
      SettingsScreenEventChangeLanguage event,
      Emitter<SettingsScreenState> emit) async {
    await appSettingsDB.updateAppSettings(
        appSettings:
            globalAppSettings.copyWith(languageCode: event.languageCode));
    emit(SettingsScreenNavigateToBuildAppPage(
        seconds: 2, pageText: t.change_language));
  }

  FutureOr<void> _settingsScreenEventChangeGender(
      SettingsScreenEventChangeGender event,
      Emitter<SettingsScreenState> emit) async {
    personaRepo
        .updatePersona(globalUser.copyWith(gender: event.ownerGenerIsMale));
    changeGender(male: checkIfMaleGender(globalUser.gender));
    if (globalUser.role.isNotPartner()) {
      personaRepo.updatePartnerPersona(
          globalPartnerUser!.copyWith(gender: event.partnerGenerIsMale));
    }
  }

  FutureOr<void> _settingsScreenEventLogoutDialog(
      SettingsScreenEventLogoutDialog event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenOpenLogoutDialog());
  }

  FutureOr<void> _settingsScreenEventLogout(SettingsScreenEventLogout event,
      Emitter<SettingsScreenState> emit) async {
    await logoutFirestore();
    clearAllHiveBoxes();
    emit(SettingsScreenNavigateToLoginScreen());
  }

  FutureOr<void> _settingsScreenEventNavToChangePassword(
      SettingsScreenEventNavToChangePassword event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenNavigateToChangePassword());
  }

  FutureOr<void> _settingsScreenEventNavigateToChangePlan(
      SettingsScreenEventNavigateToChangePlan event,
      Emitter<SettingsScreenState> emit) {
    emit(SettingsScreenNavigateToChangePlan());
  }

  FutureOr<void> _settingsScreenEventChangePassword(
      SettingsScreenEventChangePassword event,
      Emitter<SettingsScreenState> emit) async {
    final encryptedPassword =
        MyEncryptionDecryption.encryptFernet(event.password).base64;
    personaRepo.updatePersona(globalUser.copyWith(password: encryptedPassword));
  }

  FutureOr<void> _settingsScreenEventPlanPurchase(
      SettingsScreenEventPlanPurchase event,
      Emitter<SettingsScreenState> emit) async {
    if (event.planTitle != null) {
      eventRepo.updateEvent(globalEvent!.copyWith(
          planSubscribe: appPlans.entries
              .firstWhere(
                  (plan) => plan.value.productPurchaseName == event.planTitle)
              .value));
    }
  }
}
