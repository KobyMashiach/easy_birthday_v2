import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromARGB(255, 220, 155, 155);
  static Color shadowColor = darkenColor(primaryColor, 0.2);
  static Color disableColor = darkenColor(primaryColor, 0.4);

  static const Color buttomBackground = Color.fromARGB(255, 0, 0, 0);
  static Color greyDisableColor = Colors.grey[400]!;
  static Color greyLightDisableColor = Colors.grey[200]!;
  static Color error = Colors.red;
}

void changeAppColors(Color color) {
  AppColors.primaryColor = color;
  AppColors.shadowColor = color.computeLuminance() >= 0.05
      ? darkenColor(color, 0.2)
      : brightnessColor(color, 0.2);
  AppColors.disableColor = darkenColor(color, 0.4);
}

Color darkenColor(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final darkened = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return darkened.toColor();
}

Color brightnessColor(Color color, double amount) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final darkened = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return darkened.toColor();
}
