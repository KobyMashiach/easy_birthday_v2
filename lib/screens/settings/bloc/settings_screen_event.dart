part of 'settings_screen_bloc.dart';

@immutable
abstract class SettingsScreenEvent {}

class SettingsScreenEventInit extends SettingsScreenEvent {}

class SettingsScreenEventChangeColor extends SettingsScreenEvent {
  final Color color;

  SettingsScreenEventChangeColor({required this.color});
}

class SettingsScreenEventChangeLanguage extends SettingsScreenEvent {
  final String languageCode;

  SettingsScreenEventChangeLanguage({required this.languageCode});
}

class SettingsScreenEventChangeGender extends SettingsScreenEvent {
  final String ownerGenerIsMale;
  final String partnerGenerIsMale;

  SettingsScreenEventChangeGender(
      {required this.ownerGenerIsMale, required this.partnerGenerIsMale});
}

class SettingsScreenEventOpenAppColorDialog extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToAppBuildScreen extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToGenderChange extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToAppInfo extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToChangeLanguage extends SettingsScreenEvent {}

class SettingsScreenEventLogoutDialog extends SettingsScreenEvent {}

class SettingsScreenEventLogout extends SettingsScreenEvent {}

class SettingsScreenEventNavToChangePassword extends SettingsScreenEvent {}

class SettingsScreenEventChangePassword extends SettingsScreenEvent {
  final String password;

  SettingsScreenEventChangePassword({required this.password});
}
