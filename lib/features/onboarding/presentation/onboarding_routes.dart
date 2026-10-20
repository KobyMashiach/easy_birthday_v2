import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/onboarding/presentation/pages/choose_app_color_page.dart';
import 'package:easy_birthday/features/onboarding/presentation/pages/choose_plan_page.dart';
import 'package:easy_birthday/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> onboardingRoutes = [
  GoRoute(
    path: Routing.onboarding,
    name: Routing.onboarding,
    builder: (context, state) => const FirstRegisterMain(),
  ),
  GoRoute(
    path: Routing.chooseAppColor,
    name: Routing.chooseAppColor,
    builder: (context, state) {
      final extra = state.extra as ({void Function(Color? color) onContinue});
      return ChooseAppColorScreen(
        settingScreen: true,
        onContinue: extra.onContinue,
      );
    },
  ),
  GoRoute(
    path: Routing.choosePlan,
    name: Routing.choosePlan,
    builder: (context, state) {
      final extra =
          state.extra
              as ({
                PlanModel currentPlan,
                void Function(String? planTitle) onPlanPurchase,
                VoidCallback onContinue,
              });
      return ChoosePlanScreen(
        fromSettings: true,
        currentPlan: extra.currentPlan,
        onPlanPurchase: extra.onPlanPurchase,
        onContinue: extra.onContinue,
      );
    },
  ),
];
