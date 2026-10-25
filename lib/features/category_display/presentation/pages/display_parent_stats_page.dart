import 'dart:math' as math;

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/stats/parent_stat_texts.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/parent_stat.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';

/// Parenting by the numbers: the owner's daily averages times the days the
/// children have lived, with count-ups, a "typical day" bar chart, a growth
/// chart and a funny comparison per stat.
class DisplayParentStats extends StatefulWidget {
  final CategoryModel category;
  const DisplayParentStats({super.key, required this.category});

  @override
  State<DisplayParentStats> createState() => _DisplayParentStatsState();
}

class _DisplayParentStatsState extends State<DisplayParentStats>
    with SingleTickerProviderStateMixin {
  late final List<ChildModel> children = childrenOf(widget.category);
  late final List<(ParentStat, double)> stats = ParentStat.active(
    widget.category.parentStats,
  );
  late ParentStat? chartStat = stats.firstOrNull?.$1;

  /// Drives every entrance: count-ups, bars and staggered cards.
  late final AnimationController _intro;

  @override
  void initState() {
    super.initState();
    _intro = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..forward();
  }

  /// Made once per interval: a curved animation listens to [_intro].
  final Map<(double, double), CurvedAnimation> _intervals = {};

  @override
  void dispose() {
    for (final animation in _intervals.values) {
      animation.dispose();
    }
    _intro.dispose();
    super.dispose();
  }

  /// [_intro] between [start] and [end] (fractions of it), eased.
  Animation<double> _interval(
    double start,
    double end, [
    Curve curve = Curves.easeOutCubic,
  ]) => _intervals.putIfAbsent(
    (start, end),
    () => CurvedAnimation(
      parent: _intro,
      curve: Interval(
        start.clamp(0.0, 1.0),
        end.clamp(0.0, 1.0),
        curve: curve,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty || stats.isEmpty) {
      return EmptyCategoryView(category: widget.category);
    }
    // Days of parenting: since the oldest child was born.
    final int days = children.first.daysAlive();
    return Scaffold(
      appBar: appAppBar(title: widget.category.displayTitle),
      backgroundColor: const Color(0xFFFFF9F0),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
        children: [
          _hero(days),
          const SizedBox(height: 24),
          _SectionTitle(t.typical_day),
          _TypicalDayChart(
            stats: [
              for (final (stat, daily) in stats)
                (stat, daily * children.length),
            ],
            animation: _interval(0.2, 0.75, Curves.easeOutBack),
          ),
          const SizedBox(height: 24),
          _SectionTitle(t.so_far),
          for (final (index, (stat, daily)) in stats.indexed)
            _StatCard(
              stat: stat,
              total: parentStatTotalFor(daily, children),
              animation: _interval(0.3 + index * 0.08, 0.75 + index * 0.05),
            ),
          const SizedBox(height: 24),
          _SectionTitle(t.how_it_grew),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            alignment: WrapAlignment.center,
            children: [
              for (final (stat, _) in stats)
                ChoiceChip(
                  label: Text("${stat.emoji} ${stat.totalLabel}"),
                  labelStyle: AppTextStyle().dropDownValues,
                  selectedColor: AppColors.primaryColor,
                  selected: chartStat == stat,
                  onSelected: (_) => setState(() => chartStat = stat),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (chartStat case final ParentStat stat)
            _GrowthChart(
              key: ValueKey(stat),
              stat: stat,
              daily: widget.category.parentStats?[stat.name] ?? 0,
              children: children,
            ),
        ],
      ),
    );
  }

  Widget _hero(int days) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            Color.lerp(AppColors.primaryColor, Colors.white, 0.45)!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            [for (final child in children) child.emoji].join(" "),
            style: const TextStyle(fontSize: 44),
          ),
          AnimatedBuilder(
            animation: _interval(0, 0.5),
            builder: (context, _) => Text(
              formatStatNumber((days * _interval(0, 0.5).value).round()),
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
            ),
          ),
          Text(
            t.days_of_parenting,
            style: AppTextStyle().description.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            [
              for (final child in children) "${child.name}: ${child.ageText()}",
            ].join(" · "),
            textAlign: TextAlign.center,
            style: AppTextStyle().dropDownValues.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: AppTextStyle().subTitle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Bars of the daily values, growing in, each topped by its emoji.
class _TypicalDayChart extends StatelessWidget {
  final List<(ParentStat stat, double daily)> stats;
  final Animation<double> animation;

  const _TypicalDayChart({required this.stats, required this.animation});

  static const double _maxBar = 150;

  @override
  Widget build(BuildContext context) {
    // Square root keeps 30 kisses from flattening 1 laundry load.
    final double maxValue = stats
        .map((s) => math.sqrt(s.$2))
        .fold(0.0, math.max);
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) => Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final (index, (stat, daily)) in stats.indexed)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formatStatNumber(daily),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(stat.emoji, style: const TextStyle(fontSize: 22)),
                    const SizedBox(height: 4),
                    Container(
                      height: math.max(
                        4,
                        _maxBar *
                            (maxValue == 0 ? 0 : math.sqrt(daily) / maxValue) *
                            animation.value,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        color: HSLColor.fromColor(AppColors.primaryColor)
                            .withHue(
                              (HSLColor.fromColor(AppColors.primaryColor).hue +
                                      index * 40) %
                                  360,
                            )
                            .toColor(),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final ParentStat stat;
  final int total;
  final Animation<double> animation;

  const _StatCard({
    required this.stat,
    required this.total,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Opacity(
        opacity: animation.value,
        child: Transform.translate(
          offset: Offset(0, 30 * (1 - animation.value)),
          child: child,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              _WigglingEmoji(emoji: stat.emoji),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) => Text(
                        formatStatNumber((total * animation.value).round()),
                        style: TextStyle(
                          fontSize: 40,
                          height: 1,
                          fontWeight: FontWeight.bold,
                          color: AppColors.disableColor,
                        ),
                      ),
                    ),
                    Text(
                      stat.totalLabel,
                      style: AppTextStyle().smallDescription.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      stat.fact(total),
                      style: AppTextStyle().dropDownValues.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// An emoji that wobbles every few seconds.
class _WigglingEmoji extends StatefulWidget {
  final String emoji;
  const _WigglingEmoji({required this.emoji});

  @override
  State<_WigglingEmoji> createState() => _WigglingEmojiState();
}

class _WigglingEmojiState extends State<_WigglingEmoji>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2400 + widget.emoji.hashCode % 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Still most of the time, a quick wiggle at the start of each loop.
        final double v = _controller.value < 0.25
            ? math.sin(_controller.value / 0.25 * math.pi * 4) * 0.25
            : 0;
        return Transform.rotate(angle: v, child: child);
      },
      child: Text(widget.emoji, style: const TextStyle(fontSize: 44)),
    );
  }
}

/// The running total of [stat] month by month since the oldest child's
/// birth, drawn in on show.
class _GrowthChart extends StatelessWidget {
  final ParentStat stat;
  final double daily;
  final List<ChildModel> children;

  const _GrowthChart({
    super.key,
    required this.stat,
    required this.daily,
    required this.children,
  });

  List<int> _monthlyTotals() {
    final DateTime start = children.first.dateOfBirth;
    final DateTime now = DateTime.now();
    final List<int> totals = [0];
    // At most ~36 points: longer ranges are sampled every few months.
    final int months = (now.year - start.year) * 12 + now.month - start.month;
    final int step = math.max(1, (months / 36).ceil());
    for (int m = step; m < months; m += step) {
      totals.add(
        parentStatTotalFor(
          daily,
          children,
          DateTime(start.year, start.month + m, start.day),
        ),
      );
    }
    totals.add(parentStatTotalFor(daily, children, now));
    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final List<int> totals = _monthlyTotals();
    return Container(
      height: 220,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 1400),
        curve: Curves.easeInOutCubic,
        builder: (context, progress, _) => CustomPaint(
          painter: _GrowthPainter(
            totals: totals,
            progress: progress,
            color: AppColors.disableColor,
            emoji: stat.emoji,
            rtl: Directionality.of(context) == TextDirection.rtl,
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class _GrowthPainter extends CustomPainter {
  final List<int> totals;
  final double progress;
  final Color color;
  final String emoji;

  /// Time runs right to left in RTL.
  final bool rtl;

  const _GrowthPainter({
    required this.totals,
    required this.progress,
    required this.color,
    required this.emoji,
    required this.rtl,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (totals.length < 2) return;
    final int maxTotal = totals.reduce(math.max);
    final double chartHeight = size.height - 24;
    Offset point(int i) {
      final double x = size.width * i / (totals.length - 1);
      final double y =
          chartHeight -
          (maxTotal == 0 ? 0 : totals[i] / maxTotal) * (chartHeight - 30);
      return Offset(rtl ? size.width - x : x, y);
    }

    // Baseline.
    canvas.drawLine(
      Offset(0, chartHeight),
      Offset(size.width, chartHeight),
      Paint()
        ..color = Colors.black12
        ..strokeWidth = 1.5,
    );

    final Path line = Path()..moveTo(point(0).dx, point(0).dy);
    for (int i = 1; i < totals.length; i++) {
      final Offset a = point(i - 1);
      final Offset b = point(i);
      final double midX = (a.dx + b.dx) / 2;
      line.cubicTo(midX, a.dy, midX, b.dy, b.dx, b.dy);
    }
    // Only the first [progress] of the line, drawn in.
    final Path shown = Path();
    Offset? tip;
    for (final metric in line.computeMetrics()) {
      final double length = metric.length * progress;
      shown.addPath(metric.extractPath(0, length), Offset.zero);
      tip = metric.getTangentForOffset(length)?.position;
    }
    if (tip != null) {
      final Path area = Path.from(shown)
        ..lineTo(tip.dx, chartHeight)
        ..lineTo(point(0).dx, chartHeight)
        ..close();
      canvas.drawPath(
        area,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.withValues(alpha: 0.35), color.withValues(alpha: 0)],
          ).createShader(Offset.zero & size),
      );
    }
    canvas.drawPath(
      shown,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );
    if (tip != null) {
      final TextPainter label = TextPainter(
        text: TextSpan(text: emoji, style: const TextStyle(fontSize: 24)),
        textDirection: TextDirection.ltr,
      )..layout();
      label.paint(canvas, tip - Offset(label.width / 2, label.height / 2 + 4));
    }
    final TextPainter top = TextPainter(
      text: TextSpan(
        text: formatStatNumber((maxTotal * progress).round()),
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    top.paint(canvas, Offset(rtl ? 0 : size.width - top.width, 0));
  }

  @override
  bool shouldRepaint(_GrowthPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.totals != totals ||
      oldDelegate.color != color;
}
