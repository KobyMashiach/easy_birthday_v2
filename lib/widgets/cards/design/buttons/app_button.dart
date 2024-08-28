import 'package:easy_birthday/core/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool unfillColors;
  final bool disableColors;
  final EdgeInsets? padding;
  final double? textSize;

  const AppButton({
    super.key,
    this.onTap,
    required this.text,
    this.unfillColors = false,
    this.disableColors = false,
    this.padding,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: !disableColors
                ? !unfillColors
                    ? AppColors.primaryColor
                    : Colors.white
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
            border: !unfillColors || disableColors
                ? null
                : Border.all(color: AppColors.primaryColor)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: !disableColors
                  ? !unfillColors
                      ? Colors.white
                      : AppColors.primaryColor
                  : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: textSize ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
