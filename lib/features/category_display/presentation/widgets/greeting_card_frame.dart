import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// A cream greeting card with a double frame in the app color and a heart in
/// each corner, that unfolds in when shown.
class GreetingCardFrame extends StatelessWidget {
  final Widget child;
  const GreetingCardFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final Color frame = AppColors.primaryColor;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutBack,
      builder: (context, v, child) => Opacity(
        opacity: v.clamp(0.0, 1.0),
        child: Transform(
          alignment: Alignment.topCenter,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0015)
            ..rotateX((1 - v) * -0.9),
          child: child,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFFBF4), Color(0xFFFFF1F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: frame, width: 2),
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color: frame.withValues(alpha: 0.5),
                width: 0.8,
              ),
            ),
            child: Stack(
              children: [
                for (final alignment in const [
                  Alignment.topLeft,
                  Alignment.topRight,
                  Alignment.bottomLeft,
                  Alignment.bottomRight,
                ])
                  Align(
                    alignment: alignment,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Icon(Icons.favorite, size: 14, color: frame),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 28, 22, 28),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
