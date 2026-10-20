import 'package:flutter/material.dart';

Widget kheasydevDivider({double? height, EdgeInsets? padding, bool? black}) {
  return Padding(
    padding: padding ?? const EdgeInsets.only(top: 8),
    child: SizedBox(
      height: height ?? 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: black == true
                ? const [Colors.black12, Colors.black, Colors.black12]
                : const [Colors.white10, Colors.white, Colors.white10],
            stops: const [0.0, 0.5, 1.0],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
      ),
    ),
  );
}

Widget kheasydevVerticalDivider({
  double? height,
  EdgeInsets? padding,
  bool? black,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: 1,
      height: height ?? 60,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: black == true
                ? const [Colors.black12, Colors.black, Colors.black12]
                : const [Colors.white10, Colors.white, Colors.white10],
            stops: const [0.0, 0.5, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ),
  );
}
