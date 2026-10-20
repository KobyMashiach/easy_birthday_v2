import 'package:easy_birthday/core/widgets/design_kit/pressable.dart';
import 'package:flutter/material.dart';

/// App button.
///
/// [classic] renders the original kh_easy_dev look (solid / white with an
/// outline), used inside the dialogs which keep their original design.
/// Otherwise it uses the lighter style: solid app color for the primary
/// action and a soft tonal fill for the secondary one.
///
/// The button always sizes to its content (it never stretches to fill the
/// available height) and its label always stays on one line, shrinking to fit
/// narrow spaces instead of wrapping.
Widget kheasydevAppButton({
  VoidCallback? onTap,
  required String text,
  bool unfillColors = false,
  bool disableColors = false,
  EdgeInsets? padding,
  EdgeInsets? margin,
  double? textSize,
  Color? primaryColor,
  Color? textColor,
  bool classic = false,
}) {
  final Color base = primaryColor ?? Colors.black;

  final Color fill;
  final Color label;
  final BoxBorder? border;
  List<BoxShadow>? shadow;
  if (disableColors) {
    fill = classic ? Colors.grey[200]! : const Color(0xFFEDEBEF);
    label = classic ? Colors.black : Colors.black38;
    border = null;
  } else if (!unfillColors) {
    fill = base;
    label = classic || base.computeLuminance() <= 0.6
        ? Colors.white
        : Colors.black87;
    border = null;
    if (!classic) {
      shadow = [
        BoxShadow(
          color: base.withValues(alpha: 0.28),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ];
    }
  } else if (classic) {
    fill = Colors.white;
    label = base;
    border = Border.all(color: base);
  } else {
    fill = Color.lerp(Colors.white, base, 0.14)!;
    // Muted ink tinted with the app color: readable, not saturated.
    label = Color.lerp(base, const Color(0xFF1F1D22), 0.6)!;
    border = null;
  }

  return Padding(
    padding: margin ?? const EdgeInsets.symmetric(horizontal: 12),
    child: Pressable(
      onTap: onTap,
      semanticLabel: text,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        constraints: const BoxConstraints(minHeight: 44),
        padding: padding ?? const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(classic ? 30 : 18),
          border: border,
          boxShadow: shadow,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 24),
            Expanded(
              // heightFactor: 1 keeps the button as tall as its text instead
              // of expanding to the parent's full height.
              child: Center(
                heightFactor: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor ?? label,
                      fontWeight: FontWeight.bold,
                      fontSize: textSize ?? 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    ),
  );
}
