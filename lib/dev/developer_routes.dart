import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/dev/developer_page.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> developerRoutes = [
  GoRoute(
    path: Routing.developer,
    name: Routing.developer,
    builder: (context, state) => const DeveloperScreen(),
  ),
];
