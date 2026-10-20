import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screen_layout.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/quiz/quiz_widget.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:flutter/material.dart';

class DisplayQuizGame extends StatefulWidget {
  final CategoryModel category;
  final void Function(QuestionModel question, int index, int score)
  saveQuestion;
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
  final String partnerName = SessionService().partner?.name ?? '';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !startQuiz,
      child: Scaffold(
        appBar: appAppBar(
          title: widget.category.displayTitle,
        ),
        body: !startQuiz
            ? Padding(
                padding: const EdgeInsets.all(24),
                child: DisplayScreenLayout(
                  category: widget.category,
                  body: Column(
                    children: [
                      // Scrolls on short screens; otherwise fills the gap
                      // above the start button like the old Spacer did.
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            _hasQuestions
                                ? t.quiz_game_partner_description(
                                    context: SessionService().gender,
                                    name: partnerName,
                                    number: widget.category.quizGame!.length,
                                  )
                                : t.quiz_game_partner_no_questions(
                                    context: SessionService().gender,
                                    name: partnerName,
                                  ),
                            textAlign: TextAlign.center,
                            style: AppTextStyle().title,
                          ),
                        ),
                      ),
                      if (_hasQuestions)
                        appButton(
                          text: t.click_here_start(
                            context: SessionService().gender,
                          ),
                          onTap: () => setState(() => startQuiz = true),
                        ),
                    ],
                  ),
                ),
              )
            : QuizWidget(
                questionsList: widget.category.quizGame ?? [],
                saveQuestion: widget.saveQuestion,
                quizGameScore: widget.category.quizGameScore,
              ),
      ),
    );
  }

  bool get _hasQuestions => widget.category.quizGame?.isNotEmpty ?? false;
}
