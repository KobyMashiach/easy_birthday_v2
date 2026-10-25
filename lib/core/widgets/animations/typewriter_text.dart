import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Types [text] in, character by character; a tap shows the rest at once.
/// The full text is laid out from the start, so nothing jumps while typing.
class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const TypewriterText(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Characters _characters;

  @override
  void initState() {
    super.initState();
    _characters = widget.text.characters;
    // ~35ms a character, but long texts finish within 5 seconds.
    final int ms = math.min(_characters.length * 35, 5000);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: math.max(ms, 1)),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) {
      return Text(
        widget.text,
        style: widget.style,
        textAlign: widget.textAlign,
      );
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _controller.value = 1,
      child: Stack(
        children: [
          // Holds the final size.
          Opacity(
            opacity: 0,
            child: Text(
              widget.text,
              style: widget.style,
              textAlign: widget.textAlign,
            ),
          ),
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final int shown = (_characters.length * _controller.value)
                    .round();
                return Text(
                  _characters.take(shown).toString(),
                  style: widget.style,
                  textAlign: widget.textAlign,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
