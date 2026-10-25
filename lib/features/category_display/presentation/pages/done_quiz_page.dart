import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/confetti_widget.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/dual_number_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

/// `extra` for [Routing.doneQuiz]; only pushed from inside this feature.
typedef DoneQuizExtra = ({int score, int numOfQuestions});

class DoneQuizScreen extends StatelessWidget {
  final int score;
  final int numOfQuestions;
  const DoneQuizScreen({
    super.key,
    required this.score,
    required this.numOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.quiz_game_done),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const ScreenConfettiWidget(),
          Center(
            // Scrolls instead of overflowing on short screens.
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(t.quiz_game_done, style: AppTextStyle().title),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.elasticOut,
                    builder: (context, v, child) =>
                        Transform.scale(scale: v, child: child),
                    child: SvgPicture.asset(partyIllustrations, height: 260),
                  ),
                  // Counts up to the score.
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: score.toDouble()),
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, _) => DualNumberCircularProgress(
                      activeNumber: value.round(),
                      totalNumber: numOfQuestions,
                      size: 130,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      _verdict(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle().subTitle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    t.you_answer_from(
                      answers: score,
                      questions: numOfQuestions,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonText: t.exit,
        activeButtonOnTap: () => context.goNamed(Routing.home),
      ),
    );
  }

  /// A line that fits the score.
  String _verdict() {
    final double ratio = numOfQuestions == 0 ? 0 : score / numOfQuestions;
    final gender = SessionService().gender;
    if (ratio >= 0.8) return t.quiz_verdict_great(context: gender);
    if (ratio >= 0.5) return t.quiz_verdict_good(context: gender);
    return t.quiz_verdict_low(context: gender);
  }
}
