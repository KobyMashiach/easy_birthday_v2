import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/dev/quiz/quiz_widget.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:flutter/material.dart';

import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/display_screens_top.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

class DisplayQuizGame extends StatefulWidget {
  final CategoryModel category;
  final Function(QuestionModel question, int index) saveQuestion;
  const DisplayQuizGame({
    super.key,
    required this.category,
    required this.saveQuestion,
  });

  @override
  State<DisplayQuizGame> createState() => _DisplayQuizGameState();
}

class _DisplayQuizGameState extends State<DisplayQuizGame> {
  bool startQuiz = false;
  final String partnerName = globalPartnerUser!.name;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      // canPop: !startQuiz,
      child: Scaffold(
        appBar: appAppBar(title: widget.category.titleAppear!),
        body: !startQuiz
            ? Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DisplayScreensTop(category: widget.category),
                      Text(
                        widget.category.quizGame != null
                            ? t.quiz_game_partner_description(
                                context: globalGender,
                                name: partnerName,
                                number: widget.category.quizGame!.length)
                            : t.quiz_game_partner_no_questions(
                                context: globalGender, name: partnerName),
                        textAlign: TextAlign.center,
                        style: AppTextStyle().title,
                      ),
                      const Spacer(),
                      appButton(
                          text: t.click_here_start(context: globalGender),
                          onTap: () => setState(() => startQuiz = true)),
                    ],
                  ),
                ),
              )
            : QuizWidget(
                questionsList: widget.category.quizGame ?? [],
                saveQuestion: widget.saveQuestion,
              ),
      ),
    );
  }
}
