import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Tap target with Apple-style press feedback: it scales down the instant a
/// finger touches it (not on release), springs back when released or when the
/// finger slides away, and gives a light haptic on a committed tap.
///
/// Respects the system "reduce motion" setting by dimming instead of scaling.
class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.child,
    this.onTap,
    this.pressedScale = 0.97,
    this.haptic = true,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final double pressedScale;
  final bool haptic;
  final String? semanticLabel;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value && mounted) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onTap != null;
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final bool showPressed = enabled && _pressed;

    // A given label replaces the child's own text, so screen readers don't
    // announce it twice.
    Widget child = widget.semanticLabel == null
        ? widget.child
        : ExcludeSemantics(child: widget.child);
    child = reduceMotion
        ? AnimatedOpacity(
            opacity: showPressed ? 0.7 : 1,
            duration: const Duration(milliseconds: 100),
            child: child,
          )
        : AnimatedScale(
            scale: showPressed ? widget.pressedScale : 1,
            // Fast in on press, slightly softer out on release.
            duration: Duration(milliseconds: showPressed ? 100 : 200),
            curve: Curves.easeOut,
            child: child,
          );

    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? (_) => _setPressed(true) : null,
        onTapCancel: () => _setPressed(false),
        onTapUp: (_) => _setPressed(false),
        onTap: enabled
            ? () {
                if (widget.haptic) HapticFeedback.selectionClick();
                widget.onTap!();
              }
            : null,
        child: child,
      ),
    );
  }
}
