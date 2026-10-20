import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/firebase/password_auth.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/dialogs.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/settings/presentation/bloc/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class ChangePasswordScreen extends StatelessWidget {
  final void Function(String password) onPasswordChange;
  const ChangePasswordScreen({super.key, required this.onPasswordChange});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc.fromContext(context),
      child: _ChangePasswordView(onPasswordChange: onPasswordChange),
    );
  }
}

class _ChangePasswordView extends StatefulWidget {
  final void Function(String password) onPasswordChange;
  const _ChangePasswordView({required this.onPasswordChange});

  @override
  State<_ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<_ChangePasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerificationController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    passwordVerificationController.dispose();
    super.dispose();
  }

  bool formValidation() {
    if (passwordController.text.length < minPasswordLength) {
      openWrongDialog(shortPassword: true);
      return false;
    }
    if (passwordController.text != passwordVerificationController.text) {
      openWrongDialog(passwordsDontMatch: true);
      return false;
    }
    return true;
  }

  void openWrongDialog({
    String? title,
    bool shortPassword = false,
    bool passwordsDontMatch = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => KhEasydevDialogV2(
        oneButton: true,
        primaryColor: AppColors.primaryColor,
        title: shortPassword
            ? t.short_password
            : passwordsDontMatch
            ? t.password_dont_match
            : title ?? "",
        description: shortPassword
            ? t.short_password_description
            : passwordsDontMatch
            ? t.password_dont_match_description
            : title ?? "",
        child: SvgPicture.asset(wrongLoginIllustration, height: 200),
      ),
    );
  }

  void _listener(BuildContext context, ChangePasswordState state) {
    final bloc = context.read<ChangePasswordBloc>();
    switch (state) {
      case ErrorMessage(:final error):
        openWrongDialog(title: error);
      case NavigateToOtp(:final verificationId):
        context.pushNamed(
          Routing.otpVerification,
          extra: (
            onVerification: (String otpCode) => bloc.add(.verifyOtp(otpCode)),
            onTapSendAgain: () {
              context.popIfPossible();
              bloc.add(const .sendOtpAgain());
            },
            verificationId: verificationId,
          ),
        );
      case VerificationSucceeded():
        context.popIfPossible();
      case Initial() || Loading() || Loaded():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
      listenWhen: (_, current) => current.isOneShot,
      buildWhen: (_, current) => !current.isOneShot,
      listener: _listener,
      builder: (context, state) {
        final bloc = context.read<ChangePasswordBloc>();
        final verificationOtp = state.otpVerified;
        return Scaffold(
          appBar: appAppBar(title: t.change_password),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: state is Loading
                ? const Center(child: CircularProgressIndicator.adaptive())
                // Scrolls so the fields stay reachable above the keyboard.
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          t.change_password,
                          style: AppTextStyle().title,
                          textAlign: TextAlign.center,
                        ),
                        SvgPicture.asset(registerIllustration, height: 200),
                        const SizedBox(height: 24),
                        appButton(
                          text: t.phone_verification,
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          onTap: verificationOtp
                              ? null
                              : () => bloc.add(const .sendOtp()),
                          disableColors: verificationOtp,
                        ),
                        const SizedBox(height: 24),
                        AppTextField(
                          hintText: t.new_password,
                          controller: passwordController,
                          checkIfPassword: true,
                        ),
                        AppTextField(
                          hintText: t.new_password_verification,
                          controller: passwordVerificationController,
                          checkIfPassword: true,
                        ),
                      ],
                    ),
                  ),
          ),
          bottomNavigationBar: AppButtonsBottomNavigationBar(
            activeButtonOnTap: verificationOtp
                ? () {
                    if (formValidation()) {
                      widget.onPasswordChange.call(passwordController.text);
                      context.popIfPossible();
                    }
                  }
                : null,
            activeButtonDisable: !verificationOtp,
          ),
        );
      },
    );
  }
}
