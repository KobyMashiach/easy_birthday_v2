import 'dart:math' as math;

import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Letterpress-style ticket colors: cream card, red ink.
const Color _paper = Color(0xFFFBF4E8);
const Color _ink = Color(0xFFB3322B);

/// A parenting coupon drawn as a theatre ticket: the coupon on the main
/// part, a scalloped stub past a dotted perforation. Dragging the stub away
/// tears it off and calls [onRedeem]; a [redeemed] ticket has no stub, is
/// greyed out and stamped "redeemed".
class CouponTicket extends StatefulWidget {
  final String text;

  /// 1-based coupon number.
  final int number;
  final bool redeemed;

  /// Null when the stub can't be torn (e.g. the owner's preview).
  final VoidCallback? onRedeem;

  const CouponTicket({
    super.key,
    required this.text,
    required this.number,
    required this.redeemed,
    this.onRedeem,
  });

  static const double height = 176;

  @override
  State<CouponTicket> createState() => _CouponTicketState();
}

class _CouponTicketState extends State<CouponTicket>
    with TickerProviderStateMixin {
  static const double _stubFraction = 0.3;

  /// How far (in stub widths) the stub must be dragged to tear.
  static const double _tearAt = 0.45;

  /// The stub's drag distance outwards, in stub widths: 0 attached, past
  /// [_tearAt] torn. Driven by the finger, then animated back or away.
  late final AnimationController _drag;

  /// The torn stub flying away (0 → 1).
  late final AnimationController _fly;

  /// The "redeemed" stamp landing (0 → 1).
  late final AnimationController _stamp;

  /// The "drag me" arrow nudging on the stub.
  late final AnimationController _hint;

  bool _passedThreshold = false;
  bool _tearing = false;

  bool get _canTear => widget.onRedeem != null && !widget.redeemed;

  @override
  void initState() {
    super.initState();
    _hint = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _stamp = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
      value: widget.redeemed ? 1 : 0,
    );
    _fly = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );
    _drag = AnimationController.unbounded(
      vsync: this,
    );
    if (_canTear) _hint.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(CouponTicket oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.redeemed && !oldWidget.redeemed) {
      _hint.stop();
      _stamp.forward(from: 0);
    } else if (!widget.redeemed && oldWidget.redeemed) {
      // Reset by the owner: the stub is back.
      _stamp.value = 0;
      _fly.value = 0;
      _drag.value = 0;
      _tearing = false;
      if (_canTear) _hint.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _drag.dispose();
    _fly.dispose();
    _stamp.dispose();
    _hint.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details, double stubWidth, int out) {
    if (!_canTear || _tearing) return;
    _hint.stop();
    final double next = (_drag.value + details.delta.dx * out / stubWidth)
        .clamp(0.0, 1.4);
    _drag.value = next;
    final bool passed = next >= _tearAt;
    if (passed != _passedThreshold) {
      _passedThreshold = passed;
      HapticFeedback.selectionClick();
    }
  }

  Future<void> _onDragEnd(DragEndDetails details, int out) async {
    if (!_canTear || _tearing) return;
    final double velocity = details.velocity.pixelsPerSecond.dx * out;
    if (_drag.value >= _tearAt || velocity > 900) {
      _tearing = true;
      HapticFeedback.heavyImpact();
      await _fly.forward(from: 0);
      widget.onRedeem?.call();
    } else {
      _passedThreshold = false;
      await _drag.animateTo(
        0,
        duration: const Duration(milliseconds: 650),
        curve: Curves.elasticOut,
      );
      if (mounted && _canTear) _hint.repeat(reverse: true);
    }
  }

  /// A tap on the stub only wiggles it: tearing needs a real drag.
  Future<void> _nudge() async {
    if (!_canTear || _tearing) return;
    _hint.stop();
    await _drag.animateTo(0.18, duration: const Duration(milliseconds: 140));
    await _drag.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.elasticOut,
    );
    if (mounted && _canTear) _hint.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final bool rtl = Directionality.of(context) == TextDirection.rtl;
    // Outwards (away from the coupon) is the stub's end side.
    final int out = rtl ? -1 : 1;
    // A printed ticket keeps its proportions: large text sizes are capped.
    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1.15,
      child: SizedBox(
        height: CouponTicket.height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;
            final double stubWidth = width * _stubFraction;
            final double mainWidth = width - stubWidth;
            final bool torn = widget.redeemed || _tearing;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                PositionedDirectional(
                  start: 0,
                  top: 0,
                  bottom: 0,
                  width: mainWidth,
                  child: _buildMain(rtl, torn),
                ),
                if (!widget.redeemed)
                  PositionedDirectional(
                    end: 0,
                    top: 0,
                    bottom: 0,
                    width: stubWidth,
                    child: _buildStub(rtl, stubWidth, out),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMain(bool rtl, bool torn) {
    final Widget piece = AnimatedBuilder(
      animation: _drag,
      builder: (context, child) => _TicketPiece(
        // The perforation is on the coupon's end side.
        perforationOnLeft: rtl,
        jagged: torn || _drag.value > 0.04,
        decoration: _PieceDecoration.main,
        child: child!,
      ),
      child: _CouponFace(text: widget.text, number: widget.number),
    );
    if (!widget.redeemed) return piece;
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: 0.55,
          child: ColorFiltered(colorFilter: _greyscale, child: piece),
        ),
        Center(
          child: AnimatedBuilder(
            animation: _stamp,
            builder: (context, child) {
              final double v = Curves.easeOutBack.transform(_stamp.value);
              return Opacity(
                opacity: _stamp.value.clamp(0.0, 1.0),
                child: Transform.rotate(
                  angle: -0.2,
                  child: Transform.scale(scale: 2.2 - 1.2 * v, child: child),
                ),
              );
            },
            child: const _RedeemedStamp(),
          ),
        ),
      ],
    );
  }

  Widget _buildStub(bool rtl, double stubWidth, int out) {
    return AnimatedBuilder(
      animation: Listenable.merge([_drag, _fly]),
      builder: (context, child) {
        final double fly = Curves.easeIn.transform(_fly.value);
        final double pull = _drag.value;
        final double dx = (pull + fly * 2.5) * stubWidth * out;
        final double dy = fly * 90;
        // Pivots on the perforation's bottom, like paper torn top-down.
        final double angle = (pull * 0.22 + fly * 0.9) * out;
        return Opacity(
          opacity: 1 - fly,
          child: Transform.translate(
            offset: Offset(dx, dy),
            child: Transform.rotate(
              angle: angle,
              alignment: rtl ? Alignment.bottomRight : Alignment.bottomLeft,
              child: child,
            ),
          ),
        );
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _nudge,
        onHorizontalDragUpdate: (details) =>
            _onDragUpdate(details, stubWidth, out),
        onHorizontalDragEnd: (details) => _onDragEnd(details, out),
        child: AnimatedBuilder(
          animation: _drag,
          builder: (context, child) => _TicketPiece(
            perforationOnLeft: !rtl,
            jagged: _tearing || _drag.value > 0.04,
            decoration: _PieceDecoration.stub,
            child: child!,
          ),
          child: _StubFace(
            number: widget.number,
            hint: _canTear ? _hint : null,
            out: out,
          ),
        ),
      ),
    );
  }
}

const ColorFilter _greyscale = ColorFilter.matrix(<double>[
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0, 0, 0, 1, 0, //
]);

const List<IconData> _couponIcons = [
  Icons.bedtime_outlined,
  Icons.spa_outlined,
  Icons.favorite_border,
];

class _CouponFace extends StatelessWidget {
  final String text;
  final int number;
  const _CouponFace({required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    const TextStyle small = TextStyle(
      color: _ink,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    );
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(26, 20, 22, 18),
      child: Stack(
        children: [
          PositionedDirectional(
            end: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              _couponIcons[(number - 1) % _couponIcons.length],
              size: 84,
              color: _ink.withValues(alpha: 0.16),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${t.parent_coupon_label} · №${number.toString().padLeft(2, '0')}",
                style: small,
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    text,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: _ink,
                      fontSize: 28,
                      height: 1.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(t.coupon_valid_forever, style: small),
            ],
          ),
        ],
      ),
    );
  }
}

class _StubFace extends StatelessWidget {
  final int number;

  /// Nudges the drag arrow; null when the stub can't be torn.
  final Animation<double>? hint;

  /// +1 when outwards is to the right.
  final int out;

  const _StubFace({
    required this.number,
    required this.hint,
    required this.out,
  });

  @override
  Widget build(BuildContext context) {
    final Animation<double>? hint = this.hint;
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 16),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              t.coupon_stub,
              style: const TextStyle(
                color: _ink,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(border: Border.all(color: _ink)),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "♥ ${t.coupon_seat} $number",
                style: const TextStyle(color: _ink, fontSize: 15),
              ),
            ),
          ),
          const Spacer(),
          if (hint != null)
            AnimatedBuilder(
              animation: hint,
              builder: (context, child) => Transform.translate(
                offset: Offset(hint.value * 6 * out, 0),
                child: child,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      t.drag_to_tear,
                      style: const TextStyle(color: _ink, fontSize: 14),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      out > 0
                          ? Icons.keyboard_double_arrow_right
                          : Icons.keyboard_double_arrow_left,
                      color: _ink,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RedeemedStamp extends StatelessWidget {
  const _RedeemedStamp();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: _ink, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        decoration: BoxDecoration(
          color: _paper.withValues(alpha: 0.85),
          border: Border.all(color: _ink, width: 1.2),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          "${t.redeemed} ✓",
          style: const TextStyle(
            color: _ink,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

enum _PieceDecoration { main, stub }

/// One part of the ticket: cream paper cut along the perforation (straight
/// with half notches, or jagged once torn), with its red print.
class _TicketPiece extends StatelessWidget {
  final bool perforationOnLeft;
  final bool jagged;
  final _PieceDecoration decoration;
  final Widget child;

  const _TicketPiece({
    required this.perforationOnLeft,
    required this.jagged,
    required this.decoration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PiecePainter(
        perforationOnLeft: perforationOnLeft,
        jagged: jagged,
        decoration: decoration,
      ),
      child: ClipPath(
        clipper: _PieceClipper(
          perforationOnLeft: perforationOnLeft,
          jagged: jagged,
        ),
        child: child,
      ),
    );
  }
}

const double _notchRadius = 11;

Path _piecePath(
  Size size, {
  required bool perforationOnLeft,
  required bool jagged,
}) {
  final double w = size.width;
  final double h = size.height;
  final double edgeX = perforationOnLeft ? 0 : w;
  final double inward = perforationOnLeft ? 1 : -1;
  final Path outline = Path();
  if (!jagged) {
    outline.addRect(Offset.zero & size);
  } else {
    // Torn paper: an irregular zigzag along the perforation.
    const double step = 5;
    final math.Random random = math.Random(7);
    final double farX = w - edgeX;
    outline.moveTo(farX, 0);
    outline.lineTo(edgeX, 0);
    for (double y = step; y < h; y += step) {
      final double depth = 1.5 + random.nextDouble() * 3.5;
      outline.lineTo(edgeX + inward * depth, y);
    }
    outline.lineTo(edgeX, h);
    outline.lineTo(farX, h);
    outline.close();
  }
  final Path notches = Path()
    ..addOval(Rect.fromCircle(center: Offset(edgeX, 0), radius: _notchRadius))
    ..addOval(Rect.fromCircle(center: Offset(edgeX, h), radius: _notchRadius));
  return Path.combine(PathOperation.difference, outline, notches);
}

class _PieceClipper extends CustomClipper<Path> {
  final bool perforationOnLeft;
  final bool jagged;
  const _PieceClipper({required this.perforationOnLeft, required this.jagged});

  @override
  Path getClip(Size size) => _piecePath(
    size,
    perforationOnLeft: perforationOnLeft,
    jagged: jagged,
  );

  @override
  bool shouldReclip(_PieceClipper oldClipper) =>
      oldClipper.perforationOnLeft != perforationOnLeft ||
      oldClipper.jagged != jagged;
}

class _PiecePainter extends CustomPainter {
  final bool perforationOnLeft;
  final bool jagged;
  final _PieceDecoration decoration;

  const _PiecePainter({
    required this.perforationOnLeft,
    required this.jagged,
    required this.decoration,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path paper = _piecePath(
      size,
      perforationOnLeft: perforationOnLeft,
      jagged: jagged,
    );
    canvas.drawShadow(paper, Colors.black, 4, false);
    canvas.drawPath(
      paper,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_paper, Color(0xFFF4EADA)],
        ).createShader(Offset.zero & size),
    );

    final Paint line = Paint()
      ..color = _ink
      ..style = PaintingStyle.stroke;
    switch (decoration) {
      case _PieceDecoration.main:
        _paintMainFrame(canvas, size, line);
      case _PieceDecoration.stub:
        _paintStubFrame(canvas, size, line);
    }
    if (!jagged) _paintPerforation(canvas, size);
  }

  /// Double frame, open on the perforation side, with corner flourishes.
  void _paintMainFrame(Canvas canvas, Size size, Paint line) {
    const double outer = 9;
    const double inner = 14;
    final double gap = _notchRadius + 6;
    final double left = perforationOnLeft ? gap : outer;
    final double right = size.width - (perforationOnLeft ? outer : gap);
    canvas.drawRect(
      Rect.fromLTRB(left, outer, right, size.height - outer),
      line..strokeWidth = 2.2,
    );
    final Rect innerRect = Rect.fromLTRB(
      left + (inner - outer),
      inner,
      right - (inner - outer),
      size.height - inner,
    );
    canvas.drawRect(innerRect, line..strokeWidth = 0.9);
    for (final Offset corner in [
      innerRect.topLeft,
      innerRect.topRight,
      innerRect.bottomLeft,
      innerRect.bottomRight,
    ]) {
      _paintFlourish(canvas, corner, innerRect.center, line);
    }
  }

  /// A small curl and dot pointing into the frame from [corner].
  void _paintFlourish(Canvas canvas, Offset corner, Offset center, Paint line) {
    final double sx = center.dx > corner.dx ? 1 : -1;
    final double sy = center.dy > corner.dy ? 1 : -1;
    final Path curl = Path()
      ..moveTo(corner.dx + sx * 3, corner.dy + sy * 16)
      ..quadraticBezierTo(
        corner.dx + sx * 3,
        corner.dy + sy * 3,
        corner.dx + sx * 16,
        corner.dy + sy * 3,
      )
      ..moveTo(corner.dx + sx * 7, corner.dy + sy * 12)
      ..quadraticBezierTo(
        corner.dx + sx * 7,
        corner.dy + sy * 7,
        corner.dx + sx * 12,
        corner.dy + sy * 7,
      );
    canvas.drawPath(curl, line..strokeWidth = 1.3);
    canvas.drawCircle(
      Offset(corner.dx + sx * 11, corner.dy + sy * 11),
      1.6,
      Paint()..color = _ink,
    );
  }

  /// Frame whose outer edge is scalloped like a stamp.
  void _paintStubFrame(Canvas canvas, Size size, Paint line) {
    const double inset = 9;
    final double gap = _notchRadius + 6;
    final double nearX = perforationOnLeft ? gap : size.width - gap;
    final double farX = perforationOnLeft ? size.width - inset : inset;
    final double top = inset;
    final double bottom = size.height - inset;
    final double out = perforationOnLeft ? 1 : -1;
    const double scallop = 7;
    final int count = ((bottom - top) / (scallop * 2)).floor();
    final double step = (bottom - top) / count;
    final Path frame = Path()
      ..moveTo(nearX, top)
      ..lineTo(farX, top);
    for (int i = 0; i < count; i++) {
      final double y = top + step * i;
      // Each bump bites into the stub.
      frame.arcToPoint(
        Offset(farX, y + step),
        radius: Radius.circular(step / 2),
        clockwise: out < 0,
      );
    }
    frame
      ..lineTo(nearX, bottom)
      ..close();
    canvas.drawPath(frame, line..strokeWidth = 1.8);
  }

  void _paintPerforation(Canvas canvas, Size size) {
    final double x = perforationOnLeft ? 0.8 : size.width - 0.8;
    final Paint dot = Paint()..color = _ink.withValues(alpha: 0.75);
    for (
      double y = _notchRadius + 6;
      y < size.height - _notchRadius - 4;
      y += 7
    ) {
      canvas.drawCircle(Offset(x, y), 1.4, dot);
    }
  }

  @override
  bool shouldRepaint(_PiecePainter oldDelegate) =>
      oldDelegate.perforationOnLeft != perforationOnLeft ||
      oldDelegate.jagged != jagged ||
      oldDelegate.decoration != decoration;
}
