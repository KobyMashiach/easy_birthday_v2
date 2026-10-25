import 'dart:math' as math;

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/milestone_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';

/// The children's firsts on a numbered timeline that draws itself in,
/// one stop at a time.
class DisplayMilestones extends StatefulWidget {
  final CategoryModel category;
  const DisplayMilestones({super.key, required this.category});

  @override
  State<DisplayMilestones> createState() => _DisplayMilestonesState();
}

class _DisplayMilestonesState extends State<DisplayMilestones>
    with SingleTickerProviderStateMixin {
  late final List<ChildModel> children = childrenOf(widget.category);
  late final List<MilestoneModel> milestones = [
    ...?widget.category.milestones,
  ]..sort((a, b) => a.date.compareTo(b.date));

  /// One beat per stop (capped), then the end of the trail.
  late final AnimationController _intro;

  @override
  void initState() {
    super.initState();
    _intro = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500 + 350 * math.min(milestones.length, 12),
      ),
    )..forward();
  }

  @override
  void dispose() {
    _intro.dispose();
    super.dispose();
  }

  /// 0 → 1 as stop [index] appears (the last ones share the final beat).
  double _appear(int index) {
    final int beats = math.min(milestones.length, 12) + 1;
    final double start = math.min(index, beats - 1) / beats;
    return ((_intro.value - start) * beats).clamp(0.0, 1.0);
  }

  ChildModel? _childOf(MilestoneModel milestone) =>
      children.where((c) => c.id == milestone.childId).firstOrNull ??
      children.firstOrNull;

  @override
  Widget build(BuildContext context) {
    if (milestones.isEmpty) return EmptyCategoryView(category: widget.category);
    return Scaffold(
      appBar: appAppBar(title: widget.category.displayTitle),
      backgroundColor: const Color(0xFFF6F8FF),
      body: AnimatedBuilder(
        animation: _intro,
        builder: (context, _) => ListView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
          children: [
            Text(
              [for (final child in children) child.emoji].join(" "),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 48),
            ),
            Text(
              t.milestones_count(
                n: milestones.length,
                name: joinNames(children),
              ),
              textAlign: TextAlign.center,
              style: AppTextStyle().title,
            ),
            const SizedBox(height: 20),
            for (final (index, milestone) in milestones.indexed)
              _Stop(
                number: index + 1,
                milestone: milestone,
                child: _childOf(milestone),
                showChildName: children.length > 1,
                appear: _appear(index),
                isFirst: index == 0,
              ),
            _TrailEnd(appear: _appear(milestones.length)),
          ],
        ),
      ),
    );
  }
}

class _Stop extends StatelessWidget {
  final int number;
  final MilestoneModel milestone;
  final ChildModel? child;
  final bool showChildName;
  final double appear;
  final bool isFirst;

  const _Stop({
    required this.number,
    required this.milestone,
    required this.child,
    required this.showChildName,
    required this.appear,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    final ChildModel? child = this.child;
    final double pop = Curves.elasticOut.transform(appear);
    final double slide = Curves.easeOutCubic.transform(appear);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 56,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // The rail grows down as the stop appears.
                Positioned(
                  top: isFirst ? 28 : 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FractionallySizedBox(
                      heightFactor: slide,
                      child: Container(
                        width: 4,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Transform.scale(
                    scale: pop,
                    child: Container(
                      width: 42,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.disableColor,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: Text(
                        "$number",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Opacity(
              opacity: slide,
              child: Transform.translate(
                offset: Offset(0, 24 * (1 - slide)),
                child: Card(
                  margin: const EdgeInsets.only(bottom: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (milestone.imageUrl case final String url)
                        SizedBox(
                          height: 170,
                          child: AppNetworkImage(url: url, memCacheWidth: 900),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: (1 - pop) * 0.6,
                                  child: Text(
                                    milestone.emoji,
                                    style: const TextStyle(fontSize: 36),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    milestone.title,
                                    style: AppTextStyle().description.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                if (showChildName && child != null)
                                  _Tag("${child.emoji} ${child.name}"),
                                if (child != null)
                                  _Tag(
                                    t.at_age(
                                      age: ageBetween(
                                        child.dateOfBirth,
                                        milestone.date,
                                      ),
                                    ),
                                  ),
                                _Tag("📅 ${dateTimeToString(milestone.date)}"),
                              ],
                            ),
                            if (milestone.note case final String note) ...[
                              const SizedBox(height: 8),
                              Text(
                                note,
                                style: AppTextStyle().smallDescription,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Color.lerp(AppColors.primaryColor, Colors.white, 0.75),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: AppTextStyle().dropDownValues),
    );
  }
}

class _TrailEnd extends StatelessWidget {
  final double appear;
  const _TrailEnd({required this.appear});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: appear,
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Transform.scale(
              scale: Curves.elasticOut.transform(appear),
              child: const Text(
                "🚀",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 34),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              t.more_firsts_coming,
              style: AppTextStyle().smallDescription.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
