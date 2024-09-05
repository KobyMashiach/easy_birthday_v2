import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  late TextEditingController dateOfBirthController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    fullNameController = TextEditingController();
    dateOfBirthController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Text("t.your_details", style: AppTextStyle().bigTitle),
                      const SizedBox(height: 24),
                      AppTextField(
                        hintText: t.phone,
                        controller: phoneController,
                        keyboard: TextInputType.phone,
                      ),
                      AppTextField(
                        hintText: t.full_name,
                        controller: fullNameController,
                        keyboard: TextInputType.name,
                      ),
                      AppTextField(
                        hintText: t.date_of_birth,
                        controller: dateOfBirthController,
                        keyboard: TextInputType.datetime,
                      ),
                      AppTextField(
                        hintText: t.email,
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AppButtonsBottomNavigationBar(
            activeButtonText: t.continue_,
            activeButtonOnTap: widget.onContinue,
            inactiveButtonText: t.back,
            inactiveButtonOnTap: widget.onPrevious,
          ),
        ],
      ),
    );
  }

  Future<void> onDateOfBirthTap() async {
    DateTime initialDate = DateTime.now();
    if (dateOfBirthController.text.isNotEmpty) {
      try {
        initialDate =
            DateFormat('dd/MM/yyyy').parse(dateOfBirthController.text);
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
      setState(() {
        dateOfBirthController.text =
            DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }
}
