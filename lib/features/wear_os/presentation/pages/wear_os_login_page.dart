import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/general/language_dropdown.dart';
import 'package:easy_birthday/features/wear_os/presentation/bloc/wear_os_login_bloc.dart';
import 'package:easy_birthday/features/wear_os/presentation/widgets/wear_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WearOSLoginPage extends StatefulWidget {
  const WearOSLoginPage({super.key});

  @override
  State<WearOSLoginPage> createState() => _WearOSLoginPageState();
}

class _WearOSLoginPageState extends State<WearOSLoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      create: (context) =>
          WearOsLoginBloc.fromContext(context)..add(const .init()),
      child: BlocConsumer<WearOsLoginBloc, WearOsLoginState>(
        listenWhen: (_, current) => current.isOneShot,
        buildWhen: (_, current) => !current.isOneShot,
        listener: (context, state) {
          if (state case NavigateToCategories(:final eventId)) {
            context.goNamed(
              Routing.wearOsCategories,
              extra: (eventId: eventId),
            );
          }
        },
        builder: (context, state) => WearDesign(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageDropdown(
                onLanguageChange: () => setState(() {}),
                size: 30,
                padding: EdgeInsets.zero,
              ),
              Image.asset(
                'assets/logo_transparent.png',
                height: screenHeight * 0.4,
              ),
              Text(
                state.status.text,
                style: AppTextStyle().watchTitle,
                textAlign: TextAlign.center,
              ),
              state.status == .loginSuccessful
                  ? const CircularProgressIndicator.adaptive()
                  : ElevatedButton(
                      onPressed: state is Loading
                          ? null
                          : () => context.read<WearOsLoginBloc>().add(
                              const .requestLogin(),
                            ),
                      child: Text(t.login_via_phone),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on WearOsLoginStatus {
  String get text => switch (this) {
    .welcome => t.welcome,
    .waitingForPhone => '${t.wait_for_phone_login}...',
    .phoneNotResponding => t.please_open_app_in_phone,
    .loginSuccessful => t.login_successful,
    .noOwner => t.no_owner,
    .loginFailed => t.login_failed,
    .sendFailed => t.failed_send_login_request,
  };
}
