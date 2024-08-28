part of 'settings_screen_bloc.dart';

@immutable
abstract class SettingsScreenEvent {}

class SettingsScreenEventInit extends SettingsScreenEvent {}

class SettingsScreenEventChangeColor extends SettingsScreenEvent {
  final Color color;

  SettingsScreenEventChangeColor({required this.color});
}

class SettingsScreenEventOpenAppColorDialog extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToAppBuildScreen extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToSexChange extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToAppInfo extends SettingsScreenEvent {}

class SettingsScreenEventNavigateToChangeLanguage extends SettingsScreenEvent {}
