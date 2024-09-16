import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/design/fields/app_dropdown.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnDetailsScreen extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onPrevious;
  const OwnDetailsScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  @override
  State<OwnDetailsScreen> createState() => _OwnDetailsScreenState();
}

class _OwnDetailsScreenState extends State<OwnDetailsScreen> {
  late TextEditingController phoneController;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController genderController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    genderController = TextEditingController();

    initControllersValues();
  }

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    genderController.dispose();
    super.dispose();
  }

  Map<String, bool> errorsMap = {
    "name": false,
    "email": false,
    "gender": false,
  };

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => widget.onPrevious(),
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
                        Text(t.fill_your_details,
                            style: AppTextStyle().title,
                            textAlign: TextAlign.center),
                        const SizedBox(height: 24),
                        AppTextField(
                          hintText: t.phone,
                          controller: phoneController,
                          keyboard: TextInputType.phone,
                          readOnly: true,
                        ),
                        AppTextField(
                          hintText: t.full_name,
                          controller: fullNameController,
                          keyboard: TextInputType.name,
                          showError: errorsMap["name"],
                          isRequired: true,
                        ),
                        AppTextField(
                          hintText: t.email,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          showError: errorsMap["email"],
                          isRequired: true,
                        ),
                        AppDropDown(
                            onChanged: (value) => genderController.text = value,
                            listValues: [t.male, t.female],
                            showError: errorsMap["gender"],
                            isRequired: true,
                            hintText: t.choose_gender,
                            value: getTranslateGender(genderController.text))
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
                  final newPersona = globalUser.copyWith(
                    name: fullNameController.text,
                    email: emailController.text,
                    gender: genderController.text,
                  );
                  context.read<PersonaRepo>().updatePersona(newPersona);
                  widget.onContinue.call();
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

  bool formValidation() {
    errorsMap["name"] = !(fullNameController.text.length >= 2);
    errorsMap["email"] = !(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text));
    errorsMap["gender"] = !(genderController.text.isNotEmpty);

    if (errorsMap.containsValue(true)) return false;
    return true;
  }

  void initControllersValues() {
    phoneController.text = globalUser.phoneNumber;
    fullNameController.text = globalUser.name;
    emailController.text = globalUser.email ?? "";
    genderController.text = globalUser.gender;
  }
}