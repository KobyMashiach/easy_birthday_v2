import 'dart:math' as math;

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The letter from the child: a sealed envelope that opens on tap and lets
/// the letter out onto lined paper.
class DisplayBabyLetter extends StatefulWidget {
  final CategoryModel category;
  const DisplayBabyLetter({super.key, required this.category});

  @override
  State<DisplayBabyLetter> createState() => _DisplayBabyLetterState();
}

class _DisplayBabyLetterState extends State<DisplayBabyLetter>
    with TickerProviderStateMixin {
  /// 0 sealed → 1 the letter is out.
  late final AnimationController _open;

  @override
  void initState() {
    super.initState();
    _idle = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _open = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
  }

  /// The "tap me" bounce of the sealed envelope.
  late final AnimationController _idle;

  late final String names = joinNames(childrenOf(widget.category));

  bool _showLetter = false;

  @override
  void dispose() {
    _open.dispose();
    _idle.dispose();
    super.dispose();
  }

  Future<void> _openEnvelope() async {
    if (_open.isAnimating || _showLetter) return;
    HapticFeedback.mediumImpact();
    _idle.stop();
    await _open.forward();
    if (mounted) setState(() => _showLetter = true);
  }

  @override
  Widget build(BuildContext context) {
    final String text = widget.category.text ?? "";
    if (text.isEmpty) return EmptyCategoryView(category: widget.category);
    return Scaffold(
      appBar: appAppBar(title: widget.category.displayTitle),
      backgroundColor: const Color(0xFFFFF7F2),
      body: Stack(
        children: [
          const Positioned.fill(child: _FloatingHearts()),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            switchInCurve: Curves.easeOutBack,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween(begin: 0.85, end: 1.0).animate(animation),
                child: child,
              ),
            ),
            child: _showLetter
                ? _LetterPaper(
                    key: const ValueKey('letter'),
                    text: text,
                    names: names,
                  )
                // Anywhere opens it, not only the envelope.
                : GestureDetector(
                    key: const ValueKey('envelope'),
                    behavior: HitTestBehavior.opaque,
                    onTap: _openEnvelope,
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: _envelope(),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _envelope() {
    return Column(
      children: [
        Text(
          t.letter_from(name: names),
          style: AppTextStyle().title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        AnimatedBuilder(
          animation: Listenable.merge([_open, _idle]),
          builder: (context, _) {
            final double bounce = _open.value == 0
                ? Curves.easeInOut.transform(_idle.value) * 8
                : 0;
            return Transform.translate(
              offset: Offset(0, -bounce),
              child: _Envelope(progress: _open.value),
            );
          },
        ),
        const SizedBox(height: 24),
        AnimatedOpacity(
          opacity: _open.value == 0 ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: Text(
            t.tap_to_open(context: SessionService().gender),
            style: AppTextStyle().description,
          ),
        ),
      ],
    );
  }
}

/// A pink envelope with a wax-seal heart. [progress] opens the flap (first
/// third) and slides the letter up out of it.
class _Envelope extends StatelessWidget {
  final double progress;
  const _Envelope({required this.progress});

  static const double width = 300;
  static const double height = 190;

  @override
  Widget build(BuildContext context) {
    final double flap = Curves.easeInOut.transform(
      (progress / 0.35).clamp(0.0, 1.0),
    );
    final double slide = Curves.easeOutCubic.transform(
      ((progress - 0.35) / 0.65).clamp(0.0, 1.0),
    );
    final Color body = Color.lerp(AppColors.primaryColor, Colors.white, 0.55)!;
    final Color dark = Color.lerp(AppColors.primaryColor, Colors.white, 0.3)!;
    return SizedBox(
      width: width,
      height: height + 150,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Back of the envelope.
          Positioned(
            bottom: 0,
            child: Container(width: width, height: height, color: dark),
          ),
          // The letter rising out of the pocket.
          Positioned(
            bottom: 12 + slide * 140,
            child: Opacity(
              opacity: progress > 0.3 ? 1 : 0,
              child: Container(
                width: width - 36,
                height: height - 20,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        height: 3,
                        width: (width - 70) * (i.isEven ? 1 : 0.75),
                        color: Colors.black12,
                      ),
                  ],
                ),
              ),
            ),
          ),
          // Front pocket.
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: const Size(width, height),
              painter: _PocketPainter(color: body),
            ),
          ),
          // Flap: folds open around the top edge.
          Positioned(
            bottom: height - 1,
            child: Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(math.pi * flap),
              child: CustomPaint(
                size: const Size(width, height * 0.62),
                painter: _FlapPainter(color: dark, down: true),
              ),
            ),
          ),
          // Wax seal.
          Positioned(
            bottom: height * 0.42,
            child: Opacity(
              opacity: 1 - flap,
              child: Container(
                width: 58,
                height: 58,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.shadowColor,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4),
                  ],
                ),
                child: const Text("❤️", style: TextStyle(fontSize: 26)),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Opacity(
              opacity: 1 - flap,
              child: const Text("👣", style: TextStyle(fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }
}

class _PocketPainter extends CustomPainter {
  final Color color;
  const _PocketPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fill = Paint()..color = color;
    final Path pocket = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height * 0.55)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawShadow(pocket, Colors.black, 3, false);
    canvas.drawPath(pocket, fill);
    final Paint fold = Paint()
      ..color = Colors.black.withValues(alpha: 0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width / 2, size.height * 0.5),
      fold,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width / 2, size.height * 0.5),
      fold,
    );
  }

  @override
  bool shouldRepaint(_PocketPainter oldDelegate) => oldDelegate.color != color;
}

class _FlapPainter extends CustomPainter {
  final Color color;
  final bool down;
  const _FlapPainter({required this.color, required this.down});

  @override
  void paint(Canvas canvas, Size size) {
    // Drawn pointing down from its top edge (the envelope's top).
    final Path flap = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 2, size.height * 2)
      ..close();
    canvas.save();
    canvas.translate(0, -size.height);
    canvas.drawPath(flap, Paint()..color = color);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_FlapPainter oldDelegate) => oldDelegate.color != color;
}

/// The opened letter: ruled paper with a margin line, the text in the
/// handwriting font, signed by the child with tiny footprints.
class _LetterPaper extends StatelessWidget {
  final String text;
  final String names;
  const _LetterPaper({super.key, required this.text, required this.names});

  static const double _lineHeight = 40;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontSize: 30,
      height: _lineHeight / 30,
      color: Colors.indigo.shade900,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: CustomPaint(
          painter: _RuledPaperPainter(
            lineHeight: _lineHeight,
            top: 28,
            marginOnRight: Directionality.of(context) == TextDirection.rtl,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(52, 28, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: style),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "${t.with_love},\n$names 👣",
                    style: style.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RuledPaperPainter extends CustomPainter {
  final double lineHeight;
  final double top;
  final bool marginOnRight;

  const _RuledPaperPainter({
    required this.lineHeight,
    required this.top,
    required this.marginOnRight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint rule = Paint()
      ..color = Colors.lightBlue.shade100
      ..strokeWidth = 1;
    for (double y = top + lineHeight; y < size.height; y += lineHeight) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), rule);
    }
    final double x = marginOnRight ? size.width - 40 : 40;
    canvas.drawLine(
      Offset(x, 0),
      Offset(x, size.height),
      Paint()
        ..color = Colors.red.shade200
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(_RuledPaperPainter oldDelegate) =>
      oldDelegate.lineHeight != lineHeight ||
      oldDelegate.top != top ||
      oldDelegate.marginOnRight != marginOnRight;
}

/// Soft hearts drifting up behind the content, forever.
class _FloatingHearts extends StatefulWidget {
  const _FloatingHearts();

  @override
  State<_FloatingHearts> createState() => _FloatingHeartsState();
}

class _FloatingHeartsState extends State<_FloatingHearts>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..repeat();
  }

  static final List<(double x, double phase, double size)> _hearts = [
    for (int i = 0; i < 10; i++)
      (
        math.Random(i).nextDouble(),
        math.Random(i + 40).nextDouble(),
        14 + math.Random(i + 80).nextDouble() * 16,
      ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return const SizedBox();
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) => AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => Stack(
            children: [
              for (final (x, phase, size) in _hearts)
                _heart(constraints.biggest, x, phase, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heart(Size area, double x, double phase, double size) {
    final double t = (_controller.value + phase) % 1;
    return Positioned(
      left: x * (area.width - size) + math.sin(t * math.pi * 4) * 10,
      top: area.height * (1 - t),
      child: Opacity(
        opacity: (math.sin(t * math.pi) * 0.35).clamp(0.0, 1.0),
        child: Text("💗", style: TextStyle(fontSize: size)),
      ),
    );
  }
}
