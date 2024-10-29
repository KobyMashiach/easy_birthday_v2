import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/widgets/design/general/confetti_widget.dart';
import 'package:easy_birthday/widgets/design/general/dual_number_circular_progress.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class DoneQuizScreen extends StatelessWidget {
  final int score;
  final int numOfQuestions;
  const DoneQuizScreen(
      {super.key, required this.score, required this.numOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.quiz_game_done),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const ScreenConfettiWidget(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(t.quiz_game_done, style: AppTextStyle().title),
                SvgPicture.asset(partyIllustrations, height: 300),
                DualNumberCircularProgress(
                  activeNumber: score,
                  totalNumber: numOfQuestions,
                ),
                const SizedBox(height: 16),
                Text(t.you_answer_from(
                    answers: score, questions: numOfQuestions)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonText: t.exit,
        activeButtonOnTap: () => KheasydevNavigatePage()
            .pushAndRemoveUntilDuration(context, const HomeScreen()),
      ),
    );
  }
}
