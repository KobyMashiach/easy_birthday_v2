import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/screens/login_register/register/register_screen.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/language_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(
        title: t.login_screen,
        actions: [LanguageDropdown(onLanguageChange: () => setState(() {}))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
            child: Column(
          children: [
            Text(
              t.login,
              style: AppTextStyle().bigTitle,
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              SvgPicture.asset(loginIllustration, height: 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  AppTextField(
                    hintText: t.phone,
                    controller: phoneController,
                  ),
                  AppTextField(
                    hintText: t.password,
                    controller: passwordController,
                    checkIfPassword: true,
                  ),
                  const SizedBox(height: 12),
                  AppButton(text: t.login),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      text: t.no_account,
                      style: AppTextStyle().smallDescription,
                      children: [
                        TextSpan(text: "?"),
                        TextSpan(text: " "),
                        TextSpan(
                            text: t.click_here,
                            style: AppTextStyle()
                                .smallDescription
                                .copyWith(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => KheasydevNavigatePage()
                                  .pushAndRemoveUntil(
                                      context, RegisterScreen())),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
