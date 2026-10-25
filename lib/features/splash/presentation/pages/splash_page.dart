import 'dart:async';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc.fromContext(context)..add(const .init()),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView> {
  bool _isVisible = false;
  bool _canNavigate = false;
  bool _navigated = false;
  Timer? _fadeInTimer;
  Timer? _minimumDisplayTimer;

  void _checkNavigationCondition() {
    if (!_canNavigate || _navigated || !mounted) return;
    final state = context.read<SplashBloc>().state;
    if (!state.isOneShot) return;
    _navigated = true;
    switch (state) {
      case NavigateToHome():
        context.goNamed(Routing.home);
      case NavigateToOnboarding():
        context.goNamed(Routing.onboarding);
      case NavigateToLogin():
        context.goNamed(Routing.login);
      case NavigateToFirstLogin():
        context.goNamed(Routing.firstLogin);
      case NavigateToWearOsLogin():
        context.goNamed(Routing.wearOsLogin);
      case NavigateToWearOsCategories(:final eventId):
        context.goNamed(
          Routing.wearOsCategories,
          extra: (eventId: eventId),
        );
      case Initial() || Loading():
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    // Fade the logo in after a short delay, and keep the splash up until the
    // fade has finished.
    _fadeInTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _isVisible = true);
    });
    _minimumDisplayTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      _canNavigate = true;
      _checkNavigationCondition();
    });
  }

  @override
  void dispose() {
    _fadeInTimer?.cancel();
    _minimumDisplayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listenWhen: (previous, current) => current.isOneShot,
      buildWhen: (previous, current) => !current.isOneShot,
      listener: (context, state) => _checkNavigationCondition(),
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
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 2.0,
                      offset: const Offset(5.0, 3.0),
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: ClipOval(child: Image.asset("assets/logo.png")),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
