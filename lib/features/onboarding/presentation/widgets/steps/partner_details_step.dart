import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/countries/countries_functions.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/core/services/encryption_service.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/app_dropdown.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/countries_codes_dropdown.dart';
import 'package:easy_birthday/core/widgets/general/error_message_row.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_toast.dart';
import 'package:easy_birthday/core/services/firebase/password_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class PartnerDetailsScreen extends StatefulWidget {
  const PartnerDetailsScreen({
    super.key,
    required this.onContinue,
    required this.onPrevious,
  });

  final void Function(PersonaModel persona) onContinue;
  final VoidCallback onPrevious;

  @override
  State<PartnerDetailsScreen> createState() => _PartnerDetailsScreenState();
}

class _PartnerDetailsScreenState extends State<PartnerDetailsScreen> {
  String countryCode = "+972";
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final Map<String, bool> errorsMap = {
    "phone": false,
    "name": false,
    "email": false,
    "gender": false,
    "birth": false,
  };

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DateTime? selectedPartnerDate;

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
    if (SessionService().partner != null) {
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
            ),
          ),
          Expanded(
            flex: 6,
            child: AppTextField(
              hintText: t.phone,
              controller: phoneController,
              keyboard: TextInputType.phone,
              showError: errorsMap["phone"],
              textInputAction: TextInputAction.next,
              isRequired: true,
            ),
          ),
        ],
      ),
    );
  }

  bool formValidation() {
    // Spaces/dashes would end up in the stored number the partner logs in with.
    phoneController.text = phoneController.text.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );
    fullNameController.text = fullNameController.text.trim();
    emailController.text = emailController.text.trim();
    if (phoneController.text.length == 10 &&
        phoneController.text.startsWith('0')) {
      phoneController.text = phoneController.text.substring(1);
    }
    errorsMap["phone"] =
        countryCode.isEmpty ||
        phoneController.text.length < 6 ||
        phoneController.text.length > 9;
    errorsMap["name"] = !(fullNameController.text.length >= 2);
    errorsMap["email"] =
        !(emailController.text.isEmpty ||
            RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            ).hasMatch(emailController.text));
    errorsMap["gender"] = !(genderController.text.isNotEmpty);
    errorsMap["birth"] = !(dateOfBirthController.text.isNotEmpty);
    if (errorsMap.containsValue(true)) return false;
    if (countryCode + phoneController.text ==
        SessionService().user.phoneNumber) {
      errorsMap["phone"] = true;
      kheasydevAppToast(t.partner_phone_is_yours);
      return false;
    }
    return true;
  }

  Future<void> onDateOfBirthTap() async {
    DateTime initialDate = DateTime.now();
    if (dateOfBirthController.text.isNotEmpty) {
      try {
        initialDate = intl.DateFormat(
          'dd/MM/yyyy',
        ).parse(dateOfBirthController.text);
      } catch (e) {
        initialDate = DateTime.now();
      }
    }

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );

    if (selectedDate != null && mounted) {
      selectedPartnerDate = selectedDate;
      setState(() {
        dateOfBirthController.text = intl.DateFormat(
          'dd/MM/yyyy',
        ).format(selectedDate);
      });
    }
  }

  void initPartnerDetails() {
    final splitPhone = CountriesFunctions().splitPhone(
      SessionService().partner!.phoneNumber,
    );
    countryCode = splitPhone.$1 ?? "+972";
    phoneController.text = splitPhone.$2;
    fullNameController.text = SessionService().partner!.name;
    emailController.text = SessionService().partner!.email ?? "";
    genderController.text = SessionService().partner!.gender;
    selectedPartnerDate = SessionService().partner!.dateOfBirth;
    if (selectedPartnerDate != null) {
      dateOfBirthController.text = intl.DateFormat(
        'dd/MM/yyyy',
      ).format(selectedPartnerDate!);
    }
    // Empty once the partner has a Firebase password (it isn't stored here).
    passwordController.text =
        legacyPassword(SessionService().partner!.password) ?? "";
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
                          t.fill_partner_details,
                          style: AppTextStyle().title,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        phoneNumberFields(),
                        AppTextField(
                          hintText: t.first_name,
                          controller: fullNameController,
                          keyboard: TextInputType.name,
                          showError: errorsMap["name"],
                          isRequired: true,
                          textInputAction: TextInputAction.next,
                        ),
                        AppTextField(
                          hintText: t.email,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          showError: errorsMap["email"],
                          textInputAction: TextInputAction.next,
                        ),
                        AppDropDown(
                          // Store the canonical value: the labels are translated (and
                          // capitalized in English), which the gender helpers
                          // don't recognize.
                          onChanged: (value) => genderController.text =
                              value == t.male ? 'male' : 'female',
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
                          textInputAction: TextInputAction.next,
                          child: IconButton(
                            onPressed: () => onDateOfBirthTap(),
                            icon: const Icon(Icons.calendar_month),
                          ),
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
                  // The partner gets a real Firebase password the first time
                  // they log in and verify their phone by SMS. Until then the
                  // initial password is kept (encrypted) for that first login.
                  // A blank field keeps whatever the partner already has.
                  final String? existing = SessionService().partner?.password;
                  final encryptedPassword = passwordController.text.isNotEmpty
                      ? MyEncryptionDecryption.encryptFernet(
                          passwordController.text,
                        ).base64
                      : existing ??
                            MyEncryptionDecryption.encryptFernet(
                              "123456",
                            ).base64;
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
                    dateOfBirth: selectedPartnerDate,
                  );

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
