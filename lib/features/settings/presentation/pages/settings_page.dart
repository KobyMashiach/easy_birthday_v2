import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_toast.dart';
import 'package:easy_birthday/core/widgets/dialogs/adaptive_dialog_action.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_on_will_pop.dart';
import 'package:easy_birthday/core/widgets/general/side_menu_v2.dart';
import 'package:easy_birthday/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  List<_SettingOption> _settingsOptions(
    BuildContext context,
    SettingsBloc bloc,
  ) => [
    _SettingOption(
      title: t.change_color,
      icon: Icons.color_lens_outlined,
      hint: CircleAvatar(backgroundColor: AppColors.primaryColor),
      onTap: () => _openColorPicker(context, bloc),
    ),
    _SettingOption(
      title: t.change_gender,
      icon: Icons.man_2_outlined,
      hint: const Icon(Icons.male, color: Colors.blue),
      onTap: () => context.pushNamed(
        Routing.genderChange,
        extra: (
          changeGenderFunction: ((String owner, String partner) genders) =>
              bloc.add(
                .changeGender(
                  ownerGender: genders.$1,
                  partnerGender: genders.$2,
                ),
              ),
        ),
      ),
    ),
    _SettingOption(
      title: t.change_language,
      icon: Icons.language_outlined,
      hint: SvgPicture.asset(width: 50, getFlag(getLanguageCode())),
      onTap: () => context.pushNamed(
        Routing.changeLanguage,
        extra: (
          onLanguageChange: (String languageCode) =>
              bloc.add(.changeLanguage(languageCode)),
        ),
      ),
    ),
    _SettingOption(
      title: t.change_password,
      icon: Icons.password_outlined,
      onTap: () => context.pushNamed(
        Routing.changePassword,
        extra: (
          onPasswordChange: (String password) =>
              bloc.add(.changePassword(password)),
        ),
      ),
    ),
    if (SessionService().user.role.isNotPartner())
      _SettingOption(
        title: t.change_plan,
        icon: Icons.published_with_changes_rounded,
        onTap: () => _openChoosePlan(context),
      ),
    _SettingOption(
      title: t.info,
      icon: Icons.info_outline,
      onTap: () => context.pushNamed(Routing.appInfo),
    ),
    _SettingOption(
      title: t.logout,
      icon: Icons.logout_outlined,
      onTap: () => _openLogoutDialog(context, bloc),
    ),
    _SettingOption(
      title: t.delete_account,
      icon: Icons.delete_forever_outlined,
      destructive: true,
      onTap: () => _openDeleteAccountDialog(context, bloc),
    ),
  ];

  void _openColorPicker(BuildContext context, SettingsBloc bloc) {
    context.pushNamed(
      Routing.chooseAppColor,
      extra: (
        onContinue: (Color? color) {
          if (color != null) {
            bloc.add(.changeColor(color));
          } else if (context.canPop()) {
            context.pop();
          }
        },
      ),
    );
  }

  void _openChoosePlan(BuildContext context) {
    final event = SessionService().event;
    if (event == null) {
      kheasydevAppToast(t.operation_not_allowed);
      return;
    }
    context.pushNamed(
      Routing.choosePlan,
      extra: (
        currentPlan: event.planSubscribe,
        // The plan is already written to the event by the purchase service.
        onPlanPurchase: (String? planTitle) {
          if (context.mounted && context.canPop()) context.pop();
        },
        onContinue: () {
          context.popIfPossible();
        },
      ),
    );
  }

  Future<void> _openLogoutDialog(
    BuildContext context,
    SettingsBloc bloc,
  ) async {
    final userChoice = await showDialog<bool>(
      context: context,
      builder: (context) =>
          generalDialog(title: t.sure_logout(context: SessionService().gender)),
    );
    if (userChoice == true && !bloc.isClosed) bloc.add(const .logout());
  }

  Future<void> _openDeleteAccountDialog(
    BuildContext context,
    SettingsBloc bloc,
  ) async {
    // Native alert with a destructive action (Apple HIG for irreversible
    // actions); Material dialog on Android.
    final userChoice = await showAdaptiveDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        title: Text(t.delete_account_sure),
        content: Text(t.delete_account_description),
        actions: [
          adaptiveDialogAction(
            dialogContext,
            text: t.cancel,
            isDefault: true,
            onPressed: () => Navigator.of(dialogContext).pop(false),
          ),
          adaptiveDialogAction(
            dialogContext,
            text: t.delete_account,
            isDestructive: true,
            onPressed: () => Navigator.of(dialogContext).pop(true),
          ),
        ],
      ),
    );
    if (!context.mounted) return;
    if (userChoice == true) bloc.add(const .deleteAccount());
  }

  void _listener(BuildContext context, SettingsState state) {
    switch (state) {
      case NavigateToBuildApp(:final seconds, :final description):
        context.pushNamed(
          Routing.buildApp,
          queryParameters: {'next': Routing.settings},
          extra: (loadingTime: seconds, description: description),
        );
      case NavigateToLogin():
        context.goNamed(Routing.login);
      case DeleteAccountFailed():
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(t.delete_account_failed)));
      case PasswordChangeFailed():
      case ErrorMessage():
        kheasydevAppToast(t.operation_not_allowed);
      case Initial():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) appOnWillPop(context);
      },
      child: BlocProvider(
        create: (context) => SettingsBloc.fromContext(context),
        child: BlocConsumer<SettingsBloc, SettingsState>(
          listenWhen: (_, current) => current.isOneShot,
          buildWhen: (_, current) => !current.isOneShot,
          listener: _listener,
          builder: (context, state) {
            final bloc = context.read<SettingsBloc>();
            final settingOptions = _settingsOptions(context, bloc);

            return Scaffold(
              appBar: appAppBar(title: t.settings),
              drawer: appSideMenuV2(context, 'settings'),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  itemCount: settingOptions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemBuilder: (context, index) {
                    final option = settingOptions[index];
                    final Color? tint = option.destructive
                        ? CupertinoColors.destructiveRed
                        : null;
                    return Card(
                      child: GestureDetector(
                        onTap: option.onTap,
                        child: ListTile(
                          leading: Icon(option.icon, color: tint),
                          textColor: tint,
                          title: Text(option.title),
                          trailing: option.hint,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SettingOption {
  final String title;
  final IconData icon;
  final Widget? hint;
  final VoidCallback onTap;
  final bool destructive;

  const _SettingOption({
    required this.title,
    required this.icon,
    required this.onTap,
    this.hint,
    this.destructive = false,
  });
}
