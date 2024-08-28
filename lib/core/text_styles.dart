import 'package:flutter/material.dart';

final Color textColor = Colors.black;

class AppTextStyle {
  TextStyle get title =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textColor);
  TextStyle get description => TextStyle(fontSize: 24, color: textColor);
  TextStyle get error => TextStyle(fontSize: 24, color: Colors.red);
  TextStyle get dropDownValues => TextStyle(fontSize: 16, color: textColor);
  TextStyle get mainListValues => TextStyle(fontSize: 28, color: textColor);
  TextStyle get cardTitle =>
      TextStyle(fontSize: 28, color: textColor, fontWeight: FontWeight.bold);
}
