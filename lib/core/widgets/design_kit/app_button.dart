import 'package:flutter/material.dart';

/// App button: solid primary color, or white with an outline when
/// [unfillColors] is set.
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
}) {
  final Color base = primaryColor ?? Colors.black;
  return Semantics(
    button: true,
    label: text,
    excludeSemantics: true,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(12.0),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: !disableColors
              ? !unfillColors
                    ? base
                    : Colors.white
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
          border: !unfillColors || disableColors
              ? null
              : Border.all(color: base),
        ),
        // heightFactor: 1 keeps the button as tall as its text instead of
        // filling the parent; the label stays on one line, shrinking to fit.
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
                color:
                    textColor ??
                    (!disableColors
                        ? !unfillColors
                              ? Colors.white
                              : base
                        : Colors.black),
                fontWeight: FontWeight.bold,
                fontSize: textSize ?? 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
