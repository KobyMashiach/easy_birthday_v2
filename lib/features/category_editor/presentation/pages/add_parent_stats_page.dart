import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/stats/parent_stat_texts.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/family_editor_header.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/parent_stat.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';

/// Daily averages (per child) of the parenting stats; the display
/// multiplies them by the days each child has lived.
class AddParentStatsScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(CategoryModel category, Map<String, double> stats) onDone;

  const AddParentStatsScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
  });

  @override
  State<AddParentStatsScreen> createState() => _AddParentStatsScreenState();
}

class _AddParentStatsScreenState extends State<AddParentStatsScreen> {
  late bool lock = widget.category.lock;
  late final Map<String, double> stats = {
    ...(widget.category.parentStats ?? ParentStat.defaults),
  };
  late final List<ChildModel> children = childrenOf(widget.category);

  void _change(ParentStat stat, double delta) {
    final double next = ((stats[stat.name] ?? 0) + delta).clamp(0.0, 999.0);
    setState(() => stats[stat.name] = next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.parent_stats),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          FamilyEditorHeader(
            category: widget.category,
            children: children,
            explanation: t.parent_stats_editor_explanation(
              context: SessionService().gender,
            ),
            onChangeTitle: widget.onChangeTitle,
          ),
          Center(
            child: buttonContainer(
              icon: lock ? Icons.lock_outline : Icons.lock_open,
              title: lock ? t.lock : t.unlock,
              onTap: () => setState(() => lock = !lock),
            ),
          ),
          for (final stat in ParentStat.values) _statRow(stat),
        ],
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          widget.onDone(widget.category.copyWith(lock: lock), stats);
          context.popIfPossible();
        },
      ),
    );
  }

  Widget _statRow(ParentStat stat) {
    final double daily = stats[stat.name] ?? 0;
    final bool off = daily == 0;
    final int total = parentStatTotalFor(daily, children);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: off ? 0.5 : 1,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              Text(stat.emoji, style: const TextStyle(fontSize: 34)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stat.dailyLabel,
                      style: AppTextStyle().smallDescription.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      off
                          ? t.stat_hidden
                          : t.stat_until_today(total: formatStatNumber(total)),
                      style: AppTextStyle().dropDownValues.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: t.less,
                onPressed: off ? null : () => _change(stat, -1),
                icon: const Icon(Icons.remove_circle_outline),
              ),
              SizedBox(
                width: 40,
                child: Text(
                  formatStatNumber(daily),
                  textAlign: TextAlign.center,
                  style: AppTextStyle().description.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.disableColor,
                  ),
                ),
              ),
              IconButton(
                tooltip: t.more,
                onPressed: () => _change(stat, 1),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
