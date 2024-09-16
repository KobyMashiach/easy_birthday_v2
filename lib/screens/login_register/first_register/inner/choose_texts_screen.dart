import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ChooseTextsScreen extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onPrevious;
  const ChooseTextsScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => onPrevious(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("Choose Text"),
            ],
          ),
        ),
        bottomNavigationBar: AppButtonsBottomNavigationBar(
          activeButtonText: t.continue_,
          activeButtonOnTap: () async {
            onContinue.call();
          },
          inactiveButtonText: t.back,
          inactiveButtonOnTap: onPrevious,
        ),
      ),
    );
  }
}