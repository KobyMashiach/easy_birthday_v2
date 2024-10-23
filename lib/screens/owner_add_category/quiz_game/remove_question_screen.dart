import 'dart:developer';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/widgets/design/buttons/next_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';

class RemoveQuestionScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(List<QuestionModel> question) onDone;

  const RemoveQuestionScreen(
      {super.key, required this.category, required this.onDone});

  @override
  State<RemoveQuestionScreen> createState() => _RemoveQuestionScreenState();
}

class _RemoveQuestionScreenState extends State<RemoveQuestionScreen> {
  late List<QuestionModel> questionsInCategory;
  late List<bool> checkBoxes;

  @override
  void initState() {
    super.initState();
    questionsInCategory = widget.category.quizGame ?? [];
    checkBoxes = List.generate(questionsInCategory.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.remove_question(context: globalGender)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.add_task_sharp,
                    size: 60,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    "הסר שאלה",
                    style: AppTextStyle().title.copyWith(fontSize: 40),
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(t.choose_question_delete(context: globalGender)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: questionsInCategory.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) => listViewBuilder(index),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NextButton(
                  onTap: () {
                    final List<int> indexes = [];
                    for (int i = 0; i < checkBoxes.length; i++) {
                      if (checkBoxes[i] == true) indexes.add(i);
                    }
                    log(indexes.toString());
                    Navigator.pop(context, ("remove", indexes));
                  },
                  icon: Icons.done),
            ),
          ],
        ),
      ),
    );
  }

  Row listViewBuilder(int index) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Checkbox(
                value: checkBoxes[index],
                onChanged: (value) => setState(() {
                      checkBoxes[index] = !checkBoxes[index];
                    }))),
        Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.all(4),
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(questionsInCategory.elementAt(index).text),
            )),
      ],
    );
  }
}
