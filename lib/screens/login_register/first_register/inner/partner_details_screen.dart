import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/models/countries_model/countries_functions.dart';
import 'package:easy_birthday/models/persona_model/persona_model.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/services/encryption.dart';
import 'package:easy_birthday/widgets/design/fields/app_dropdown.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/countries_codes_dropdown.dart';
import 'package:easy_birthday/widgets/general/error_message_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class PartnerDetailsScreen extends StatefulWidget {
  const PartnerDetailsScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  final Function(PersonaModel) onContinue;
  final VoidCallback onPrevious;

  @override
  State<PartnerDetailsScreen> createState() => _PartnerDetailsScreenState();
}

class _PartnerDetailsScreenState extends State<PartnerDetailsScreen> {
  late String countryCode = "";
  late TextEditingController dateOfBirthController;
  late TextEditingController emailController;
  Map<String, bool> errorsMap = {
    "phone": false,
    "name": false,
    "email": false,
    "gender": false,
    "birth": false,
  };

  late TextEditingController fullNameController;
  late TextEditingController genderController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late DateTime? selectedPartnerDate;

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    genderController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    genderController = TextEditingController();
    dateOfBirthController = TextEditingController();
    countryCode = "+972";
    passwordController = TextEditingController();
    if (globalPartnerUser != null) {
      initPartnerDetails();
    }
  }

  Directionality phoneNumberFields() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: CountriesCodesDropdown(
                onCountryChange: (country) => countryCode = country.dialCode,
                countryDialCode: countryCode,
              )),
          Expanded(
            flex: 6,
            child: AppTextField(
              hintText: t.phone,
              controller: phoneController,
              keyboard: TextInputType.phone,
              showError: errorsMap["phone"],
              isRequired: true,
            ),
          ),
        ],
      ),
    );
  }

  bool formValidation() {
    if (phoneController.text.length == 10 &&
        phoneController.text.startsWith('0')) {
      phoneController.text = phoneController.text.substring(1);
    }
    errorsMap["phone"] = countryCode.isEmpty ||
        phoneController.text.length < 6 ||
        phoneController.text.length > 9;
    errorsMap["name"] = !(fullNameController.text.length >= 2);
    errorsMap["email"] = !(emailController.text.isEmpty ||
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text));
    errorsMap["gender"] = !(genderController.text.isNotEmpty);
    errorsMap["birth"] = !(dateOfBirthController.text.isNotEmpty);
    if (errorsMap.containsValue(true)) return false;
    return true;
  }

  Future<void> onDateOfBirthTap() async {
    DateTime initialDate = DateTime.now();
    if (dateOfBirthController.text.isNotEmpty) {
      try {
        initialDate =
            intl.DateFormat('dd/MM/yyyy').parse(dateOfBirthController.text);
      } catch (e) {
        initialDate = DateTime.now();
      }
    }

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (selectedDate != null) {
      selectedPartnerDate = selectedDate;
      setState(() {
        dateOfBirthController.text =
            intl.DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  void initPartnerDetails() {
    final splitPhone =
        CountriesFunctions().splitPhone(globalPartnerUser!.phoneNumber);
    countryCode = splitPhone.$1 ?? "+972";
    phoneController.text = splitPhone.$2;
    fullNameController.text = globalPartnerUser!.name;
    emailController.text = globalPartnerUser!.email ?? "";
    genderController.text = globalPartnerUser!.gender;
    selectedPartnerDate = globalPartnerUser!.dateOfBirth;
    if (selectedPartnerDate != null) {
      dateOfBirthController.text =
          intl.DateFormat('dd/MM/yyyy').format(selectedPartnerDate!);
    }
    passwordController.text = MyEncryptionDecryption.getStringFromEncrypted(
        globalPartnerUser!.password);
  }

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
                        Text(t.fill_partner_details,
                            style: AppTextStyle().title,
                            textAlign: TextAlign.center),
                        const SizedBox(height: 24),
                        phoneNumberFields(),
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
                        ),
                        AppDropDown(
                          onChanged: (value) => genderController.text = value,
                          listValues: [t.male, t.female],
                          showError: errorsMap["gender"],
                          hintText: t.choose_gender,
                          isRequired: true,
                          value: getTranslateGender(genderController.text),
                        ),
                        AppTextField(
                          hintText: t.date_of_birth,
                          controller: dateOfBirthController,
                          readOnly: true,
                          showError: errorsMap["birth"],
                          isRequired: true,
                          child: IconButton(
                              onPressed: () => onDateOfBirthTap(),
                              icon: const Icon(Icons.calendar_month)),
                        ),
                        AppTextField(
                          hintText: t.password,
                          controller: passwordController,
                          checkIfPassword: true,
                        ),
                        errorMessageRow(
                          message: t.first_password,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          color: Colors.black,
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
                  final newPhone = countryCode + phoneController.text;
                  final encryptedPassword =
                      MyEncryptionDecryption.encryptFernet(
                              passwordController.text.isNotEmpty
                                  ? passwordController.text
                                  : "123456")
                          .base64;
                  final partnerPersona = PersonaModel(
                      name: fullNameController.text,
                      phoneNumber: newPhone,
                      password: encryptedPassword,
                      role: RoleModel.partner,
                      registerComplete: false,
                      email: emailController.text.isNotEmpty
                          ? emailController.text
                          : null,
                      gender: genderController.text,
                      dateOfBirth: selectedPartnerDate);

                  widget.onContinue.call(partnerPersona);
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
