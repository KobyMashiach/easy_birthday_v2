import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/core/long_texts.dart';
import 'package:flutter/material.dart';

class ExplanationScreen extends StatelessWidget {
  final VoidCallback onContinue;
  const ExplanationScreen({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text(firstRegisterHE, textAlign: TextAlign.center),
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
    );
  }
}
