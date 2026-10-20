import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/app_dropdown.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class OwnDetailsScreen extends StatefulWidget {
  const OwnDetailsScreen({
    super.key,
    required this.onContinue,
    required this.onPrevious,
  });

  final void Function(PersonaModel persona) onContinue;
  final VoidCallback onPrevious;

  @override
  State<OwnDetailsScreen> createState() => _OwnDetailsScreenState();
}

class _OwnDetailsScreenState extends State<OwnDetailsScreen> {
  final TextEditingController emailController = TextEditingController();
  final Map<String, bool> errorsMap = {
    "name": false,
    "email": false,
    "gender": false,
  };

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initControllersValues();
  }

  bool formValidation() {
    fullNameController.text = fullNameController.text.trim();
    emailController.text = emailController.text.trim();
    errorsMap["name"] = !(fullNameController.text.length >= 2);
    errorsMap["email"] = !(RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(emailController.text));
    errorsMap["gender"] = !(genderController.text.isNotEmpty);

    if (errorsMap.containsValue(true)) return false;
    return true;
  }

  void initControllersValues() {
    phoneController.text = SessionService().user.phoneNumber;
    fullNameController.text = SessionService().user.name;
    emailController.text = SessionService().user.email ?? "";
    genderController.text = SessionService().user.gender;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) widget.onPrevious();
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          t.fill_your_details,
                          style: AppTextStyle().title,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        AppTextField(
                          hintText: t.phone,
                          controller: phoneController,
                          keyboard: TextInputType.phone,
                          readOnly: true,
                        ),
                        AppTextField(
                          hintText: t.first_name,
                          controller: fullNameController,
                          keyboard: TextInputType.name,
                          showError: errorsMap["name"],
                          textInputAction: TextInputAction.next,
                          isRequired: true,
                        ),
                        AppTextField(
                          hintText: t.email,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          showError: errorsMap["email"],
                          textInputAction: TextInputAction.next,
                          isRequired: true,
                        ),
                        AppDropDown(
                          // Store the canonical value: the labels are translated (and
                          // capitalized in English), which the gender helpers
                          // don't recognize.
                          onChanged: (value) => genderController.text =
                              value == t.male ? 'male' : 'female',
                          listValues: [t.male, t.female],
                          showError: errorsMap["gender"],
                          isRequired: true,
                          hintText: t.choose_gender,
                          value: getTranslateGender(genderController.text),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AppButtonsBottomNavigationBar(
              activeButtonText: t.continue_,
              activeButtonOnTap: () {
                final formValid = formValidation();
                if (formValid) {
                  final newPersona = SessionService().user.copyWith(
                    name: fullNameController.text,
                    email: emailController.text,
                    gender: genderController.text,
                  );
                  widget.onContinue.call(newPersona);
                } else {
                  setState(() {});
                }
              },
              inactiveButtonText: t.back,
              inactiveButtonOnTap: widget.onPrevious,
            ),
          ],
        ),
      ),
    );
  }
}
