import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> homeRoutes = [
  GoRoute(
    path: Routing.home,
    name: Routing.home,
    builder: (context, state) => const HomeScreen(),
  ),
];
