import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/family_editor_header.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';

/// A letter to the partner written in the child's voice. Saved as the
/// category's text.
class AddBabyLetterScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(CategoryModel category, String text) onDone;

  const AddBabyLetterScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
  });

  @override
  State<AddBabyLetterScreen> createState() => _AddBabyLetterScreenState();
}

class _AddBabyLetterScreenState extends State<AddBabyLetterScreen> {
  late bool lock = widget.category.lock;
  late final TextEditingController textController = TextEditingController(
    text: widget.category.text,
  );
  late final List<ChildModel> children = childrenOf(widget.category);

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String names = joinNames(children);
    return Scaffold(
      appBar: appAppBar(title: t.baby_letter),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            FamilyEditorHeader(
              category: widget.category,
              children: children,
              explanation: t.baby_letter_editor_explanation(
                context: SessionService().gender,
                name: names,
              ),
              onChangeTitle: widget.onChangeTitle,
            ),
            buttonContainer(
              icon: lock ? Icons.lock_outline : Icons.lock_open,
              title: lock ? t.lock : t.unlock,
              onTap: () => setState(() => lock = !lock),
            ),
            if (children.isNotEmpty) ...[
              Text(t.ready_letters, style: AppTextStyle().smallDescription),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  for (final (index, template) in babyLetterTemplates(
                    children,
                  ).indexed)
                    ActionChip(
                      avatar: const Text("✍️"),
                      label: Text(t.letter_template_number(n: index + 1)),
                      labelStyle: AppTextStyle().dropDownValues,
                      backgroundColor: AppColors.greyLightDisableColor,
                      onPressed: () =>
                          setState(() => textController.text = template),
                    ),
                ],
              ),
            ],
            AppTextField(
              hintText: t.baby_letter_hint(name: names),
              maxLines: 14,
              keyboard: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: textController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          if (textController.text.trim().isEmpty) {
            kheasydevAppToast(t.no_allow_text_empty);
            return;
          }
          widget.onDone(
            widget.category.copyWith(lock: lock),
            textController.text,
          );
          context.popIfPossible();
        },
      ),
    );
  }
}

/// Ready letters in the children's voice to the partner (by the partner's
/// gender: "Dad" / "Mom"; plural for several children).
List<String> babyLetterTemplates(List<ChildModel> children) {
  final GenderContext parent = getPartnerGender();
  if (children.length > 1) {
    return children.every((child) => child.isGirl)
        ? [
            t.baby_letter_girls_1(context: parent),
            t.baby_letter_girls_2(context: parent),
          ]
        : [
            t.baby_letter_kids_1(context: parent),
            t.baby_letter_kids_2(context: parent),
          ];
  }
  final ChildModel child = children.single;
  final String age = child.ageText();
  return child.isGirl
      ? [
          t.baby_letter_girl_1(context: parent, age: age),
          t.baby_letter_girl_2(context: parent),
          t.baby_letter_girl_3(context: parent),
        ]
      : [
          t.baby_letter_boy_1(context: parent, age: age),
          t.baby_letter_boy_2(context: parent),
          t.baby_letter_boy_3(context: parent),
        ];
}
