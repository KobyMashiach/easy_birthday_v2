import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddQuestionScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(QuestionModel question, File? image) onDone;

  const AddQuestionScreen({
    super.key,
    required this.category,
    required this.onDone,
  });

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();
  final TextEditingController fourthController = TextEditingController();
  Widget? displayImage;
  File? image;

  int correctAnswer = 1;
  bool trueOrFalseQuestion = false;

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
      appBar: appAppBar(
        title: t.add_question(context: SessionService().gender),
      ),
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
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) => setState(
                        () {
                          trueOrFalseQuestion = !trueOrFalseQuestion;
                          clearAllControllers();
                          if (trueOrFalseQuestion) {
                            firstController.text = t.true_;
                            secondController.text = t.false_;
                          }
                        },
                      ),
                    ),
                    Text(
                      trueOrFalseQuestion
                          ? t.true_false_question
                          : t.four_answers_question,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final chosenImage = await pickImageImagePicker();
                          if (chosenImage != null && mounted) {
                            image = chosenImage;
                            // Decode at ~3x the 150pt preview height, not
                            // full camera resolution.
                            setState(
                              () => displayImage = Image.file(
                                chosenImage,
                                height: 150,
                                cacheHeight: 450,
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColors.primaryColor,
                          ),
                        ),
                        icon: const Icon(
                          Icons.image_search,
                          color: Colors.white,
                        ),
                        label: Text(
                          t.add_image,
                          style: AppTextStyle().description.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ?displayImage,
                AppTextField(
                  hintText: t.question,
                  maxLines: 2,
                  controller: questionController,
                ),
                const SizedBox(height: 24),
                Text(t.choose_currect_answer(context: SessionService().gender)),
                textFieldWithCheckbox(
                  hintText: t.first_question,
                  controller: firstController,
                  index: 1,
                ),
                textFieldWithCheckbox(
                  hintText: t.second_question,
                  controller: secondController,
                  index: 2,
                ),
                if (!trueOrFalseQuestion)
                  textFieldWithCheckbox(
                    hintText: t.third_question,
                    controller: thirdController,
                    index: 3,
                  ),
                if (!trueOrFalseQuestion)
                  textFieldWithCheckbox(
                    hintText: t.fourth_question,
                    controller: fourthController,
                    index: 4,
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        // The PopScope above blocks maybePop (the default cancel action).
        inactiveButtonOnTap: () {
          context.popIfPossible();
        },
        activeButtonOnTap: () {
          if (checkValidation()) {
            final QuestionModel question = QuestionModel(
              text: questionController.text,
              options: [
                OptionModel(
                  text: firstController.text,
                  isCorrect: correctAnswer == 1,
                ),
                OptionModel(
                  text: secondController.text,
                  isCorrect: correctAnswer == 2,
                ),
                if (!trueOrFalseQuestion)
                  OptionModel(
                    text: thirdController.text,
                    isCorrect: correctAnswer == 3,
                  ),
                if (!trueOrFalseQuestion)
                  OptionModel(
                    text: fourthController.text,
                    isCorrect: correctAnswer == 4,
                  ),
              ],
              isLocked: false,
            );
            widget.onDone.call(question, image);
            context.popIfPossible();
          }
        },
      ),
    );
  }

  Row textFieldWithCheckbox({
    required String hintText,
    required TextEditingController controller,
    required int index,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Checkbox(
            activeColor: AppColors.primaryColor,
            value: correctAnswer == index,
            onChanged: (value) => setState(() {
              correctAnswer = index;
            }),
          ),
        ),
        Expanded(
          flex: 9,
          child: AppTextField(
            hintText: hintText,
            controller: controller,
          ),
        ),
      ],
    );
  }

  void clearAllControllers() {
    correctAnswer = 1;
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
        (thirdController.text.isEmpty || fourthController.text.isEmpty)) {
      kheasydevAppToast(t.required_fill_all_answer);
      return false;
    }
    return true;
  }
}
