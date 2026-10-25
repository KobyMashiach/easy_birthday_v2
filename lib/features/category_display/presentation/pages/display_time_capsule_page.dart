import 'dart:async';
import 'dart:math' as math;

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/confetti_widget.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/time_capsule_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The time capsule: sealed with a live countdown until its date (the
/// partner can seal their own letter meanwhile), then it pops open and
/// shows both letters.
class DisplayTimeCapsule extends StatefulWidget {
  final CategoryModel category;
  final void Function(String letter) onSaveLetter;

  const DisplayTimeCapsule({
    super.key,
    required this.category,
    required this.onSaveLetter,
  });

  @override
  State<DisplayTimeCapsule> createState() => _DisplayTimeCapsuleState();
}

class _DisplayTimeCapsuleState extends State<DisplayTimeCapsule>
    with TickerProviderStateMixin {
  late TimeCapsuleModel? capsule = widget.category.timeCapsule;
  late final String names = joinNames(childrenOf(widget.category));
  Timer? _ticker;
  DateTime _now = DateTime.now();

  /// Floating while sealed.
  late final AnimationController _float;

  /// The lid popping off (0 → 1).
  late final AnimationController _opening;

  bool get _isOpen => capsule?.isOpen(_now) ?? false;

  @override
  void initState() {
    super.initState();
    _opening = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _float = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    if (_isOpen) {
      _opening.forward();
    } else {
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    }
  }

  void _tick() {
    setState(() => _now = DateTime.now());
    if (_isOpen) {
      _ticker?.cancel();
      HapticFeedback.heavyImpact();
      _opening.forward();
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _float.dispose();
    _opening.dispose();
    super.dispose();
  }

  Future<void> _writeLetter() async {
    final TextEditingController controller = TextEditingController(
      text: capsule?.partnerLetter,
    );
    final String? letter = await showDialog<String>(
      context: context,
      builder: (context) => generalDialog(
        title: t.capsule_your_letter(context: SessionService().gender),
        okButtonText: t.seal_letter,
        okButtonOnTap: () => Navigator.of(context).pop(controller.text),
        child: AppTextField(
          hintText: t.capsule_letter_hint(name: names),
          maxLines: 8,
          keyboard: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: controller,
        ),
      ),
    );
    controller.dispose();
    if (letter == null || letter.trim().isEmpty) return;
    HapticFeedback.mediumImpact();
    setState(() => capsule = capsule?.copyWith(partnerLetter: letter));
    widget.onSaveLetter(letter);
  }

  @override
  Widget build(BuildContext context) {
    final TimeCapsuleModel? capsule = this.capsule;
    if (capsule == null) return EmptyCategoryView(category: widget.category);
    return Scaffold(
      appBar: appAppBar(title: widget.category.displayTitle),
      backgroundColor: const Color(0xFF1B1F3B),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Positioned.fill(child: _StarrySky()),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: _isOpen ? _opened(capsule) : _sealed(capsule),
          ),
          if (_isOpen) const ScreenConfettiWidget(),
        ],
      ),
    );
  }

  Widget _sealed(TimeCapsuleModel capsule) {
    final Duration left = capsule.openDate.difference(_now);
    final bool sealedMine = capsule.partnerLetter?.isNotEmpty ?? false;
    const TextStyle light = TextStyle(color: Colors.white, fontSize: 24);
    return Column(
      children: [
        Text(
          t.capsule_for(name: names),
          style: AppTextStyle().title.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        AnimatedBuilder(
          animation: _float,
          builder: (context, child) => Transform.translate(
            offset: Offset(0, -10 * Curves.easeInOut.transform(_float.value)),
            child: Transform.rotate(
              angle: (_float.value - 0.5) * 0.08,
              child: child,
            ),
          ),
          child: const _Capsule(lidOpen: 0),
        ),
        const SizedBox(height: 24),
        Text(
          t.capsule_opens_at(date: dateTimeToString(capsule.openDate)),
          style: light,
        ),
        const SizedBox(height: 12),
        _Countdown(left: left),
        const SizedBox(height: 28),
        _sealStatus(
          t.capsule_letter_of(name: SessionService().partner?.name ?? ''),
          capsule.ownerLetter?.isNotEmpty ?? false,
        ),
        _sealStatus(
          t.capsule_letter_of(name: SessionService().user.name),
          sealedMine,
        ),
        const SizedBox(height: 16),
        appButton(
          text: sealedMine
              ? t.capsule_edit_my_letter
              : t.capsule_add_my_letter(context: SessionService().gender),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          onTap: _writeLetter,
        ),
      ],
    );
  }

  Widget _sealStatus(String who, bool sealed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "${sealed ? "💌" : "✉️"}  $who · ${sealed ? t.sealed : t.not_written_yet}",
        style: TextStyle(
          color: sealed ? Colors.white : Colors.white60,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget _opened(TimeCapsuleModel capsule) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _opening,
          builder: (context, _) => _Capsule(
            lidOpen: Curves.easeOutBack.transform(_opening.value),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          t.capsule_opened(name: names),
          style: AppTextStyle().title.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        for (final (index, (who, letter)) in [
          (SessionService().partner?.name ?? '', capsule.ownerLetter),
          (SessionService().user.name, capsule.partnerLetter),
        ].indexed)
          if (letter != null && letter.isNotEmpty)
            AnimatedBuilder(
              animation: _opening,
              builder: (context, child) {
                final double v = ((_opening.value - 0.4 - index * 0.2) / 0.4)
                    .clamp(0.0, 1.0);
                return Opacity(
                  opacity: v,
                  child: Transform.translate(
                    offset: Offset(0, 40 * (1 - v)),
                    child: child,
                  ),
                );
              },
              child: _LetterCard(from: who, letter: letter),
            ),
      ],
    );
  }
}

class _Countdown extends StatelessWidget {
  final Duration left;
  const _Countdown({required this.left});

  @override
  Widget build(BuildContext context) {
    final Duration d = left.isNegative ? Duration.zero : left;
    final List<(int value, String label)> parts = [
      (d.inDays, t.days),
      (d.inHours % 24, t.hours),
      (d.inMinutes % 60, t.minutes),
      (d.inSeconds % 60, t.seconds),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final (value, label) in parts)
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 72),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => SlideTransition(
                      position: Tween(
                        begin: const Offset(0, -0.4),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                    child: FittedBox(
                      key: ValueKey(value),
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "$value",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// A glowing glass capsule with a lid; [lidOpen] 0 closed → 1 popped off.
class _Capsule extends StatelessWidget {
  final double lidOpen;
  const _Capsule({required this.lidOpen});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 250,
      child: CustomPaint(
        painter: _CapsulePainter(
          lidOpen: lidOpen,
          color: AppColors.primaryColor,
        ),
        child: Align(
          alignment: const Alignment(0, 0.35),
          child: Opacity(
            opacity: (1 - lidOpen).clamp(0.0, 1.0),
            child: const Icon(
              Icons.lock_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class _CapsulePainter extends CustomPainter {
  final double lidOpen;
  final Color color;
  const _CapsulePainter({required this.lidOpen, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width * 0.62;
    final double left = (size.width - w) / 2;
    final Rect body = Rect.fromLTWH(
      left,
      size.height * 0.32,
      w,
      size.height * 0.62,
    );
    final RRect bodyShape = RRect.fromRectAndCorners(
      body,
      bottomLeft: Radius.circular(w / 2),
      bottomRight: Radius.circular(w / 2),
      topLeft: const Radius.circular(10),
      topRight: const Radius.circular(10),
    );

    // Glow.
    canvas.drawCircle(
      body.center,
      size.width * 0.55,
      Paint()
        ..shader =
            RadialGradient(
              colors: [color.withValues(alpha: 0.45), Colors.transparent],
            ).createShader(
              Rect.fromCircle(center: body.center, radius: size.width * 0.55),
            ),
    );
    canvas.drawRRect(
      bodyShape,
      Paint()
        ..shader = LinearGradient(
          colors: [color, Color.lerp(color, Colors.black, 0.35)!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(body),
    );
    // Glass shine.
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(body.left + 12, body.top + 14, 12, body.height * 0.55),
        const Radius.circular(6),
      ),
      Paint()..color = Colors.white.withValues(alpha: 0.35),
    );
    // Letters peeking inside once open.
    if (lidOpen > 0) {
      final Paint paper = Paint()..color = Colors.white;
      for (int i = 0; i < 2; i++) {
        final double rise = lidOpen * 26;
        canvas.save();
        canvas.translate(
          body.center.dx + (i == 0 ? -14 : 14),
          body.top - rise + 18,
        );
        canvas.rotate(i == 0 ? -0.2 : 0.18);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            const Rect.fromLTWH(-16, -24, 32, 44),
            const Radius.circular(3),
          ),
          paper,
        );
        canvas.restore();
      }
    }
    // Lid: lifts and spins away.
    final double lift = lidOpen * size.height * 0.28;
    canvas.save();
    canvas.translate(size.width / 2 + lidOpen * 40, body.top - 6 - lift);
    canvas.rotate(lidOpen * math.pi * 0.35);
    final Rect lid = Rect.fromCenter(
      center: Offset.zero,
      width: w + 16,
      height: 26,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(lid, const Radius.circular(10)),
      Paint()..color = Color.lerp(color, Colors.black, 0.45)!,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0, -16), width: 30, height: 12),
        const Radius.circular(5),
      ),
      Paint()..color = Color.lerp(color, Colors.black, 0.45)!,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_CapsulePainter oldDelegate) =>
      oldDelegate.lidOpen != lidOpen || oldDelegate.color != color;
}

class _LetterCard extends StatelessWidget {
  final String from;
  final String letter;
  const _LetterCard({required this.from, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "💌 ${t.capsule_letter_of(name: from)}",
            style: AppTextStyle().description.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(letter, style: const TextStyle(fontSize: 26)),
        ],
      ),
    );
  }
}

/// Twinkling stars behind the capsule.
class _StarrySky extends StatefulWidget {
  const _StarrySky();

  @override
  State<_StarrySky> createState() => _StarrySkyState();
}

class _StarrySkyState extends State<_StarrySky>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: _StarsPainter(_controller)),
    );
  }
}

class _StarsPainter extends CustomPainter {
  final Animation<double> animation;
  _StarsPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final math.Random random = math.Random(3);
    final Paint star = Paint()..color = Colors.white;
    for (int i = 0; i < 60; i++) {
      final Offset at = Offset(
        random.nextDouble() * size.width,
        random.nextDouble() * size.height,
      );
      final double phase = random.nextDouble();
      final double twinkle =
          0.25 +
          0.75 *
              (0.5 + 0.5 * math.sin((animation.value + phase) * math.pi * 2));
      canvas.drawCircle(
        at,
        0.6 + random.nextDouble() * 1.4,
        star..color = Colors.white.withValues(alpha: twinkle * 0.8),
      );
    }
  }

  @override
  bool shouldRepaint(_StarsPainter oldDelegate) => false;
}
