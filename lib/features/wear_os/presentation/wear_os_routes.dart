import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/wear_os/presentation/pages/wear_os_categories_page.dart';
import 'package:easy_birthday/features/wear_os/presentation/pages/wear_os_login_page.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> wearOsRoutes = [
  GoRoute(
    path: Routing.wearOsLogin,
    name: Routing.wearOsLogin,
    builder: (context, state) => const WearOSLoginPage(),
  ),
  GoRoute(
    path: Routing.wearOsCategories,
    name: Routing.wearOsCategories,
    builder: (context, state) {
      final extra = state.extra as ({String eventId});
      return WearOsCategories(eventId: extra.eventId);
    },
  ),
];
