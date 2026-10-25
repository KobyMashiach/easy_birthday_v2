import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'whats_new_bloc.freezed.dart';

/// Bump to show the "what's new" spotlight again after a release.
const String whatsNewVersion = 'family_categories_1';

/// The partner saw the intro before any family category existed; the
/// spotlight on the first one is still to come.
const String whatsNewIntroVersion = '${whatsNewVersion}_intro';

@freezed
sealed class WhatsNewEvent with _$WhatsNewEvent {
  /// Checks again whenever the event changes (a family category may have
  /// just been added for the partner).
  const factory WhatsNewEvent.check() = _Check;

  /// Shown and closed (whatever the choice): don't show it again.
  const factory WhatsNewEvent.seen() = _Seen;
}

@Freezed(equal: false)
sealed class WhatsNewState with _$WhatsNewState {
  const factory WhatsNewState.idle() = Idle;

  /// One-shot, for the owner: spotlight the add button.
  const factory WhatsNewState.showOwner({required bool hasChildren}) =
      ShowOwner;

  /// One-shot, for the partner: spotlight [category] (a family category
  /// made for them), or without one, introduce the family categories.
  const factory WhatsNewState.showPartner({CategoryModel? category}) =
      ShowPartner;
}

extension WhatsNewStateX on WhatsNewState {
  bool get isOneShot => this is! Idle;
}

/// The one-time "what's new" on the family categories, remembered per
/// device in the app settings. The owner gets it on the add button; the
/// partner on the first family category made for them (or an intro until
/// there is one).
class WhatsNewBloc extends Bloc<WhatsNewEvent, WhatsNewState> {
  final SaveAppSettingsUseCase saveAppSettingsUseCase;

  WhatsNewBloc({required this.saveAppSettingsUseCase}) : super(const .idle()) {
    on<_Check>(_check);
    on<_Seen>(_seen);
  }

  factory WhatsNewBloc.fromContext(BuildContext context) => WhatsNewBloc(
    saveAppSettingsUseCase: context.read<SaveAppSettingsUseCase>(),
  );

  /// What the open spotlight will mark as seen; null while none is open.
  String? _showing;

  FutureOr<void> _check(_Check event, Emitter<WhatsNewState> emit) {
    final SessionService session = SessionService();
    final event = session.event;
    final String? seen = session.appSettings.whatsNewSeen;
    if (event == null || _showing != null || seen == whatsNewVersion) {
      return null;
    }
    if (session.user.role.isNotPartner()) {
      _showing = whatsNewVersion;
      emit(.showOwner(hasChildren: event.children.isNotEmpty));
      return null;
    }
    final CategoryModel? family = event.categories
        .where((c) => newCategoryTypes.contains(c.categoryType))
        .firstOrNull;
    if (family != null) {
      _showing = whatsNewVersion;
      emit(.showPartner(category: family));
    } else if (seen != whatsNewIntroVersion) {
      _showing = whatsNewIntroVersion;
      emit(const .showPartner());
    }
  }

  FutureOr<void> _seen(_Seen event, Emitter<WhatsNewState> emit) async {
    final String? version = _showing;
    if (version == null) return;
    final SessionService session = SessionService();
    try {
      await saveAppSettingsUseCase(
        session.appSettings.copyWith(whatsNewSeen: version),
      );
    } catch (e) {
      // Only means it may show once more.
      debugPrint('WhatsNewBloc save failed: $e');
    } finally {
      _showing = null;
    }
  }
}
