import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/settings/presentation/pages/app_info_page.dart';
import 'package:easy_birthday/features/settings/presentation/pages/build_app_page.dart';
import 'package:easy_birthday/features/settings/presentation/pages/change_language_page.dart';
import 'package:easy_birthday/features/settings/presentation/pages/change_password_page.dart';
import 'package:easy_birthday/features/settings/presentation/pages/gender_change_page.dart';
import 'package:easy_birthday/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> settingsRoutes = [
  GoRoute(
    path: Routing.settings,
    name: Routing.settings,
    // Keyed by color + language: returning here after changing either (via
    // goNamed to the existing /settings page) must rebuild it, like the old
    // pushAndRemoveUntil did.
    builder: (context, state) => SettingsScreen(
      key: ValueKey((
        AppColors.primaryColor,
        SessionService().appSettings.languageCode,
      )),
    ),
    routes: [
      GoRoute(
        path: Routing.appInfo,
        name: Routing.appInfo,
        builder: (context, state) => const AppInfo(),
      ),
      GoRoute(
        path: Routing.changeLanguage,
        name: Routing.changeLanguage,
        builder: (context, state) {
          final extra =
              state.extra
                  as ({void Function(String languageCode) onLanguageChange});
          return ChangeLanguageScreen(
            onLanguageChange: extra.onLanguageChange,
          );
        },
      ),
      GoRoute(
        path: Routing.changePassword,
        name: Routing.changePassword,
        builder: (context, state) {
          final extra =
              state.extra
                  as ({void Function(String password) onPasswordChange});
          return ChangePasswordScreen(onPasswordChange: extra.onPasswordChange);
        },
      ),
      GoRoute(
        path: Routing.genderChange,
        name: Routing.genderChange,
        builder: (context, state) {
          final extra =
              state.extra
                  as ({
                    void Function((String owner, String partner) genders)
                    changeGenderFunction,
                  });
          return GenderChangeScreen(
            changeGenderFunction: extra.changeGenderFunction,
          );
        },
      ),
    ],
  ),
  GoRoute(
    path: Routing.buildApp,
    name: Routing.buildApp,
    builder: (context, state) {
      final extra = state.extra as ({int loadingTime, String? description});
      return BuildAppPage(
        loadingTime: extra.loadingTime,
        description: extra.description,
        // Optional `next` query parameter: the route to reset to afterwards
        // (settings returns to itself; onboarding goes home).
        nextRoute: state.uri.queryParameters['next'] ?? Routing.home,
      );
    },
  ),
];
