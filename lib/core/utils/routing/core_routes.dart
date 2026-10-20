import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/pages/contact_us_page.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:go_router/go_router.dart';

/// Routes to pages that live in core (shared design-kit screens).
final List<RouteBase> coreRoutes = [
  GoRoute(
    path: Routing.contactUs,
    name: Routing.contactUs,
    builder: (context, state) => ContactUsScreen(
      appBar: appAppBar(title: t.contact_us),
      buttonBackground: AppColors.buttonBackground,
      dialogColor: AppColors.primaryColor,
    ),
  ),
];
