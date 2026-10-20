import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromARGB(255, 220, 155, 155);
  static Color disableColor = darkenColor(primaryColor, 0.4);

  static const Color buttonBackground = Color.fromARGB(255, 0, 0, 0);
  static final Color greyDisableColor = Colors.grey[400]!;
  static final Color greyLightDisableColor = Colors.grey[200]!;
  static const Color error = Colors.red;

  // Light, airy surfaces derived from the user's chosen color.
  /// Page background: white with a faint wash of the app color.
  static Color get background => Color.lerp(Colors.white, primaryColor, 0.05)!;

  /// Soft fill for inputs and tonal (secondary) buttons.
  static Color get softFill => Color.lerp(Colors.white, primaryColor, 0.12)!;

  /// Readable accent for text/icons on light surfaces (the chosen color can be
  /// too pale to read as text).
  static Color get accentOnLight => primaryColor.computeLuminance() > 0.45
      ? darkenColor(primaryColor, 0.25)
      : primaryColor;

  static const Color ink = Color(0xFF1F1D22);
  static const Color inkSecondary = Color(0xFF6B6770);
  static const Color hairline = Color(0x14000000);
}

void changeAppColors(Color color) {
  AppColors.primaryColor = color;
  AppColors.disableColor = darkenColor(color, 0.4);
}

Color darkenColor(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final darkened = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return darkened.toColor();
}
