import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/create_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_media_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/apply_purchased_plans_usecase.dart';
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/create_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_register_bloc.freezed.dart';

@freezed
sealed class FirstRegisterEvent with _$FirstRegisterEvent {
  const factory FirstRegisterEvent.init() = _Init;
  const factory FirstRegisterEvent.saveOwnDetails(PersonaModel persona) =
      _SaveOwnDetails;
  const factory FirstRegisterEvent.savePartnerDetails(PersonaModel persona) =
      _SavePartnerDetails;
  const factory FirstRegisterEvent.chooseColor(Color color) = _ChooseColor;
  const factory FirstRegisterEvent.chooseTexts(
    Map<String, String> chosenTexts,
  ) = _ChooseTexts;
  const factory FirstRegisterEvent.addProfileImage(File imageFile) =
      _AddProfileImage;
  const factory FirstRegisterEvent.purchasePlan(String? planTitle) =
      _PurchasePlan;
  const factory FirstRegisterEvent.finishRegister() = _FinishRegister;
}

@Freezed(equal: false)
sealed class FirstRegisterState with _$FirstRegisterState {
  const factory FirstRegisterState.initial(PlanModel planModel) = Initial;
  const factory FirstRegisterState.loaded(PlanModel planModel) = Loaded;
  const factory FirstRegisterState.navigateToHome(PlanModel planModel) =
      NavigateToHome;
  const factory FirstRegisterState.errorMessage(
    PlanModel planModel,
    String error,
  ) = ErrorMessage;

  /// The partner's phone is the owner's own or belongs to another account.
  const factory FirstRegisterState.partnerPhoneTaken(PlanModel planModel) =
      PartnerPhoneTaken;
}

extension FirstRegisterStateX on FirstRegisterState {
  bool get isOneShot => switch (this) {
    Initial() || Loaded() => false,
    _ => true,
  };
}

class FirstRegisterBloc extends Bloc<FirstRegisterEvent, FirstRegisterState> {
  final SaveUserUseCase saveUserUseCase;
  final GetUserUseCase getUserUseCase;
  final CreatePartnerUseCase createPartnerUseCase;
  final SavePartnerUseCase savePartnerUseCase;
  final GetEventUseCase getEventUseCase;
  final CreateEventUseCase createEventUseCase;
  final UpdateEventUseCase updateEventUseCase;
  final UploadMediaUseCase uploadMediaUseCase;
  final SaveAppSettingsUseCase saveAppSettingsUseCase;

  FirstRegisterBloc({
    required this.saveUserUseCase,
    required this.getUserUseCase,
    required this.createPartnerUseCase,
    required this.savePartnerUseCase,
    required this.getEventUseCase,
    required this.createEventUseCase,
    required this.updateEventUseCase,
    required this.uploadMediaUseCase,
    required this.saveAppSettingsUseCase,
  }) : super(.initial(getPlan(PlansEnum.free))) {
    on<FirstRegisterEvent>(
      (event, emit) => switch (event) {
        final _Init e => _init(e, emit),
        final _SaveOwnDetails e => _saveOwnDetails(e, emit),
        final _SavePartnerDetails e => _savePartnerDetails(e, emit),
        final _ChooseColor e => _chooseColor(e, emit),
        final _ChooseTexts e => _chooseTexts(e, emit),
        final _AddProfileImage e => _addProfileImage(e, emit),
        final _PurchasePlan e => _purchasePlan(e, emit),
        final _FinishRegister e => _finishRegister(e, emit),
      },
      transformer: _sequential(),
    );
  }

  factory FirstRegisterBloc.fromContext(BuildContext context) =>
      FirstRegisterBloc(
        saveUserUseCase: context.read<SaveUserUseCase>(),
        getUserUseCase: context.read<GetUserUseCase>(),
        createPartnerUseCase: context.read<CreatePartnerUseCase>(),
        savePartnerUseCase: context.read<SavePartnerUseCase>(),
        getEventUseCase: context.read<GetEventUseCase>(),
        createEventUseCase: context.read<CreateEventUseCase>(),
        updateEventUseCase: context.read<UpdateEventUseCase>(),
        uploadMediaUseCase: context.read<UploadMediaUseCase>(),
        saveAppSettingsUseCase: context.read<SaveAppSettingsUseCase>(),
      );

  /// The wizard steps depend on each other (the event must exist before the
  /// color/texts/image are saved), so all events share one handler and are
  /// processed strictly in order.
  static EventTransformer<E> _sequential<E>() =>
      (events, mapper) => events.asyncExpand(mapper);

  SessionService get _session => SessionService();

  /// The latest partner details whose link to the event hasn't been saved yet
  /// (the partner step failed). Retried before any step that needs the event.
  PersonaModel? _unlinkedPartner;

  /// The wizard's choices, re-applied to the event at the end if one of the
  /// event writes failed.
  Color? _color;
  Map<String, String>? _chosenTexts;
  bool _eventOutOfSync = false;
  bool _finished = false;

  /// Reports a failed step. A taken partner phone sends the user back to the
  /// partner step instead of failing every later step with it.
  void _emitError(Emitter<FirstRegisterState> emit, Object error) {
    if (error is AppException && error.type == .alreadyExists) {
      _unlinkedPartner = null;
      emit(.partnerPhoneTaken(state.planModel));
    } else {
      emit(.errorMessage(state.planModel, error.toString()));
    }
  }

  FutureOr<void> _init(_Init event, Emitter<FirstRegisterState> emit) async {
    try {
      final currentEvent = await getEventUseCase();
      emit(.loaded(currentEvent?.planSubscribe ?? getPlan(PlansEnum.free)));
    } catch (e) {
      debugPrint('FirstRegister init failed: $e');
      emit(.errorMessage(state.planModel, e.toString()));
    }
  }

  FutureOr<void> _saveOwnDetails(
    _SaveOwnDetails event,
    Emitter<FirstRegisterState> emit,
  ) async {
    try {
      await saveUserUseCase(event.persona);
    } catch (e) {
      // Saved locally; the partner step and finishing save the user again.
      debugPrint('Saving own details failed: $e');
      emit(.errorMessage(state.planModel, e.toString()));
    }
  }

  FutureOr<void> _savePartnerDetails(
    _SavePartnerDetails event,
    Emitter<FirstRegisterState> emit,
  ) async {
    _unlinkedPartner = event.persona;
    try {
      await _linkPartnerAndEvent();
    } catch (e) {
      debugPrint('Saving partner details failed: $e');
      _emitError(emit, e);
    }
  }

  /// Saves the partner and makes sure exactly one event links both personas.
  /// A failed event lookup throws (it is never treated as "no event"), so a
  /// second event can't be created by mistake.
  Future<void> _linkPartnerAndEvent() async {
    final partner = _unlinkedPartner;
    if (partner == null) return;
    await _checkPartnerPhone(partner.phoneNumber);
    await createPartnerUseCase(
      partner.copyWith(eventId: _session.user.eventId),
    );
    final checkEvent = await getEventUseCase();
    if (checkEvent == null) {
      await createEventUseCase();
    } else {
      _session.event = checkEvent;
      final partnerPhone = _session.partner!.phoneNumber;
      if (!checkEvent.users.contains(partnerPhone)) {
        // The partner's phone changed while going back in the wizard.
        await updateEventUseCase(
          checkEvent.copyWith(users: [_session.user.phoneNumber, partnerPhone]),
        );
      }
    }
    // Always persist the link to the event on both personas.
    await saveUserUseCase(_session.user);
    await savePartnerUseCase(
      _session.partner!.copyWith(eventId: _session.user.eventId),
    );
    _unlinkedPartner = null;
  }

  /// Saving the partner would overwrite the user document of [phoneNumber],
  /// so it must not be the owner's own or another event's account.
  Future<void> _checkPartnerPhone(String phoneNumber) async {
    final user = _session.user;
    var taken = phoneNumber == user.phoneNumber;
    if (!taken) {
      try {
        final existing = await getUserUseCase(phoneNumber);
        taken = existing.eventId != null && existing.eventId != user.eventId;
      } on AppException catch (e) {
        if (e.type != .notFound) rethrow;
      }
    }
    if (taken) {
      throw const AppException(
        AppErrorType.alreadyExists,
        message: 'The partner phone belongs to another account',
      );
    }
  }

  /// Returns the linked event, first retrying a failed partner step.
  Future<EventModel> _linkedEvent() async {
    await _linkPartnerAndEvent();
    final currentEvent = _session.event ??= await getEventUseCase();
    if (currentEvent == null) {
      throw const AppException(
        AppErrorType.notFound,
        message: 'The event is not linked yet',
      );
    }
    return currentEvent;
  }

  EventModel _withWizardChoices(EventModel event) => event.copyWith(
    appColor: _color ?? event.appColor,
    chosenTexts: _chosenTexts ?? event.chosenTexts,
  );

  Future<void> _updateEvent(
    EventModel Function(EventModel event) change,
    Emitter<FirstRegisterState> emit,
    String label,
  ) async {
    try {
      await updateEventUseCase(change(await _linkedEvent()));
    } catch (e) {
      _eventOutOfSync = true;
      debugPrint('$label failed: $e');
      _emitError(emit, e);
    }
  }

  FutureOr<void> _chooseColor(
    _ChooseColor event,
    Emitter<FirstRegisterState> emit,
  ) async {
    _color = event.color;
    changeAppColors(event.color);
    try {
      await saveAppSettingsUseCase(
        _session.appSettings.copyWith(
          appColor: event.color,
          // Keep the language in use (the saved settings may still be the
          // default when nothing was stored on this device yet).
          languageCode: getLanguageCode(),
        ),
      );
    } catch (e) {
      debugPrint('Saving app color locally failed: $e');
    }
    await _updateEvent(
      (current) => current.copyWith(appColor: event.color),
      emit,
      'Saving app color',
    );
  }

  FutureOr<void> _chooseTexts(
    _ChooseTexts event,
    Emitter<FirstRegisterState> emit,
  ) async {
    _chosenTexts = event.chosenTexts;
    await _updateEvent(
      (current) => current.copyWith(chosenTexts: event.chosenTexts),
      emit,
      'Saving chosen texts',
    );
  }

  FutureOr<void> _addProfileImage(
    _AddProfileImage event,
    Emitter<FirstRegisterState> emit,
  ) async {
    try {
      final linked = await _linkedEvent();
      // Fixed name (as before): re-picking replaces the previous image
      // instead of leaving orphaned files in Storage.
      final fileUrl = await uploadMediaUseCase(
        folder: linked.eventId,
        file: event.imageFile,
        fileName: 'profileImage',
      );
      await updateEventUseCase(
        (_session.event ?? linked).copyWith(profileImageUrl: fileUrl),
      );
    } catch (e) {
      debugPrint('Profile image upload failed: $e');
      _emitError(emit, e);
    }
  }

  /// The purchase service already wrote the plan to the event; only show it.
  FutureOr<void> _purchasePlan(
    _PurchasePlan event,
    Emitter<FirstRegisterState> emit,
  ) {
    final plan = planForProduct(event.planTitle);
    if (plan != null) emit(.loaded(plan));
  }

  FutureOr<void> _finishRegister(
    _FinishRegister event,
    Emitter<FirstRegisterState> emit,
  ) async {
    if (_finished) return;
    try {
      final linked = await _linkedEvent();
      if (_eventOutOfSync) {
        await updateEventUseCase(_withWizardChoices(linked));
        _eventOutOfSync = false;
      }
      await saveUserUseCase(_session.user.copyWith(registerComplete: true));
      _finished = true;
      emit(.navigateToHome(_session.event?.planSubscribe ?? state.planModel));
    } catch (e) {
      debugPrint('Finishing registration failed: $e');
      _emitError(emit, e);
    }
  }
}
