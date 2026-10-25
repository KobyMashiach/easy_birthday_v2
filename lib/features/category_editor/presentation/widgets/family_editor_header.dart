import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Top of a family category editor: the editable title, the illustration,
/// the child it is about and what to do.
class FamilyEditorHeader extends StatelessWidget {
  final CategoryModel category;

  /// The children it is about that still exist (none for a category not
  /// about children).
  final List<ChildModel> children;
  final String explanation;
  final void Function(CategoryModel category) onChangeTitle;

  const FamilyEditorHeader({
    super.key,
    required this.category,
    required this.children,
    required this.explanation,
    required this.onChangeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                category.displayTitle,
                style: AppTextStyle().title,
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              tooltip: t.edit,
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AddTitleDialog(
                  title: category.displayTitle,
                  onInputText: (text) =>
                      onChangeTitle(category.copyWith(titleAppear: text)),
                ),
              ),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        SvgPicture.asset(category.categoryType.getImage(), height: 160),
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.center,
          children: [
            for (final child in children)
              Chip(
                avatar: Text(child.emoji),
                backgroundColor: AppColors.greyLightDisableColor,
                label: Text(
                  "${child.name} · ${child.ageText()}",
                  style: AppTextStyle().dropDownValues,
                ),
              ),
          ],
        ),
        if (children.length < category.childIds.length)
          Text(
            t.child_removed,
            style: AppTextStyle().error,
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 8),
        Text(
          explanation,
          style: AppTextStyle().smallDescription,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
