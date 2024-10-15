import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/fields/app_dropdown.dart';
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
          AppDropDown<CategoryModel>(
            onChanged: (value) => setState(() => choosenCategory = value),
            listValues: categoriesList,
            hintText: t.choose_category(context: globalGender),
            valueFormatter: (objectType) => objectType.name,
          ),
        ],
      ),
    );
  }
}
