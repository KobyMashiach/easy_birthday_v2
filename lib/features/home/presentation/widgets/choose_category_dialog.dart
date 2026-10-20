import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
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
  final TextEditingController titleAppear = TextEditingController();
  final List<String> unlockedPlans = _unlockedPlans();
  final List<CategoryModel> categories = categoriesList;

  @override
  void dispose() {
    titleAppear.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return generalDialog(
      title: t.choose_category(context: SessionService().gender),
      description: chosenCategory?.description,
      okButtonOnTap: () {
        if (chosenCategory != null) {
          if (titleAppear.text.isNotEmpty) {
            chosenCategory = chosenCategory!.copyWith(
              titleAppear: titleAppear.text,
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
          const SizedBox(height: 24),
          Wrap(
            spacing: 8.0,
            children: categories.map((category) {
              final isUnlocked = unlockedPlans.contains(category.inPlan);
              return ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(category.name),
                    if (!isUnlocked) const Icon(Icons.lock, size: 16),
                  ],
                ),
                labelStyle: AppTextStyle().dropDownValues,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                selectedColor: AppColors.primaryColor,
                backgroundColor: isUnlocked
                    ? AppColors.greyLightDisableColor
                    : AppColors.greyDisableColor,
                selected: chosenCategory == category,
                onSelected: (selected) {
                  if (isUnlocked) {
                    setState(() {
                      chosenCategory = selected ? category : null;
                    });
                  } else {
                    kheasydevAppToast(t.locked_category);
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
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
