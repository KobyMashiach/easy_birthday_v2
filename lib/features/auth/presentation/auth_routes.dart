import 'package:easy_birthday/core/utils/routing/fade_page.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/auth/presentation/pages/first_login_page.dart';
import 'package:easy_birthday/features/auth/presentation/pages/login_page.dart';
import 'package:easy_birthday/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:easy_birthday/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> authRoutes = [
  GoRoute(
    path: Routing.login,
    name: Routing.login,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                void Function(bool loginSuccess, bool isOwner) loginWithWatch,
              })?;
      return fadePage(
        state,
        LoginScreen(loginWithWatch: extra?.loginWithWatch),
      );
    },
  ),
  GoRoute(
    path: Routing.register,
    name: Routing.register,
    pageBuilder: (context, state) => fadePage(state, const RegisterScreen()),
  ),
  GoRoute(
    path: Routing.otpVerification,
    name: Routing.otpVerification,
    builder: (context, state) {
      final extra =
          state.extra
              as ({
                void Function(String otpCode) onVerification,
                VoidCallback onTapSendAgain,
                String verificationId,
              });
      return OtpPhoneVerificationScreen(
        onVerification: extra.onVerification,
        onTapSendAgain: extra.onTapSendAgain,
        verificationId: extra.verificationId,
      );
    },
  ),
  GoRoute(
    path: Routing.firstLogin,
    name: Routing.firstLogin,
    builder: (context, state) => const FirstLoginScreen(),
  ),
];
