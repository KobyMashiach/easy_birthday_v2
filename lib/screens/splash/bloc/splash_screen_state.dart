part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

@immutable
abstract class SplashScreenNavigatorState extends SplashScreenState {}

class SplashScreenNavigationToHomeScreen extends SplashScreenNavigatorState {}

class SplashScreenNavigationToLoginScreen extends SplashScreenNavigatorState {}

class SplashScreenNavigationToFirstRegister
    extends SplashScreenNavigatorState {}

class SplashScreenNavigationToFirstLoginScreen
    extends SplashScreenNavigatorState {}

class SplashScreenNavigationToLoginWearOs extends SplashScreenNavigatorState {}

class SplashScreenNavigationToCategoriesWearOs
    extends SplashScreenNavigatorState {
  final String eventId;

  SplashScreenNavigationToCategoriesWearOs({required this.eventId});
}
