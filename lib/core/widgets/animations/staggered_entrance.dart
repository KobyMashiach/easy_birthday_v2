import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Fades and slides [child] in once, [index] beats after the first item, so
/// lists and grids appear one item at a time.
class StaggeredEntrance extends StatelessWidget {
  final int index;
  final Widget child;

  /// Where the child starts, in logical pixels.
  final Offset from;

  /// Also grows in from this scale.
  final double fromScale;

  const StaggeredEntrance({
    super.key,
    required this.index,
    required this.child,
    this.from = const Offset(0, 24),
    this.fromScale = 1,
  });

  static const int _beatMs = 80;
  static const int _moveMs = 450;

  /// Later items share the last beat, so long lists don't keep waiting.
  static const int _maxBeats = 10;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    final int delay = math.min(index, _maxBeats) * _beatMs;
    final int total = delay + _moveMs;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: total),
      curve: Interval(delay / total, 1, curve: Curves.easeOutCubic),
      builder: (context, v, child) => Opacity(
        opacity: v,
        child: Transform.translate(
          offset: from * (1 - v),
          child: Transform.scale(
            scale: fromScale + (1 - fromScale) * v,
            child: child,
          ),
        ),
      ),
      child: child,
    );
  }
}

/// Shrinks [child] a little while pressed, then springs back: tap feedback
/// for cards that aren't Material buttons.
class PressableScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const PressableScale({super.key, required this.child, this.onTap});

  @override
  State<PressableScale> createState() => _PressableScaleState();
}

class _PressableScaleState extends State<PressableScale> {
  bool _pressed = false;

  void _set(bool pressed) {
    if (_pressed != pressed) setState(() => _pressed = pressed);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: (_) => _set(true),
      onTapUp: (_) => _set(false),
      onTapCancel: () => _set(false),
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1,
        duration: Duration(milliseconds: _pressed ? 90 : 300),
        curve: _pressed ? Curves.easeOut : Curves.elasticOut,
        child: widget.child,
      ),
    );
  }
}
