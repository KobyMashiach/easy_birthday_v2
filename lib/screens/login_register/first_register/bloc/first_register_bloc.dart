import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/plan_model/plan_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
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
  }) : super(FirstRegisterInitial(planModel: getPlan(PlansEnum.free))) {
    on<FirstRegisterEventInit>(_firstRegisterEventInit);
    on<FirstRegisterEventOwnDetails>(_firstRegisterEventOwnDetails);
    on<FirstRegisterEventPartnerDetails>(_firstRegisterEventPartnerDetails);
    on<FirstRegisterEventChooseColor>(_firstRegisterEventChooseColor);
    on<FirstRegisterEventChooseTexts>(_firstRegisterEventChooseTexts);
    on<FirstRegisterEventPlanPurchase>(_firstRegisterEventPlanPurchase);
    on<FirstRegisterEventFinishRegister>(_firstRegisterEventFinishRegister);
  }

  FutureOr<void> _firstRegisterEventInit(
      FirstRegisterEventInit event, Emitter<FirstRegisterState> emit) async {
    await refreshEventSubscribe(emit);
  }

  FutureOr<void> _firstRegisterEventOwnDetails(
      FirstRegisterEventOwnDetails event,
      Emitter<FirstRegisterState> emit) async {
    await personaRepo.updatePersona(event.persona);
    changeGender(male: checkIfMaleGender(globalUser.gender));
  }

  FutureOr<void> _firstRegisterEventPartnerDetails(
      FirstRegisterEventPartnerDetails event,
      Emitter<FirstRegisterState> emit) async {
    final eventId = globalUser.eventId;
    await personaRepo.newPartnerPersona(event.persona);
    final checkEvent = await eventRepo.getEventFromServer();
    if (checkEvent == null) eventRepo.buildEvent();
    if (eventId != null && globalUser.eventId != eventId) {
      await personaRepo.updatePersona(globalUser);
      await personaRepo.updatePartnerPersona(globalPartnerUser!);
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

  FutureOr<void> _firstRegisterEventChooseTexts(
      FirstRegisterEventChooseTexts event,
      Emitter<FirstRegisterState> emit) async {
    eventRepo
        .updateEvent(globalEvent!.copyWith(choosenTexts: event.choosenTexts));
  }

  FutureOr<void> _firstRegisterEventPlanPurchase(
      FirstRegisterEventPlanPurchase event,
      Emitter<FirstRegisterState> emit) async {
    if (event.planTitle != null) {
      eventRepo.updateEvent(globalEvent!.copyWith(
          planSubscribe: appPlans.entries
              .firstWhere(
                  (plan) => plan.value.productPurchaseName == event.planTitle)
              .value));
      await refreshEventSubscribe(emit);
    }
  }

  Future<void> refreshEventSubscribe(Emitter<FirstRegisterState> emit) async {
    final event = await eventRepo.getEventFromServer();
    emit(FirstRegisterRefreshUI(planModel: event!.planSubscribe));
  }

  FutureOr<void> _firstRegisterEventFinishRegister(
      FirstRegisterEventFinishRegister event,
      Emitter<FirstRegisterState> emit) async {
    await personaRepo
        .updatePersona(globalUser.copyWith(registerComplete: true));
    final event = await eventRepo.getEventFromServer();
    emit(FirstRegisterStateNavHomeScreen(planModel: event!.planSubscribe));
  }
}
