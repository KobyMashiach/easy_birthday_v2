import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle get bigTitle =>
      TextStyle(fontSize: 48, fontWeight: FontWeight.bold);
  TextStyle get title => TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  TextStyle get description => TextStyle(fontSize: 24);
  TextStyle get smallDescription => TextStyle(fontSize: 20);
  TextStyle get error => TextStyle(fontSize: 24, color: Colors.red);
  TextStyle get dropDownValues => TextStyle(fontSize: 16);
  TextStyle get mainListValues => TextStyle(fontSize: 28);
  TextStyle get cardTitle =>
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
}
