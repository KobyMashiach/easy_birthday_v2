import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/dev/quiz/done_quiz.dart';
import 'package:easy_birthday/dev/quiz/options_widget.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class QuizWidget extends StatefulWidget {
  final Function(QuestionModel question, int index) saveQuestion;
  final List<QuestionModel> questionsList;
  const QuizWidget(
      {super.key, required this.questionsList, required this.saveQuestion});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;
  late List<QuestionModel> questionsList;

  @override
  void initState() {
    super.initState();
    questionsList = List.from(widget.questionsList);

    for (var element in questionsList) {
      if (element.isLocked) {
        _questionNumber++;
      } else {
        break;
      }
    }
    if (_questionNumber > questionsList.length) {
      KheasydevNavigatePage().push(context, DoneQuiz(score: _score));
    }
    _controller = PageController(initialPage: _questionNumber - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 32),
          Text(
            "שאלה $_questionNumber/${questionsList.length}",
            style: AppTextStyle().title,
          ),
          kheasydevDivider(black: true),
          Expanded(
            child: PageView.builder(
              itemCount: questionsList.length,
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (context, index) {
                return buildQuestion(questionsList[index], index);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Column buildQuestion(QuestionModel question, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        if (question.imageUrl != null)
          Center(child: Image.network(question.imageUrl!, height: 150)),
        const SizedBox(height: 32),
        Text(question.text, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 32),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) async {
              if (question.isLocked) {
                return;
              } else {
                setState(() {
                  question =
                      question.copyWith(isLocked: true, selectedOption: option);
                  questionsList[index] = question;
                });
                _isLocked = question.isLocked;
                if (question.selectedOption!.isCorrect) {
                  _score++;
                }
                moveToNextQuestion(question);
              }
            },
          ),
        )
      ],
    );
  }

  void moveToNextQuestion(QuestionModel question) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_questionNumber < questionsList.length) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInExpo);
      setState(() {
        _isLocked = false;
        widget.saveQuestion.call(question, _questionNumber - 1);
        _questionNumber++;
      });
    } else {
      KheasydevNavigatePage().push(context, DoneQuiz(score: _score));
    }
  }
}
