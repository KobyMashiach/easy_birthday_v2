import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/screens/login_register/login/login_screen.dart';
import 'package:easy_birthday/screens/login_register/register/bloc/register_screen_bloc.dart';
import 'package:easy_birthday/screens/login_register/register/otp_phone_verification.dart';
import 'package:easy_birthday/services/encryption.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController passwordVerificationController;
  late String countryCode = "";

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    passwordVerificationController = TextEditingController();
    countryCode = "+972";
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    passwordVerificationController.dispose();
    super.dispose();
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
      ],
      child: BlocProvider(
        create: (context) => RegisterScreenBloc(context.read<PersonaRepo>()),
        child: BlocConsumer<RegisterScreenBloc, RegisterScreenState>(
          listenWhen: (previous, current) => current is RegisterScreenStateNavi,
          buildWhen: (previous, current) => current is! RegisterScreenStateNavi,
          listener: (context, state) async {
            final bloc = context.read<RegisterScreenBloc>();
            switch (state.runtimeType) {
              case const (RegisterScreenStateNaviLogin):
                KheasydevNavigatePage()
                    .pushAndRemoveUntil(context, LoginScreen());
              case const (RegisterScreenStateDialogPhoneExist):
                openWrongDialog(phoneExists: true);

              case const (RegisterScreenStateDialogErrorRegister):
                final newState =
                    state as RegisterScreenStateDialogErrorRegister;
                openWrongDialog(title: newState.message);

              case const (RegisterScreenStateNavToOtpScreen):
                final newState = state as RegisterScreenStateNavToOtpScreen;
                KheasydevNavigatePage().push(
                  context,
                  OtpPhoneVerificationScreen(
                    onVerification: (otpCode) => bloc.add(
                        RegisterScreenEventOnVerification(
                            verificationId: newState.verificationId,
                            otpCode: otpCode)),
                    onTapSendAgain: () {
                      KheasydevNavigatePage().pop(context);
                      moveToOtp(bloc);
                    },
                    verificationId: newState.verificationId,
                  ),
                );
              case const (RegisterScreenStateNavToHomeScreen):
                KheasydevNavigatePage()
                    .pushAndRemoveUntil(context, HomeScreen());
            }
          },
          builder: (context, state) {
            final bloc = context.read<RegisterScreenBloc>();
            return Scaffold(
              appBar: appAppBar(
                title: t.register_screen,
                actions: [
                  LanguageDropdown(onLanguageChange: () => setState(() {}))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        t.register,
                        style: AppTextStyle().bigTitle,
                      ),
                      if (MediaQuery.of(context).viewInsets.bottom == 0)
                        SvgPicture.asset(registerIllustration, height: 300),
                      Padding(
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
                                        onCountryChange: (country) => {},
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
                            const SizedBox(height: 12),
                            AppButton(
                              text: t.register,
                              onTap: () {
                                final formValid = formValidation();
                                if (formValid) {
                                  if (phoneController.text.startsWith('0')) {
                                    phoneController.text =
                                        phoneController.text.substring(1);
                                  }
                                  moveToOtp(bloc);
                                }
                              },
                            ),
                            const SizedBox(height: 12),
                            Text.rich(
                              TextSpan(
                                text: t.have_account,
                                style: AppTextStyle().smallDescription,
                                children: [
                                  TextSpan(text: "?"),
                                  TextSpan(text: " "),
                                  TextSpan(
                                      text: t.click_here,
                                      style: AppTextStyle()
                                          .smallDescription
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => bloc.add(
                                            RegisterScreenEventNavToLoginScreen())),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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

  openWrongDialog({
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
        child: SvgPicture.asset(
          wrongLoginIllustration,
          height: 200,
        ),
      ),
    );
  }

  bool formValidation() {
    if (countryCode.isEmpty ||
        phoneController.text.length < 6 ||
        phoneController.text.length > 9) {
      openWrongDialog(phoneNotValid: true);
      return false;
    }

    if (passwordController.text.isEmpty) {
      openWrongDialog(shortPassword: true);
      return false;
    }
    if (passwordController.text != passwordVerificationController.text) {
      openWrongDialog(passwordsDontMatch: true);
      return false;
    }
    return true;
  }

  void moveToOtp(RegisterScreenBloc bloc) {
    final newPhone = countryCode + phoneController.text;
    final encryptedPassword =
        MyEncryptionDecryption.encryptFernet(passwordController.text);
    bloc.add(RegisterScreenEventOnRegisterButtonClick(
        phoneNumber: newPhone, password: encryptedPassword.base64));
  }
}
