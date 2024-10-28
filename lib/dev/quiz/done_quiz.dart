import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class DoneQuiz extends StatelessWidget {
  final int score;
  const DoneQuiz({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "title"),
      body: Center(
        child: Text(score.toString()),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}
