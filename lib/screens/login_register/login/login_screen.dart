import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/hive/category_model_data_source.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/screens/login_register/first_login.dart';
import 'package:easy_birthday/screens/login_register/first_register/first_register_main.dart';
import 'package:easy_birthday/screens/login_register/login/bloc/login_screen_bloc.dart';
import 'package:easy_birthday/screens/login_register/otp_phone_verification_screen.dart';
import 'package:easy_birthday/screens/login_register/register/register_screen.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/countries_codes_dropdown.dart';
import 'package:easy_birthday/widgets/general/language_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:kh_easy_dev/widgets/general/dialog_v2.dart';

class LoginScreen extends StatefulWidget {
  final Function(bool loginSuccess, bool isOwner)? loginWithWatch;
  const LoginScreen({super.key, this.loginWithWatch});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String countryCode = "";
  bool loginWithPassword = true;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    countryCode = "+972";
    super.initState();
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
                    )),
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

  Padding buttons(LoginScreenBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          appButton(
            text: loginWithPassword ? t.login : t.send_code,
            onTap: () {
              final formValid = formValidation(loginWithPassword);
              if (formValid) {
                final newPhone = countryCode + phoneController.text;
                if (loginWithPassword) {
                  bloc.add(LoginScreenEventOnLoginButtonClick(
                    phoneNumber: newPhone,
                    password: passwordController.text,
                    isWatch: widget.loginWithWatch != null,
                  ));
                } else {
                  bloc.add(LoginScreenEventOnSendCodeButtonClick(
                      phoneNumber: newPhone));
                }
              }
            },
          ),
          const SizedBox(height: 12),
          appButton(
            text: loginWithPassword
                ? t.login_with_otp_code
                : t.login_with_password,
            unfillColors: true,
            onTap: () => setState(
              () => loginWithPassword = !loginWithPassword,
            ),
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
                    style: AppTextStyle()
                        .smallDescription
                        .copyWith(fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          bloc.add(LoginScreenEventNavToRegisterScreen())),
              ],
            ),
          ),
        ],
      ),
    );
  }

  openWrongDialog({
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
        child: SvgPicture.asset(
          wrongLoginIllustration,
          height: 200,
        ),
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

  void moveToOtp(LoginScreenBloc bloc) {
    final newPhone = countryCode + phoneController.text;
    bloc.add(LoginScreenEventOnSendCodeButtonClick(phoneNumber: newPhone));
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PersonaDataSource(),
        ),
        RepositoryProvider(
          create: (context) => PersonaRepo(context.read<PersonaDataSource>()),
        ),
        RepositoryProvider(
          create: (context) => CategoryModelDataSource(),
        ),
        RepositoryProvider(
          create: (context) => EventRepo(),
        ),
      ],
      child: BlocProvider(
        create: (context) => LoginScreenBloc(
            context.read<PersonaRepo>(), context.read<EventRepo>()),
        child: BlocConsumer<LoginScreenBloc, LoginScreenState>(
          listenWhen: (previous, current) => current is LoginScreenStateNavi,
          buildWhen: (previous, current) => current is! LoginScreenStateNavi,
          listener: (context, state) async {
            final bloc = context.read<LoginScreenBloc>();
            switch (state.runtimeType) {
              case const (LoginScreenStateNaviRegister):
                KheasydevNavigatePage().pushAndRemoveUntilDuration(
                    context, const RegisterScreen());

              case const (LoginScreenStateNavToHomeScreen):
                KheasydevNavigatePage()
                    .pushAndRemoveUntil(context, const HomeScreen());

              case const (LoginScreenStateNavToFirstRegisterScreen):
                KheasydevNavigatePage()
                    .pushAndRemoveUntil(context, const FirstRegisterMain());

              case const (LoginScreenStateNavToFirstLoginScreen):
                KheasydevNavigatePage()
                    .pushAndRemoveUntil(context, const FirstLoginScreen());

              case const (LoginScreenStateDialogErrorMessage):
                final newState = state as LoginScreenStateDialogErrorMessage;
                openWrongDialog(title: newState.message);

              case const (LoginScreenStateNavToOtpScreen):
                final newState = state as LoginScreenStateNavToOtpScreen;
                KheasydevNavigatePage().push(
                  context,
                  OtpPhoneVerificationScreen(
                    onVerification: (otpCode) {
                      final newPhone = countryCode + phoneController.text;

                      bloc.add(LoginScreenEventOnVerification(
                        verificationId: newState.verificationId,
                        otpCode: otpCode,
                        phoneNumber: newPhone,
                        isWatch: widget.loginWithWatch != null,
                      ));
                    },
                    onTapSendAgain: () {
                      KheasydevNavigatePage().pop(context);
                      moveToOtp(bloc);
                    },
                    verificationId: newState.verificationId,
                  ),
                );
              case const (LoginScreenStateMessageToWatch):
                final newState = state as LoginScreenStateMessageToWatch;
                switch (newState.message) {
                  case 'success':
                    widget.loginWithWatch!.call(true, true);
                  case 'partner':
                    widget.loginWithWatch!.call(true, false);
                  default:
                    widget.loginWithWatch!.call(false, false);
                }
            }
          },
          builder: (context, state) {
            final bloc = context.read<LoginScreenBloc>();
            return Scaffold(
              appBar: appAppBar(
                title: t.login_screen,
                actions: [
                  LanguageDropdown(onLanguageChange: () => setState(() {}))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: state is LoginScreenLoading
                      ? const CircularProgressIndicator()
                      : state is LoginScreenLoginWithWatch
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                  SvgPicture.asset(watchIllustration),
                                  Text(
                                    t.watch_login_success,
                                    style: AppTextStyle().title,
                                    textAlign: TextAlign.center,
                                  )
                                ])
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        t.login,
                                        style: AppTextStyle().bigTitle,
                                      ),
                                      if (MediaQuery.of(context)
                                              .viewInsets
                                              .bottom ==
                                          0)
                                        SvgPicture.asset(loginIllustration,
                                            height: 300),
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
      ),
    );
  }
}
