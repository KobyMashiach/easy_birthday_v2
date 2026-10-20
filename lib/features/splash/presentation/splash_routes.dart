import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> splashRoutes = [
  GoRoute(
    path: Routing.splash,
    name: Routing.splash,
    builder: (context, state) => const SplashScreen(),
  ),
];
