import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:flutter/widgets.dart';

part 'first_register_event.dart';
part 'first_register_state.dart';

class FirstRegisterBloc extends Bloc<FirstRegisterEvent, FirstRegisterState> {
  final PersonaRepo personaRepo;
  final AppSettingsDataSource appSettingLocalDb;
  final EventRepo eventRepo;
  FirstRegisterBloc({
    required this.personaRepo,
    required this.appSettingLocalDb,
    required this.eventRepo,
  }) : super(FirstRegisterInitial()) {
    on<FirstRegisterEventOwnDetails>(_firstRegisterEventOwnDetails);
    on<FirstRegisterEventPartnerDetails>(_firstRegisterEventPartnerDetails);
    on<FirstRegisterEventChooseColor>(_firstRegisterEventChooseColor);
  }

  FutureOr<void> _firstRegisterEventOwnDetails(
      FirstRegisterEventOwnDetails event, Emitter<FirstRegisterState> emit) {
    personaRepo.updatePersona(event.persona);
  }

  FutureOr<void> _firstRegisterEventPartnerDetails(
      FirstRegisterEventPartnerDetails event,
      Emitter<FirstRegisterState> emit) {
    final eventId = globalUser.eventId;
    personaRepo.newPartnerPersona(event.persona);
    eventRepo.buildEvent();
    if (eventId != null && globalUser.eventId != eventId) {
      personaRepo.updatePersona(globalUser);
      personaRepo.updatePartnerPersona(globalPartnerUser!);
    }
  }

  FutureOr<void> _firstRegisterEventChooseColor(
      FirstRegisterEventChooseColor event,
      Emitter<FirstRegisterState> emit) async {
    changeAppColors(event.color);
    await appSettingLocalDb.updateAppSettings(
        appSettings: globalAppSettings.copyWith(appColor: event.color));
    eventRepo.updateEvent(globalEvent!.copyWith(appColor: event.color));
  }
}
