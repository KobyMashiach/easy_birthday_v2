import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle get bigTitle =>
      const TextStyle(fontSize: 48, fontWeight: FontWeight.bold);
  TextStyle get title =>
      const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  TextStyle get subTitle =>
      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  TextStyle get description => const TextStyle(fontSize: 24);
  TextStyle get smallDescription => const TextStyle(fontSize: 20);
  TextStyle get error => const TextStyle(fontSize: 16, color: Colors.red);
  TextStyle get dropDownValues => const TextStyle(fontSize: 16);
  TextStyle get mainListValues => const TextStyle(fontSize: 28);
  TextStyle get cardTitle =>
      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

  TextStyle get watchTitle =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle get watchSubTitle =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get watchDescription => const TextStyle(fontSize: 16);
}
