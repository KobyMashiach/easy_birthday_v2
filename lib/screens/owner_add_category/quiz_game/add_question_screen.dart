import 'dart:io';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

import 'package:easy_birthday/models/quiz_models/option_model/option_model.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddQuestionScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(QuestionModel question, File? image) onDone;

  const AddQuestionScreen(
      {super.key, required this.category, required this.onDone});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  late TextEditingController questionController;
  late TextEditingController imageUrlController;
  late TextEditingController firstController;
  late TextEditingController secondController;
  late TextEditingController thirdController;
  late TextEditingController fourthController;
  Widget? displayImage;
  File? image;

  int currectAnswer = 1;
  bool trueOrFalseQuestion = false;

  @override
  void initState() {
    questionController = TextEditingController();
    firstController = TextEditingController();
    secondController = TextEditingController();
    thirdController = TextEditingController();
    fourthController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    questionController.dispose();
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.add_question(context: globalGender)),
      body: PopScope(
        canPop: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: trueOrFalseQuestion,
                        onChanged: (value) => setState(() {
                              trueOrFalseQuestion = !trueOrFalseQuestion;
                              clearAllControllers();
                              if (trueOrFalseQuestion) {
                                firstController.text = t.true_;
                                secondController.text = t.false_;
                              }
                            })),
                    Text(trueOrFalseQuestion
                        ? t.true_false_question
                        : t.four_answers_question),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ElevatedButton.icon(
                          onPressed: () async {
                            final image = await pickSingleImage();
                            if (image != null) {
                              setState(() => displayImage =
                                  Image.file(image, height: 150));
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  AppColors.primaryColor)),
                          icon: const Icon(Icons.image_search,
                              color: Colors.white),
                          label: Text(
                            t.add_image,
                            style: AppTextStyle()
                                .description
                                .copyWith(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                if (displayImage != null) displayImage!,
                AppTextField(
                  hintText: t.question,
                  maxLines: 2,
                  controller: questionController,
                ),
                const SizedBox(height: 24),
                Text(t.choose_currect_answer(context: globalGender)),
                textFieldWithCheckbox(
                    hintText: t.first_question,
                    controller: firstController,
                    index: 1),
                textFieldWithCheckbox(
                    hintText: t.second_question,
                    controller: secondController,
                    index: 2),
                if (!trueOrFalseQuestion)
                  textFieldWithCheckbox(
                      hintText: t.third_question,
                      controller: thirdController,
                      index: 3),
                if (!trueOrFalseQuestion)
                  textFieldWithCheckbox(
                      hintText: t.fourth_question,
                      controller: fourthController,
                      index: 4),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {
          if (checkValidation()) {
            final QuestionModel question = QuestionModel(
              text: questionController.text,
              options: [
                OptionModel(
                    text: firstController.text, isCorrect: currectAnswer == 1),
                OptionModel(
                    text: secondController.text, isCorrect: currectAnswer == 2),
                if (!trueOrFalseQuestion)
                  OptionModel(
                      text: thirdController.text,
                      isCorrect: currectAnswer == 3),
                if (!trueOrFalseQuestion)
                  OptionModel(
                      text: fourthController.text,
                      isCorrect: currectAnswer == 4),
              ],
              isLocked: false,
              selectedOption: null,
            );
            widget.onDone.call(question, image);
            KheasydevNavigatePage().pop(context);
          }
        },
      ),
    );
  }

  Row textFieldWithCheckbox(
      {required String hintText,
      required TextEditingController controller,
      required int index}) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Checkbox(
                value: currectAnswer == index,
                onChanged: (value) => setState(() {
                      currectAnswer = index;
                    }))),
        Expanded(
            flex: 9,
            child: AppTextField(
              hintText: hintText,
              controller: controller,
              onChanged: (value) => controller.text = value,
            )),
      ],
    );
  }

  void clearAllControllers() {
    currectAnswer = 1;
    questionController.clear();
    firstController.clear();
    secondController.clear();
    thirdController.clear();
    fourthController.clear();
  }

  bool checkValidation() {
    if (questionController.text.isEmpty) {
      kheasydevAppToast(t.required_fill_question);
      return false;
    }
    if (firstController.text.isEmpty || secondController.text.isEmpty) {
      kheasydevAppToast(t.required_fill_all_answer);
      return false;
    }
    if (!trueOrFalseQuestion &&
        thirdController.text == "" &&
        fourthController.text == "") {
      kheasydevAppToast(t.required_fill_all_answer);
      return false;
    }
    return true;
  }
}
