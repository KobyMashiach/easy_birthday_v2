import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/app_router.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';

class ChooseCategoryDialog extends StatefulWidget {
  final void Function(CategoryModel category) onChooseCategory;
  const ChooseCategoryDialog({super.key, required this.onChooseCategory});

  @override
  State<ChooseCategoryDialog> createState() => _ChooseCategoryDialogState();
}

class _ChooseCategoryDialogState extends State<ChooseCategoryDialog> {
  CategoryModel? chosenCategory;
  List<ChildModel> chosenChildren = const [];
  final TextEditingController titleAppear = TextEditingController();
  final List<String> unlockedPlans = _unlockedPlans();
  final List<CategoryModel> categories = categoriesList;

  /// Oldest first, as the family categories list them.
  final List<ChildModel> children = [
    ...?SessionService().event?.children,
  ]..sort((a, b) => a.dateOfBirth.compareTo(b.dateOfBirth));
  late final List<CategoryModel> familyCategories = familyCategoriesList(
    children,
  );

  /// The title this dialog filled in, replaced while the owner hasn't
  /// typed their own.
  String? _suggestedTitle;

  @override
  void dispose() {
    titleAppear.dispose();
    super.dispose();
  }

  List<ChildModel> get _chosenEligibleChildren => chosenCategory == null
      ? const []
      : eligibleChildren(chosenCategory!.categoryType, children);

  bool get _choosesChild =>
      chosenCategory != null &&
      isPerChildCategory(chosenCategory!.categoryType) &&
      _chosenEligibleChildren.length > 1;

  void _choose(CategoryModel? category) {
    setState(() {
      chosenCategory = category;
      // All the children it fits, until the owner unselects some.
      chosenChildren = _chosenEligibleChildren;
      _suggestTitle();
    });
  }

  void _toggleChild(ChildModel child) {
    setState(() {
      chosenChildren = chosenChildren.contains(child)
          ? [
              for (final c in chosenChildren)
                if (c != child) c,
            ]
          : [
              for (final c in _chosenEligibleChildren)
                if (c == child || chosenChildren.contains(c)) c,
            ];
      _suggestTitle();
    });
  }

  void _suggestTitle() {
    final category = chosenCategory;
    final bool untouched =
        titleAppear.text.isEmpty || titleAppear.text == _suggestedTitle;
    if (!untouched) return;
    if (category == null) {
      if (_suggestedTitle != null) titleAppear.clear();
      _suggestedTitle = null;
      return;
    }
    _suggestedTitle = suggestedCategoryTitle(
      category.categoryType,
      chosenChildren,
    );
    titleAppear.text = _suggestedTitle!;
  }

  @override
  Widget build(BuildContext context) {
    return generalDialog(
      title: t.choose_category(context: SessionService().gender),
      description: chosenCategory?.description,
      okButtonOnTap: () {
        if (chosenCategory != null) {
          final bool perChild = isPerChildCategory(
            chosenCategory!.categoryType,
          );
          if (perChild && chosenChildren.isEmpty) {
            kheasydevAppToast(t.choose_at_least_one_child);
          } else if (titleAppear.text.isNotEmpty) {
            chosenCategory = chosenCategory!.copyWith(
              titleAppear: titleAppear.text,
              childIds: perChild
                  ? [for (final child in chosenChildren) child.id]
                  : const [],
            );
            widget.onChooseCategory.call(chosenCategory!);
            Navigator.of(context).pop();
          } else {
            kheasydevAppToast(t.title_appear_required);
          }
        } else {
          kheasydevAppToast(t.please_choose_category);
        }
      },
      child: Column(
        children: [
          AppTextField(
            hintText: t.title_appear_category,
            controller: titleAppear,
            maxLength: 36,
            counterText: "",
          ),
          const SizedBox(height: 16),
          _SectionTitle(t.couple_categories),
          Wrap(
            spacing: 8.0,
            children: [for (final category in categories) _chip(category)],
          ),
          const SizedBox(height: 16),
          _SectionTitle(t.family_categories),
          if (familyCategories.isEmpty)
            _AddChildrenHint(
              onTap: () {
                Navigator.of(context).pop();
                appRouter.pushNamed(Routing.children);
              },
            )
          else
            Wrap(
              spacing: 8.0,
              children: [
                for (final category in familyCategories) _chip(category),
              ],
            ),
          if (_choosesChild) ...[
            const SizedBox(height: 16),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                t.choose_child(context: SessionService().gender),
                style: AppTextStyle().dropDownValues,
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: [
                for (final child in _chosenEligibleChildren)
                  FilterChip(
                    label: Text("${child.emoji} ${child.name}"),
                    labelStyle: AppTextStyle().dropDownValues,
                    selectedColor: AppColors.primaryColor,
                    selected: chosenChildren.contains(child),
                    onSelected: (_) => _toggleChild(child),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _chip(CategoryModel category) {
    final isUnlocked = unlockedPlans.contains(category.inPlan);
    final isNew = newCategoryTypes.contains(category.categoryType);
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Long names at large text sizes shorten instead of overflowing.
          Flexible(child: Text(category.name, overflow: TextOverflow.ellipsis)),
          if (!isUnlocked) const Icon(Icons.lock, size: 16),
          if (isNew) ...[const SizedBox(width: 6), const _NewBadge()],
        ],
      ),
      labelStyle: AppTextStyle().dropDownValues,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      selectedColor: AppColors.primaryColor,
      backgroundColor: isUnlocked
          ? AppColors.greyLightDisableColor
          : AppColors.greyDisableColor,
      selected: chosenCategory == category,
      onSelected: (selected) {
        if (isUnlocked) {
          _choose(selected ? category : null);
        } else {
          kheasydevAppToast(t.locked_category);
        }
      },
    );
  }

  static List<String> _unlockedPlans() {
    return switch (SessionService().event?.planSubscribe.title) {
      "Free" => ["Free"],
      "Standard" => ["Free", "Standard"],
      "Platinum" => ["Free", "Standard", "Platinum"],
      _ => ["Free"],
    };
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          text,
          style: AppTextStyle().dropDownValues.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class _NewBadge extends StatelessWidget {
  const _NewBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        t.new_badge,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _AddChildrenHint extends StatelessWidget {
  final VoidCallback onTap;
  const _AddChildrenHint({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.greyLightDisableColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const Text("👶", style: TextStyle(fontSize: 28)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.add_children_to_unlock(context: SessionService().gender),
                  style: AppTextStyle().dropDownValues,
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
