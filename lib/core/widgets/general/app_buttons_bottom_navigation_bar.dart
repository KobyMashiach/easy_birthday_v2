import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonsBottomNavigationBar extends StatelessWidget {
  final bool oneButton;
  final String? activeButtonText;
  final bool activeButtonDisable;
  final VoidCallback? activeButtonOnTap;
  final String? inactiveButtonText;
  final VoidCallback? inactiveButtonOnTap;
  final bool middleButton;
  final String? middleButtonText;
  final VoidCallback? middleButtonOnTap;
  const AppButtonsBottomNavigationBar({
    super.key,
    this.oneButton = false,
    this.activeButtonText,
    this.activeButtonDisable = false,
    this.inactiveButtonText,
    this.activeButtonOnTap,
    this.inactiveButtonOnTap,
    this.middleButton = false,
    this.middleButtonText,
    this.middleButtonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        border: const Border(top: BorderSide(color: AppColors.hairline)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!oneButton) ...[
                Expanded(
                  child: appButton(
                    text: inactiveButtonText ?? t.cancel,
                    unfillColors: true,
                    onTap:
                        inactiveButtonOnTap ??
                        () => Navigator.of(context).maybePop(),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              if (middleButton) ...[
                Expanded(
                  child: appButton(
                    text: middleButtonText ?? t.cancel,
                    unfillColors: true,
                    onTap:
                        middleButtonOnTap ??
                        () => Navigator.of(context).maybePop(),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: appButton(
                  text: activeButtonText ?? t.ok,
                  onTap: activeButtonDisable
                      ? null
                      : activeButtonOnTap ??
                            () => Navigator.of(context).maybePop(),
                  disableColors: activeButtonDisable,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
