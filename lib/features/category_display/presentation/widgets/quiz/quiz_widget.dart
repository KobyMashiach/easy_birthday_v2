import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/done_quiz_page.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/quiz/options_widget.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizWidget extends StatefulWidget {
  final void Function(QuestionModel question, int index, int score)
  saveQuestion;
  final List<QuestionModel> questionsList;
  final int quizGameScore;
  const QuizWidget({
    super.key,
    required this.questionsList,
    required this.saveQuestion,
    required this.quizGameScore,
  });

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late final PageController _controller;
  int _questionNumber = 1;
  late int _score;
  late final List<QuestionModel> questionsList;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _score = widget.quizGameScore;
    questionsList = List.from(widget.questionsList);
    for (final element in questionsList) {
      if (element.isLocked) {
        _questionNumber++;
      } else {
        break;
      }
    }
    _controller = PageController(initialPage: _questionNumber - 1);
    // Quiz already fully answered (e.g. reopened): go straight to results.
    if (_questionNumber > questionsList.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) => navigateToDoneQuiz());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            '${t.question} ${_questionNumber > questionsList.length ? questionsList.length : _questionNumber}/${questionsList.length}',
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

  Widget buildQuestion(QuestionModel question, int index) {
    // Scrolls when the image, a long question and the answers don't fit
    // (small phones, landscape, large text).
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          if (question.imageUrl != null)
            Center(
              child: CachedNetworkImage(
                imageUrl: question.imageUrl!,
                height: 150,
                memCacheHeight: 450,
                placeholder: (context, url) => const SizedBox(
                  height: 150,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  height: 150,
                  child: Icon(Icons.image_not_supported),
                ),
              ),
            ),
          Text(question.text, style: const TextStyle(fontSize: 24)),
          OptionsWidget(
            question: question,
            onClickedOption: (option) {
              // Read the list, not [question]: a second tap can arrive before
              // the rebuild that hands this closure the locked question.
              if (questionsList[index].isLocked) return;
              final answered = question.copyWith(
                isLocked: true,
                selectedOption: option,
              );
              if (option.isCorrect) _score++;
              setState(() => questionsList[index] = answered);
              // Saved right away: the correct answer is now visible, so
              // leaving before the next page must not allow a retry.
              widget.saveQuestion(answered, index, _score);
              _moveToNextQuestion();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _moveToNextQuestion() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    if (_questionNumber < questionsList.length) {
      unawaited(
        _controller.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInExpo,
        ),
      );
      setState(() => _questionNumber++);
    } else {
      await Future<void>.delayed(const Duration(milliseconds: 250));
      if (!mounted) return;
      setState(() => _questionNumber++);
      navigateToDoneQuiz();
    }
  }

  void navigateToDoneQuiz() {
    if (!mounted || _navigated) return;
    if (_questionNumber > questionsList.length) {
      _navigated = true;
      final DoneQuizExtra extra = (
        score: _score,
        numOfQuestions: questionsList.length,
      );
      context.pushReplacementNamed(Routing.doneQuiz, extra: extra);
    }
  }
}
