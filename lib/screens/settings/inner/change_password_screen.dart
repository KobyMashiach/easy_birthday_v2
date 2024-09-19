import 'dart:developer';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/screens/login_register/otp_phone_verification_screen.dart';
import 'package:easy_birthday/services/firebase/error_translate_firebase.dart';
import 'package:easy_birthday/services/firebase/firebase_auth.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:kh_easy_dev/widgets/general/dialog_v2.dart';

class ChangePasswordScreen extends StatefulWidget {
  final Function(String password) onPasswordChange;
  const ChangePasswordScreen({super.key, required this.onPasswordChange});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool loading = false;
  late TextEditingController passwordController;
  late TextEditingController passwordVerificationController;
  bool verificationOtp = false;

  @override
  void dispose() {
    passwordController.dispose();
    passwordVerificationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    passwordController = TextEditingController();
    passwordVerificationController = TextEditingController();
    super.initState();
  }

  bool formValidation() {
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

  openWrongDialog({
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
        child: SvgPicture.asset(
          wrongLoginIllustration,
          height: 200,
        ),
      ),
    );
  }

  verificationPhoneFunction() async {
    {
      try {
        String verificationId = "";
        String message = "";
        await verifyPhoneNumber(
          globalUser.phoneNumber,
          (phoneAuthCredential) => log("credential: $phoneAuthCredential"),
          (error) {
            message = getMessageFromErrorCode(error.code);
            log("e: ${error.code}");
          },
          (verificationIdGet, forceResendingToken) {
            log("str: $verificationIdGet\nnumber: $forceResendingToken");
            verificationId = verificationIdGet;
          },
          (timeout) => log("timeout: $timeout"),
        );
        setState(() {
          loading = true;
        });
        await Future.any([
          Future.delayed(Duration(seconds: 5)),
          Future.doWhile(() async {
            await Future.delayed(Duration(milliseconds: 100));
            return verificationId == "";
          })
        ]);
        setState(() {
          loading = false;
        });
        if (message != "") {
          log(message);
          openWrongDialog(title: message);
        } else if (verificationId != "") {
          KheasydevNavigatePage().push(
            context,
            OtpPhoneVerificationScreen(
              onVerification: (otpCode) async {
                final message = await signInWithOTP(verificationId, otpCode);
                if (message != "") {
                  log(message);
                  openWrongDialog(title: message);
                } else {
                  setState(() {
                    verificationOtp = true;
                    KheasydevNavigatePage().pop(context);
                  });
                }
              },
              onTapSendAgain: () async {
                KheasydevNavigatePage().pop(context);
                setState(() {
                  loading = true;
                });
                await Future.delayed(Duration(milliseconds: 500));
                setState(() {
                  loading = false;
                });
                verificationPhoneFunction();
              },
              verificationId: verificationId,
            ),
          );
        } else {
          openWrongDialog(title: t.operation_not_allowed);
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.change_password),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Text(t.change_password,
                        style: AppTextStyle().title,
                        textAlign: TextAlign.center),
                    SvgPicture.asset(registerIllustration, height: 200),
                    const SizedBox(height: 24),
                    AppButton(
                        text: t.phone_verification,
                        margin: const EdgeInsets.symmetric(horizontal: 100),
                        onTap: verificationOtp
                            ? null
                            : () => verificationPhoneFunction(),
                        disableColors: verificationOtp),
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
                  KheasydevNavigatePage().pop(context);
                }
              }
            : null,
        activeButtonDisable: !verificationOtp,
      ),
    );
  }
}
