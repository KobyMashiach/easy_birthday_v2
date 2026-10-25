import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

enum WhatsNewAction { tryNow, addChildren, open }

/// The "what's new" spotlight card. Pops its [action], or null for "later".
class WhatsNewCard extends StatelessWidget {
  final String title;
  final String description;

  /// Shown big above the title (the spotlighted category's emoji).
  final String? emoji;

  /// Lists the family categories, popping in one by one.
  final bool showFamilyCategories;
  final String actionText;
  final WhatsNewAction action;

  const WhatsNewCard({
    super.key,
    required this.title,
    required this.description,
    required this.actionText,
    required this.action,
    this.emoji,
    this.showFamilyCategories = false,
  });

  /// For the owner, on the add button.
  factory WhatsNewCard.owner({required bool hasChildren}) {
    final gender = SessionService().gender;
    return WhatsNewCard(
      title: t.whats_new_title,
      description: hasChildren
          ? t.whats_new_description(context: gender)
          : t.whats_new_add_children(context: gender),
      showFamilyCategories: true,
      actionText: hasChildren
          ? t.lets_try(context: gender)
          : t.add_children(context: gender),
      action: hasChildren ? WhatsNewAction.tryNow : WhatsNewAction.addChildren,
    );
  }

  /// For the partner: on a family [category] made for them, or without one
  /// an intro asking to add the children.
  factory WhatsNewCard.partner(CategoryModel? category) {
    final gender = SessionService().gender;
    final String owner = SessionService().partner?.name ?? '';
    if (category == null) {
      return WhatsNewCard(
        title: t.whats_new_title,
        description: t.whats_new_partner_intro(context: gender, name: owner),
        showFamilyCategories: true,
        actionText: t.add_children(context: gender),
        action: WhatsNewAction.addChildren,
      );
    }
    return WhatsNewCard(
      title: t.whats_new_partner_title,
      description: t.whats_new_partner_description(
        context: gender,
        name: owner,
        title: category.displayTitle,
      ),
      emoji: familyCategoryEmoji(category.categoryType),
      actionText: t.open_it(context: gender),
      action: WhatsNewAction.open,
    );
  }

  static List<(String emoji, String name)> get _items => [
    (familyCategoryEmoji(CategoryEnum.timeCapsule), t.time_capsule),
    (familyCategoryEmoji(CategoryEnum.parentCoupons), t.parent_coupons),
    (familyCategoryEmoji(CategoryEnum.babyLetter), t.baby_letter),
    (familyCategoryEmoji(CategoryEnum.parentStats), t.parent_stats),
    (familyCategoryEmoji(CategoryEnum.milestones), t.milestones),
    (familyCategoryEmoji(CategoryEnum.lookAlike), t.look_alike),
  ];

  @override
  Widget build(BuildContext context) {
    final String? emoji = this.emoji;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 20)],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (emoji != null)
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 900),
                curve: Curves.elasticOut,
                builder: (context, v, child) =>
                    Transform.scale(scale: v.clamp(0.0, 2.0), child: child),
                child: Text(emoji, style: const TextStyle(fontSize: 56)),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    t.new_badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    title,
                    style: AppTextStyle().subTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: AppTextStyle().smallDescription,
              textAlign: TextAlign.center,
            ),
            if (showFamilyCategories) ...[
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  for (final (index, (emoji, name)) in _items.indexed)
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 500 + index * 140),
                      curve: Curves.elasticOut,
                      builder: (context, v, child) => Transform.scale(
                        scale: v.clamp(0.0, 2.0),
                        child: child,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color.lerp(
                            AppColors.primaryColor,
                            Colors.white,
                            0.7,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "$emoji $name",
                          style: AppTextStyle().dropDownValues.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: appButton(
                    text: t.later,
                    unfillColors: true,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: appButton(
                    text: actionText,
                    onTap: () => Navigator.of(context).pop(action),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// The emoji of a family category.
String familyCategoryEmoji(CategoryEnum type) => switch (type) {
  CategoryEnum.timeCapsule => "⏳",
  CategoryEnum.parentCoupons => "🎟️",
  CategoryEnum.babyLetter => "💌",
  CategoryEnum.parentStats => "📊",
  CategoryEnum.milestones => "👣",
  CategoryEnum.lookAlike => "🪞",
  _ => "🎁",
};
