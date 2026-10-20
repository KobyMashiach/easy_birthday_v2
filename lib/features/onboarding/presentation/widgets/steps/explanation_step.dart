import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ExplanationScreen extends StatelessWidget {
  const ExplanationScreen({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text("Easy Birthday", style: AppTextStyle().bigTitle),
                        const SizedBox(height: 24),
                        Text(
                          t.explanation_screen_text,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AppButtonsBottomNavigationBar(
              oneButton: true,
              activeButtonText: t.continue_,
              activeButtonOnTap: onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
