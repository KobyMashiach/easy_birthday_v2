import 'dart:async';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/screens/wear_os/wear_os_categories/wear_os_categories.dart';
import 'package:easy_birthday/screens/wear_os/wear_os_login.dart';
import 'package:easy_birthday/main.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/screens/login_register/first_login.dart';
import 'package:easy_birthday/screens/login_register/first_register/first_register_main.dart';
import 'package:easy_birthday/screens/login_register/login/login_screen.dart';
import 'package:easy_birthday/screens/splash/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:watch_connectivity/watch_connectivity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  bool _canNavigate = false;

  _SplashScreenState() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _canNavigate = true;
        _checkNavigationCondition();
      });
    });

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  void _checkNavigationCondition() {
    if (_canNavigate) {
      final splashBloc = context.read<SplashScreenBloc>();
      final state = splashBloc.state;
      switch (state.runtimeType) {
        case const (SplashScreenNavigationToHomeScreen):
          KheasydevNavigatePage()
              .pushAndRemoveUntil(context, const HomeScreen());
        case const (SplashScreenNavigationToFirstRegister):
          KheasydevNavigatePage()
              .pushAndRemoveUntil(context, const FirstRegisterMain());
        case const (SplashScreenNavigationToLoginScreen):
          KheasydevNavigatePage()
              .pushAndRemoveUntil(context, const LoginScreen());

        case const (SplashScreenNavigationToFirstLoginScreen):
          KheasydevNavigatePage()
              .pushAndRemoveUntil(context, const FirstLoginScreen());

        case const (SplashScreenNavigationToLoginWearOs):
          KheasydevNavigatePage()
              .pushAndRemoveUntil(context, const WearOSLoginPage());

        case const (SplashScreenNavigationToCategoriesWearOs):
          KheasydevNavigatePage()
              .pushAndRemoveUntil(context, const WearOsCategories());
      }
    }
  }

  void initializeWatchConnectivity() {
    final WatchConnectivity watchConnectivity = WatchConnectivity();

    watchConnectivity.messageStream.listen((message) {
      debugPrint("Received message: $message");
      if (message['path'] == '/start_login') {
        debugPrint("Login request received. Opening login screen...");

        KheasydevNavigatePage().pushAndRemoveUntil(
            NavigationContextService.navigatorKey.currentContext!, LoginScreen(
          loginWithWatch: (loginSuccess, isOwner) {
            if (loginSuccess) {
              if (isOwner) {
                watchConnectivity.sendMessage({
                  'path': '/login_response',
                  'status': 'success',
                });
              } else {
                watchConnectivity.sendMessage({
                  'path': '/login_response',
                  'status': 'partner',
                });
              }
            } else {
              watchConnectivity.sendMessage({
                'path': '/login_response',
                'status': 'failed',
              });
            }
          },
        ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initializeWatchConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      listenWhen: (previous, current) => current is SplashScreenNavigatorState,
      buildWhen: (previous, current) => current is! SplashScreenNavigatorState,
      listener: (context, state) {
        _checkNavigationCondition();
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.shadowColor],
              begin: const FractionalOffset(0, 0),
              end: const FractionalOffset(1.0, 1.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0,
            duration: const Duration(milliseconds: 2200),
            child: Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width / 1.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.disableColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2.0,
                      offset: const Offset(5.0, 3.0),
                      spreadRadius: 2.0,
                    )
                  ],
                ),
                child: Center(
                  child: ClipOval(
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
