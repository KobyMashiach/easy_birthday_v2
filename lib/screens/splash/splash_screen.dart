// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';
import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/screens/login_register/register/register_screen.dart';
import 'package:easy_birthday/screens/splash/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  bool _canNavigate = false;

  _SplashScreenState() {
    // Ensure the splash screen is visible for at least 3 seconds
    Timer(const Duration(seconds: 0), () {
      //TODO: change to 3 seconds
      setState(() {
        _canNavigate = true;
        _checkNavigationCondition();
      });
    });

    // Control the visibility of the logo
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
      //TODO: check if login or home or first details
      if (state is SplashScreenNavigationToHomeScreen) {
        KheasydevNavigatePage().pushAndRemoveUntil(context, RegisterScreen());
        // KheasydevNavigatePage().pushAndRemoveUntil(context, HomeScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      listenWhen: (previous, current) => current is SplashScreenNavigatorState,
      buildWhen: (previous, current) => current is! SplashScreenNavigatorState,
      listener: (context, state) {
        if (state is SplashScreenNavigationToHomeScreen) {
          _checkNavigationCondition();
        }
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
