import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Light, modern app bar: blends into the page background, a small round logo
/// at the end, and a soft tint only once content scrolls underneath.
AppBar kheasydevAppBar({
  required String title,
  Widget? leading,
  List<Widget>? actions,
  String? logoPath,
  Color? primaryColor,
  String? developerRoute,
  BuildContext? context,
  Color? titleColor,
}) {
  final Color foreground = titleColor ?? const Color(0xFF1F1D22);
  return AppBar(
    backgroundColor: Colors.transparent,
    surfaceTintColor: primaryColor,
    scrolledUnderElevation: 2,
    elevation: 0,
    centerTitle: true,
    toolbarHeight: 64,
    foregroundColor: foreground,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(color: foreground),
    leading: leading,
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: foreground,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    actions: [
      ...?actions,
      if (logoPath != null && logoPath.isNotEmpty)
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 12, start: 4),
          child: GestureDetector(
            // Hidden developer entry; plain users only see the logo.
            onLongPress: developerRoute != null && context != null
                ? () => context.pushNamed(developerRoute)
                : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                logoPath,
                width: 40,
                height: 40,
                cacheWidth: 120,
                fit: BoxFit.cover,
                // Decorative: the title is already announced.
                excludeFromSemantics: true,
                errorBuilder: (_, _, _) => const SizedBox(width: 40),
              ),
            ),
          ),
        ),
    ],
  );
}
