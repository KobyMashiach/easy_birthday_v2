import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';

/// In-memory state of the signed-in session: the user, their partner, the
/// shared event and the app settings. One instance for the app's lifetime.
class SessionService {
  static final SessionService _instance = SessionService._internal();
  factory SessionService() => _instance;
  SessionService._internal();

  static PersonaModel get emptyUser => PersonaModel(
    name: '',
    phoneNumber: '',
    password: '',
    role: RoleModel.partner,
    registerComplete: false,
  );

  PersonaModel user = emptyUser;
  PersonaModel? partner;
  EventModel? event;
  AppSettingsModel appSettings = AppSettingsModel(
    appColor: AppColors.primaryColor,
    languageCode: defaultLanguageCode(),
  );
  GenderContext gender = GenderContext.male;
  String appName = '';
  String appVersion = '';

  /// Forget everything about the signed-in account (logout / account deletion).
  void reset() {
    user = emptyUser;
    partner = null;
    event = null;
    gender = GenderContext.male;
  }
}
