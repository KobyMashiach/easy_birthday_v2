import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Dims the screen except for a pulsing hole around [target] and shows
/// [builder]'s card next to it (on the roomier side, centered when neither
/// has room). Without a [target] the whole screen dims and the card is
/// centered. The card pops with a result; tapping the dimmed area or going
/// back pops null. Does nothing when [target] isn't laid out.
Future<T?> showSpotlight<T>({
  required BuildContext context,
  required GlobalKey? target,
  required Widget Function(BuildContext context) builder,
}) {
  Rect? rect;
  if (target != null) {
    final RenderBox? box =
        target.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return Future.value();
    rect = box.localToGlobal(Offset.zero) & box.size;
  }
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, animation, _) =>
        _Spotlight(target: rect, animation: animation, builder: builder),
  );
}

class _Spotlight extends StatefulWidget {
  final Rect? target;
  final Animation<double> animation;
  final Widget Function(BuildContext context) builder;

  const _Spotlight({
    required this.target,
    required this.animation,
    required this.builder,
  });

  @override
  State<_Spotlight> createState() => _SpotlightState();
}

class _SpotlightState extends State<_Spotlight>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  late final CurvedAnimation intro = CurvedAnimation(
    parent: widget.animation,
    curve: Curves.easeOutCubic,
  );

  @override
  void dispose() {
    intro.dispose();
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.sizeOf(context);
    final EdgeInsets safe = MediaQuery.paddingOf(context);
    final Rect? target = widget.target;
    final double above = target == null ? 0 : target.top - 24 - safe.top - 16;
    final double below = target == null
        ? 0
        : screen.height - target.bottom - 24 - safe.bottom - 16;
    final bool cardAbove = above > below;
    // Neither side fits a card: it goes over the middle of the screen.
    final bool centered = math.max(above, below) < 220;
    final Widget card = FadeTransition(
      opacity: intro,
      child: SlideTransition(
        position: Tween(
          begin: Offset(0, cardAbove ? 0.08 : -0.08),
          end: Offset.zero,
        ).animate(intro),
        child: Material(
          color: Colors.transparent,
          child: widget.builder(context),
        ),
      ),
    );
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: AnimatedBuilder(
              animation: Listenable.merge([intro, _pulse]),
              builder: (context, _) => CustomPaint(
                painter: _SpotlightPainter(
                  target: target,
                  reveal: intro.value,
                  pulse: _pulse.value,
                ),
              ),
            ),
          ),
        ),
        if (target == null || centered)
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                safe.top + 16,
                16,
                safe.bottom + 16,
              ),
              child: card,
            ),
          )
        else
          Positioned(
            left: 16,
            right: 16,
            top: cardAbove ? null : target.bottom + 24,
            bottom: cardAbove ? screen.height - target.top + 24 : null,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: cardAbove ? above : below),
              child: card,
            ),
          ),
      ],
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  final Rect? target;

  /// 0 → 1: the dim fades in and the hole closes in on the target.
  final double reveal;
  final double pulse;

  const _SpotlightPainter({
    required this.target,
    required this.reveal,
    required this.pulse,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect? target = this.target;
    if (target == null) {
      canvas.drawRect(
        Offset.zero & size,
        Paint()..color = Colors.black.withValues(alpha: 0.72 * reveal),
      );
      return;
    }
    final double radius = target.longestSide / 2 + 14;
    // Starts huge and shrinks onto the target.
    final double holeRadius =
        radius + (1 - reveal) * math.max(size.width, size.height);
    final Path dim = Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & size),
      Path()..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: target.center,
            width: target.width + 28 + (holeRadius - radius) * 2,
            height: target.height + 28 + (holeRadius - radius) * 2,
          ),
          Radius.circular(holeRadius),
        ),
      ),
    );
    canvas.drawPath(
      dim,
      Paint()..color = Colors.black.withValues(alpha: 0.72 * reveal),
    );
    if (reveal < 0.9) return;
    // Two rings rippling out of the hole.
    for (final double offset in [0.0, 0.5]) {
      final double p = (pulse + offset) % 1;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: target.center,
            width: target.width + 28 + p * 40,
            height: target.height + 28 + p * 40,
          ),
          Radius.circular(radius + p * 20),
        ),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..color = Colors.white.withValues(alpha: (1 - p) * 0.8),
      );
    }
  }

  @override
  bool shouldRepaint(_SpotlightPainter oldDelegate) =>
      oldDelegate.target != target ||
      oldDelegate.reveal != reveal ||
      oldDelegate.pulse != pulse;
}
