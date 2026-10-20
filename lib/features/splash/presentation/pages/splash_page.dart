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
    // Fade the logo in on the next frame, and keep the splash up only long
    // enough to avoid a flash; navigation happens as soon as data is ready.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _isVisible = true);
    });
    _minimumDisplayTimer = Timer(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      _canNavigate = true;
      _checkNavigationCondition();
    });
  }

  @override
  void dispose() {
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
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.background, AppColors.softFill],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              child: AnimatedScale(
                scale: _isVisible ? 1.0 : 0.92,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                child: Container(
                  width: 148,
                  height: 148,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.30),
                        blurRadius: 40,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                      cacheWidth: 450,
                    ),
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
