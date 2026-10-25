import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/hive/hive_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_toast.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/auth/domain/usecases/logout_usecase.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_event_usecase.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

typedef _DevOption = ({
  String title,
  IconData icon,
  Future<void> Function() onTap,
});

/// Admin-only tools (opened by long-pressing the app bar logo).
class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  List<_DevOption> _options(BuildContext context) => [
    (
      title: "Clear all hive boxes",
      icon: Icons.storage_rounded,
      onTap: () async {
        if (await _confirm(context)) {
          await _run(clearAllHiveBoxes);
        }
      },
    ),
    (
      title: "Remove all cache and storage",
      icon: Icons.storage_rounded,
      onTap: () async {
        if (await _confirm(context)) {
          await _run(removeAllStorageAndCache);
        }
      },
    ),
    (
      title: "Change my role",
      icon: Icons.admin_panel_settings_outlined,
      onTap: () => _chooseDialog(
        context,
        title: "Choose role to change",
        items: [
          for (final role in RoleModel.values)
            (
              label: role.getName(),
              apply: (BuildContext context) => context.read<SaveUserUseCase>()(
                SessionService().user.copyWith(role: role),
              ),
            ),
        ],
      ),
    ),
    (
      title: "Change my plan",
      icon: Icons.admin_panel_settings_outlined,
      onTap: () => _chooseDialog(
        context,
        title: "Choose plan to change",
        items: [
          for (final plan in appPlans.values)
            (
              label: plan.title,
              apply: (BuildContext context) async {
                final event = SessionService().event;
                if (event == null) return;
                await context.read<UpdateEventUseCase>()(
                  event.copyWith(planSubscribe: plan),
                );
              },
            ),
        ],
      ),
    ),
    (
      title: "Navigate to Home screen",
      icon: Icons.navigation_outlined,
      onTap: () async => context.pushNamed(Routing.home),
    ),
    (
      title: "Navigate to Login screen",
      icon: Icons.navigation_outlined,
      onTap: () async => context.pushNamed(Routing.login),
    ),
    (
      title: "Navigate to First register screen",
      icon: Icons.navigation_outlined,
      onTap: () async => context.pushNamed(Routing.onboarding),
    ),
    (
      title: "Logout from user",
      icon: Icons.logout,
      onTap: () async {
        if (!await _confirm(context, text: "Logout from user?")) return;
        if (!context.mounted) return;
        try {
          await context.read<LogoutUseCase>()();
          // The session is cleared: screens behind this one would show an
          // empty user.
          if (context.mounted) context.goNamed(Routing.login);
        } catch (e) {
          debugPrint('Developer logout failed: $e');
          kheasydevAppToast(e.toString());
        }
      },
    ),
  ];

  Future<void> _run(Future<void> Function() action) async {
    try {
      await action();
      kheasydevAppToast("All local storage deleted!");
    } catch (e) {
      debugPrint('Developer action failed: $e');
      kheasydevAppToast(e.toString());
    }
  }

  Future<bool> _confirm(BuildContext context, {String? text}) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) =>
          generalDialog(title: text ?? "Delete all local storage?"),
    );
    return confirmed == true;
  }

  Future<void> _chooseDialog(
    BuildContext context, {
    required String title,
    required List<
      ({String label, Future<void> Function(BuildContext context) apply})
    >
    items,
  }) {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) => generalDialog(
        title: title,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in items)
              GestureDetector(
                onTap: () async {
                  try {
                    await item.apply(dialogContext);
                  } catch (e) {
                    debugPrint('Developer change failed: $e');
                    kheasydevAppToast(e.toString());
                  }
                  if (dialogContext.mounted) {
                    Navigator.of(dialogContext).pop();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      item.label,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<_DevOption> options = _options(context);
    return Scaffold(
      appBar: appAppBar(title: "Developer Screen"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: options.length,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: (context, index) {
            final _DevOption option = options[index];
            return Card(
              child: GestureDetector(
                onTap: option.onTap,
                child: ListTile(
                  leading: Icon(option.icon),
                  title: Text(option.title),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
