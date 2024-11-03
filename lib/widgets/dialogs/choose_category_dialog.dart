import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class ChooseCategoryDialog extends StatefulWidget {
  final Function(CategoryModel category) onChooseCategory;
  const ChooseCategoryDialog({super.key, required this.onChooseCategory});

  @override
  State<ChooseCategoryDialog> createState() => _ChooseCategoryDialogState();
}

class _ChooseCategoryDialogState extends State<ChooseCategoryDialog> {
  CategoryModel? choosenCategory;
  late TextEditingController titleAppear;

  @override
  void initState() {
    super.initState();
    titleAppear = TextEditingController();
  }

  @override
  void dispose() {
    titleAppear.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return generalDialog(
      title: t.choose_category(context: globalGender),
      description: choosenCategory?.description,
      okButtonOnTap: () {
        if (choosenCategory != null) {
          if (titleAppear.text.isNotEmpty) {
            choosenCategory =
                choosenCategory!.copyWith(titleAppear: titleAppear.text);
            widget.onChooseCategory.call(choosenCategory!);
            KheasydevNavigatePage().pop(context);
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
            children: categoriesList.map((category) {
              final isUnlocked = getPlansTitles().contains(category.inPlan);
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
                  selected: choosenCategory == category,
                  onSelected: (selected) {
                    if (isUnlocked) {
                      setState(() {
                        choosenCategory = selected ? category : null;
                      });
                    } else {
                      kheasydevAppToast(t.locked_category);
                    }
                  });
            }).toList(),
          ),
        ],
      ),
    );
  }

  List<String> getPlansTitles() {
    return switch (globalEvent!.planSubscribe.title) {
      "Free" => ["Free"],
      "Standard" => ["Free", "Standard"],
      "Platinum" => ["Free", "Standard", "Platinum"],
      _ => ["Free"],
    };
  }
}
