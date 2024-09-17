import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/cards/capsule_expanded_text_card.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ChooseTextsScreen extends StatefulWidget {
  const ChooseTextsScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  final VoidCallback onContinue;
  final VoidCallback onPrevious;

  @override
  State<ChooseTextsScreen> createState() => _ChooseTextsScreenState();
}

class _ChooseTextsScreenState extends State<ChooseTextsScreen> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => widget.onPrevious(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.separated(
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return CapsuleExpandedTextCard(
                index: index,
                isExpanded: expandedIndex == index,
                onTap: () {
                  setState(() {
                    if (expandedIndex == index) {
                      expandedIndex = null;
                    } else {
                      expandedIndex = index;
                    }
                  });
                },
              );
            },
          ),
        ),
        bottomNavigationBar: AppButtonsBottomNavigationBar(
          activeButtonText: t.continue_,
          activeButtonOnTap: () async {
            widget.onContinue.call();
          },
          inactiveButtonText: t.back,
          inactiveButtonOnTap: widget.onPrevious,
        ),
      ),
    );
  }
}
