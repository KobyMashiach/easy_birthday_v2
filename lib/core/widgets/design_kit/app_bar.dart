import 'package:easy_birthday/core/widgets/design_kit/dividers.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

AppBar kheasydevAppBar({
  required String title,
  Widget? leading,
  List<Widget>? actions,
  String? logoPath,
  Color? primaryColor,
  Color? shadowColor,
  String? developerRoute,
  BuildContext? context,
  Color? titleColor,
}) {
  return AppBar(
    backgroundColor: primaryColor ?? Colors.black,
    title: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: titleColor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kheasydevVerticalDivider(),
          GestureDetector(
            // Hidden developer entry; plain users only see the logo.
            onLongPress: developerRoute != null && context != null
                ? () => context.pushNamed(developerRoute)
                : null,
            child: Image.asset(
              logoPath ?? '',
              width: 60,
              height: 60,
              excludeFromSemantics: true,
              errorBuilder: (_, _, _) => const SizedBox(width: 60),
            ),
          ),
        ],
      ),
    ),
    leading: leading,
    actions: actions ?? [],
    centerTitle: true,
    toolbarHeight: 70,
    elevation: 20,
    shadowColor: shadowColor ?? Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
