import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:flutter/widgets.dart';

part 'settings_screen_event.dart';
part 'settings_screen_state.dart';

class SettingsScreenBloc
    extends Bloc<SettingsScreenEvent, SettingsScreenState> {
  final AppSettingsDataSource appSettingsDB;
  final PersonaRepo personaRepo;
  SettingsScreenBloc({required this.appSettingsDB, required this.personaRepo})
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
  }
}
