import 'dart:math';

import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/dev/quiz/options_widget.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class QuizWidget extends StatefulWidget {
  final List<QuestionModel> questionsList;
  final int currectQuestion;
  const QuizWidget(
      {super.key, required this.currectQuestion, required this.questionsList});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;
  Random random = Random();
  late int randomNumberSuccess;
  late int randomNumberFailed;

  @override
  void initState() {
    super.initState();
    randomNumberSuccess = random.nextInt(14) + 1;
    randomNumberFailed = random.nextInt(15) + 1;
    _questionNumber = widget.currectQuestion;
    _controller = PageController(initialPage: widget.currectQuestion - 1);
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
            "שאלה $_questionNumber/${widget.questionsList.length}",
            style: AppTextStyle().title,
          ),
          kheasydevDivider(black: true),
          Expanded(
            child: PageView.builder(
              itemCount: widget.questionsList.length,
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (context, index) {
                return buildQuestion(widget.questionsList[index], index);
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
                widget.questionsList[index] = question;
              });
              _isLocked = question.isLocked;
              if (question.selectedOption!.isCorrect) {
                // await showDialog(
                //     context: context,
                //     builder: (context) => CorrectAnswerDialog(
                //           imageRandomNumber: randomNumberSuccess,
                //         ));
                _score++;
                moveToNextQuestion();
              } else {
                // await showDialog(
                //     context: context,
                //     builder: (context) => WrongAnswerDialog(
                //           imageRandomNumber: randomNumberFailed,
                //         ));
                moveToNextQuestion();
              }
            }
          },
        ))
      ],
    );
  }

  void moveToNextQuestion() {
    if (_questionNumber < widget.questionsList.length) {
      randomNumberSuccess = random.nextInt(14) + 1;
      randomNumberFailed = random.nextInt(15) + 1;
      _controller.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInExpo);
      setState(() {
        _questionNumber++;
        _isLocked = false;
        // localDb.saveCurrentQuestion(index: _questionNumber);
      });
    } else {
      // KheasydevNavigatePage()
      //     .pushAndRemoveUntil(context, DoneQuiz(localDb: localDb));
    }
  }
}
