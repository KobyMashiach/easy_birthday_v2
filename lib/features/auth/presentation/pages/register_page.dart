import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/firebase/password_auth.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/dialogs.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/language_dropdown.dart';
import 'package:easy_birthday/features/auth/presentation/bloc/register_bloc.dart';
import 'package:easy_birthday/core/widgets/general/countries_codes_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String countryCode = "+972";
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerificationController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TapGestureRecognizer _loginTap = TapGestureRecognizer();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    passwordVerificationController.dispose();
    _loginTap.dispose();
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
          AppTextField(
            hintText: t.password,
            controller: passwordController,
            checkIfPassword: true,
          ),
          AppTextField(
            hintText: t.password_verification,
            controller: passwordVerificationController,
            checkIfPassword: true,
          ),
        ],
      ),
    );
  }

  Padding buttons(RegisterBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          appButton(
            text: t.register,
            onTap: () {
              if (formValidation()) moveToOtp(bloc);
            },
          ),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              text: t.have_account,
              style: AppTextStyle().smallDescription,
              children: [
                const TextSpan(text: "?"),
                const TextSpan(text: " "),
                TextSpan(
                  text: t.click_here,
                  style: AppTextStyle().smallDescription.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: _loginTap
                    ..onTap = () => bloc.add(const .navigateToLogin()),
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
    bool phoneExists = false,
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
            : phoneExists
            ? t.phone_exist
            : phoneNotValid
            ? t.phone_not_valid
            : title ?? "",
        description: shortPassword
            ? t.short_password_description
            : passwordsDontMatch
            ? t.password_dont_match_description
            : phoneExists
            ? t.phone_exist_description
            : phoneNotValid
            ? t.phone_not_valid_description
            : description ?? "",
        child: SvgPicture.asset(wrongLoginIllustration, height: 200),
      ),
    );
  }

  bool formValidation() {
    if (phoneController.text.startsWith('0')) {
      phoneController.text = phoneController.text.substring(1);
    }
    if (countryCode.isEmpty ||
        phoneController.text.length < 6 ||
        phoneController.text.length > 9) {
      openWrongDialog(phoneNotValid: true);
      return false;
    }

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

  void moveToOtp(RegisterBloc bloc) {
    final newPhone = countryCode + phoneController.text;
    bloc.add(
      .sendCode(phoneNumber: newPhone, password: passwordController.text),
    );
  }

  void _listener(BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();
    switch (state) {
      case NavigateToLogin():
        context.goNamed(Routing.login);
      case PhoneExists():
        openWrongDialog(phoneExists: true);
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
                  password: passwordController.text,
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
      case NavigateToOnboarding():
        context.goNamed(Routing.onboarding);
      case Initial() || Loading():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc.fromContext(context),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listenWhen: (_, current) => current.isOneShot,
        buildWhen: (_, current) => !current.isOneShot,
        listener: _listener,
        builder: (context, state) {
          final bloc = context.read<RegisterBloc>();
          return Scaffold(
            appBar: appAppBar(
              title: t.register_screen,
              actions: [
                LanguageDropdown(onLanguageChange: () => setState(() {})),
              ],
            ),
            body: state is Loading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  t.register,
                                  style: AppTextStyle().bigTitle,
                                ),
                                if (MediaQuery.viewInsetsOf(context).bottom ==
                                    0)
                                  SvgPicture.asset(
                                    registerIllustration,
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
