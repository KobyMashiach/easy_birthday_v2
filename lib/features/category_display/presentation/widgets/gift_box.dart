import 'dart:math' as math;

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// A wrapped gift in the app color. [open] runs 0 → 1: the box shakes, then
/// the lid flies off and sparkles burst out.
class GiftBox extends StatelessWidget {
  final double open;

  /// The idle wiggle (0 → 1, repeating), while closed.
  final double wiggle;
  final double size;

  const GiftBox({
    super.key,
    required this.open,
    required this.wiggle,
    this.size = 180,
  });

  @override
  Widget build(BuildContext context) {
    // Idle: a quick wiggle at the start of each loop, still otherwise.
    final double idle = wiggle < 0.2
        ? math.sin(wiggle / 0.2 * math.pi * 3) * 0.06
        : 0;
    // Opening: shakes harder and harder for the first third.
    final double shake = open < 0.35
        ? math.sin(open / 0.35 * math.pi * 10) * 0.08 * (open / 0.35)
        : 0;
    return SizedBox(
      width: size,
      height: size * 1.3,
      child: Transform.rotate(
        angle: open == 0 ? idle : shake,
        alignment: Alignment.bottomCenter,
        child: CustomPaint(
          painter: _GiftPainter(
            open: open,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

class _GiftPainter extends CustomPainter {
  final double open;
  final Color color;

  const _GiftPainter({required this.open, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final Color ribbon = Color.lerp(color, Colors.white, 0.75)!;
    final Color dark = Color.lerp(color, Colors.black, 0.25)!;

    // Box.
    final Rect box = Rect.fromLTWH(w * 0.1, h * 0.45, w * 0.8, h * 0.52);
    canvas.drawRRect(
      RRect.fromRectAndRadius(box, const Radius.circular(8)),
      Paint()..color = color,
    );
    canvas.drawRect(
      Rect.fromCenter(center: box.center, width: w * 0.14, height: box.height),
      Paint()..color = ribbon,
    );

    // Sparkles flying out of the open box.
    final double burst = ((open - 0.35) / 0.65).clamp(0.0, 1.0);
    if (burst > 0) {
      final math.Random random = math.Random(5);
      for (int i = 0; i < 14; i++) {
        final double angle = -math.pi / 2 + (random.nextDouble() - 0.5) * 2.2;
        final double distance =
            burst * (h * 0.35 + random.nextDouble() * h * 0.3);
        final Offset at =
            Offset(w / 2, box.top) +
            Offset(math.cos(angle), math.sin(angle)) * distance;
        canvas.drawCircle(
          at,
          3 + random.nextDouble() * 3,
          Paint()
            ..color = [
              Colors.amber,
              Colors.pinkAccent,
              Colors.lightBlueAccent,
            ][i % 3].withValues(alpha: 1 - burst * 0.8),
        );
      }
    }

    // Lid with a bow: lifts, spins and flies to the side.
    final double fly = Curves.easeOut.transform(burst);
    canvas.save();
    canvas.translate(w / 2 + fly * w * 0.45, box.top - 8 - fly * h * 0.45);
    canvas.rotate(fly * 0.9);
    final Rect lid = Rect.fromCenter(
      center: Offset.zero,
      width: w * 0.9,
      height: h * 0.13,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(lid, const Radius.circular(8)),
      Paint()..color = dark,
    );
    canvas.drawRect(
      Rect.fromCenter(center: Offset.zero, width: w * 0.14, height: lid.height),
      Paint()..color = ribbon,
    );
    final Paint bow = Paint()..color = ribbon;
    for (final double side in [-1, 1]) {
      final Path loop = Path()
        ..moveTo(0, -lid.height / 2)
        ..cubicTo(
          side * w * 0.28,
          -lid.height / 2 - h * 0.2,
          side * w * 0.3,
          -lid.height / 2 + h * 0.02,
          0,
          -lid.height / 2,
        );
      canvas.drawPath(loop, bow);
    }
    canvas.drawCircle(
      Offset(0, -lid.height / 2),
      w * 0.05,
      Paint()..color = dark,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_GiftPainter oldDelegate) =>
      oldDelegate.open != open || oldDelegate.color != color;
}
