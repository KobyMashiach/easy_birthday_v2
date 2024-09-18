part of 'settings_screen_bloc.dart';

@immutable
abstract class SettingsScreenState {}

final class SettingsScreenInitial extends SettingsScreenState {}

@immutable
abstract class SettingsScreenNavigateState extends SettingsScreenState {}

final class SettingsScreenNavigateOpenColorPicker
    extends SettingsScreenNavigateState {}

final class SettingsScreenNavigateToBuildAppPage
    extends SettingsScreenNavigateState {
  final int? seconds;
  final String? pageText;

  SettingsScreenNavigateToBuildAppPage({this.seconds, this.pageText});
}

final class SettingsScreenNavigateToGenderChangePage
    extends SettingsScreenNavigateState {}

final class SettingsScreenNavigateToAppInfoPage
    extends SettingsScreenNavigateState {}

final class SettingsScreenNavigateToChangeLanguage
    extends SettingsScreenNavigateState {}

final class SettingsScreenOpenLogoutDialog
    extends SettingsScreenNavigateState {}

final class SettingsScreenNavigateToLoginScreen
    extends SettingsScreenNavigateState {}
