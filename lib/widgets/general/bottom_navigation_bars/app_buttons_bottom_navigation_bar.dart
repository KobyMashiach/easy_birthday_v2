import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AppButtonsBottomNavigationBar extends StatelessWidget {
  final bool oneButton;
  final String? activeButtonText;
  final bool activeButtonDisable;
  final String? inactiveButtonText;
  final VoidCallback? activeButtonOnTap;
  final VoidCallback? inactiveButtonOnTap;
  const AppButtonsBottomNavigationBar({
    super.key,
    this.oneButton = false,
    this.activeButtonText,
    this.activeButtonDisable = false,
    this.inactiveButtonText,
    this.activeButtonOnTap,
    this.inactiveButtonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * (0.10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!oneButton) ...[
              Expanded(
                child: AppButton(
                  text: inactiveButtonText ?? t.cancel,
                  unfillColors: true,
                  onTap: inactiveButtonOnTap ??
                      () => KheasydevNavigatePage().pop(context),
                ),
              ),
              const SizedBox(width: 40),
            ],
            Expanded(
                child: AppButton(
              text: activeButtonText ?? t.ok,
              onTap: activeButtonDisable
                  ? null
                  : activeButtonOnTap ??
                      () => KheasydevNavigatePage().pop(context),
              disableColors: activeButtonDisable,
            )),
          ],
        ),
      ),
    );
  }
}
