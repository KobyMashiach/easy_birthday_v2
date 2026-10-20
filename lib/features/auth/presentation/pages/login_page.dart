import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/dialogs.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/language_dropdown.dart';
import 'package:easy_birthday/features/auth/presentation/bloc/login_bloc.dart';
import 'package:easy_birthday/core/widgets/general/countries_codes_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class LoginScreen extends StatefulWidget {
  final void Function(bool loginSuccess, bool isOwner)? loginWithWatch;
  const LoginScreen({super.key, this.loginWithWatch});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryCode = "+972";
  bool loginWithPassword = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TapGestureRecognizer _registerTap = TapGestureRecognizer();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    _registerTap.dispose();
    super.dispose();
  }

  Padding countriesCode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CountriesCodesDropdown(
                    onCountryChange: (country) =>
                        countryCode = country.dialCode,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: AppTextField(
                    hintText: t.phone,
                    controller: phoneController,
                    keyboard: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
          if (loginWithPassword)
            AppTextField(
              hintText: t.password,
              controller: passwordController,
              checkIfPassword: true,
            ),
        ],
      ),
    );
  }

  Padding buttons(LoginBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          appButton(
            text: loginWithPassword ? t.login : t.send_code,
            onTap: () {
              if (!formValidation(loginWithPassword)) return;
              if (loginWithPassword) {
                bloc.add(
                  .loginWithPassword(
                    phoneNumber: countryCode + phoneController.text,
                    password: passwordController.text,
                    isWatch: widget.loginWithWatch != null,
                  ),
                );
              } else {
                moveToOtp(bloc);
              }
            },
          ),
          const SizedBox(height: 12),
          appButton(
            text: loginWithPassword
                ? t.login_with_otp_code
                : t.login_with_password,
            unfillColors: true,
            onTap: () => setState(() => loginWithPassword = !loginWithPassword),
          ),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              text: t.no_account,
              style: AppTextStyle().smallDescription,
              children: [
                const TextSpan(text: "?"),
                const TextSpan(text: " "),
                TextSpan(
                  text: t.click_here,
                  style: AppTextStyle().smallDescription.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: _registerTap
                    ..onTap = () => bloc.add(const .navigateToRegister()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openWrongDialog({
    String? title,
    String? description,
    bool shortPassword = false,
    bool passwordsDontMatch = false,
    bool phoneNotValid = false,
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
            : phoneNotValid
            ? t.phone_not_valid
            : title ?? "",
        description: shortPassword
            ? t.short_password_description
            : passwordsDontMatch
            ? t.password_dont_match_description
            : phoneNotValid
            ? t.phone_not_valid_description
            : description ?? "",
        child: SvgPicture.asset(wrongLoginIllustration, height: 200),
      ),
    );
  }

  bool formValidation(bool withPassword) {
    if (phoneController.text.startsWith('0')) {
      phoneController.text = phoneController.text.substring(1);
    }
    if (countryCode.isEmpty ||
        phoneController.text.length < 6 ||
        phoneController.text.length > 9) {
      openWrongDialog(phoneNotValid: true);
      return false;
    }

    if (withPassword && passwordController.text.isEmpty) {
      openWrongDialog(shortPassword: true);
      return false;
    }
    return true;
  }

  void moveToOtp(LoginBloc bloc) {
    final newPhone = countryCode + phoneController.text;
    bloc.add(
      .sendCode(
        phoneNumber: newPhone,
        isWatch: widget.loginWithWatch != null,
      ),
    );
  }

  void _onWatchMessage(String message) {
    final (loginSuccess, isOwner) = switch (message) {
      'success' => (true, true),
      'partner' => (true, false),
      _ => (false, false),
    };
    widget.loginWithWatch?.call(loginSuccess, isOwner);
    // The app continues into home; the root messenger keeps this visible.
    if (loginSuccess && isOwner) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.watch_login_success)));
    }
  }

  void _listener(BuildContext context, LoginState state) {
    final bloc = context.read<LoginBloc>();
    switch (state) {
      case NavigateToRegister():
        context.goNamed(Routing.register);
      case NavigateToHome():
        context.goNamed(Routing.home);
      case NavigateToOnboarding():
        context.goNamed(Routing.onboarding);
      case NavigateToFirstLogin():
        context.goNamed(Routing.firstLogin);
      case ErrorMessage(:final error):
        openWrongDialog(title: error);
      case NavigateToOtp(:final verificationId):
        context.pushNamed(
          Routing.otpVerification,
          extra: (
            onVerification: (String otpCode) {
              final newPhone = countryCode + phoneController.text;
              bloc.add(
                .verifyOtp(
                  verificationId: verificationId,
                  otpCode: otpCode,
                  phoneNumber: newPhone,
                  isWatch: widget.loginWithWatch != null,
                ),
              );
            },
            onTapSendAgain: () {
              context.popIfPossible();
              moveToOtp(bloc);
            },
            verificationId: verificationId,
          ),
        );
      case MessageToWatch(:final message):
        // After a code login the code page is still on top; show the result.
        final loginRoute = ModalRoute.of(context);
        if (loginRoute != null && !loginRoute.isCurrent) {
          Navigator.of(context).popUntil((route) => route == loginRoute);
        }
        _onWatchMessage(message);
      case Initial() || Loading():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc.fromContext(context),
      child: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (_, current) => current.isOneShot,
        buildWhen: (_, current) => !current.isOneShot,
        listener: _listener,
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
          return Scaffold(
            appBar: appAppBar(
              title: t.login_screen,
              actions: [
                LanguageDropdown(onLanguageChange: () => setState(() {})),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: state is Loading
                    ? const CircularProgressIndicator.adaptive()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(t.login, style: AppTextStyle().bigTitle),
                                if (MediaQuery.viewInsetsOf(context).bottom ==
                                    0)
                                  SvgPicture.asset(
                                    loginIllustration,
                                    height: 300,
                                  ),
                                countriesCode(),
                              ],
                            ),
                          ),
                          buttons(bloc),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
