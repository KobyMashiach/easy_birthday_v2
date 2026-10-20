import 'package:easy_birthday/core/utils/routing/core_routes.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/dev/developer_routes.dart';
import 'package:easy_birthday/features/auth/presentation/auth_routes.dart';
import 'package:easy_birthday/features/category_display/presentation/category_display_routes.dart';
import 'package:easy_birthday/features/category_editor/presentation/category_editor_routes.dart';
import 'package:easy_birthday/features/home/presentation/home_routes.dart';
import 'package:easy_birthday/features/onboarding/presentation/onboarding_routes.dart';
import 'package:easy_birthday/features/settings/presentation/settings_routes.dart';
import 'package:easy_birthday/features/splash/presentation/splash_routes.dart';
import 'package:easy_birthday/features/wear_os/presentation/wear_os_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routing.splash,
  routes: [
    ...coreRoutes,
    ...splashRoutes,
    ...authRoutes,
    ...onboardingRoutes,
    ...homeRoutes,
    ...categoryEditorRoutes,
    ...categoryDisplayRoutes,
    ...settingsRoutes,
    ...wearOsRoutes,
    ...developerRoutes,
  ],
);
