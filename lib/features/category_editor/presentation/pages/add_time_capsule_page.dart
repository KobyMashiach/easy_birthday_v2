import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
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

/// The owner's letter for the time capsule and the date it opens. The
/// partner seals their own letter from the display page.
class AddTimeCapsuleScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(CategoryModel category, String letter, DateTime openDate)
  onDone;

  const AddTimeCapsuleScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
  });

  @override
  State<AddTimeCapsuleScreen> createState() => _AddTimeCapsuleScreenState();
}

class _AddTimeCapsuleScreenState extends State<AddTimeCapsuleScreen> {
  late bool lock = widget.category.lock;
  late final TextEditingController letter = TextEditingController(
    text: widget.category.timeCapsule?.ownerLetter,
  );
  late final List<ChildModel> children = childrenOf(widget.category);
  late DateTime? openDate = widget.category.timeCapsule?.openDate;

  @override
  void dispose() {
    letter.dispose();
    super.dispose();
  }

  /// Date presets: each child's next birthday and 18th birthday, and a year
  /// from today.
  List<(String label, DateTime date)> get _presets {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    return [
      for (final child in children) ...[
        (
          t.capsule_next_birthday(name: child.name),
          _nextBirthday(child, today),
        ),
        if (child.yearsOld() < 18)
          (
            t.capsule_birthday_18(name: child.name),
            _birthdayAt(child.dateOfBirth, child.dateOfBirth.year + 18),
          ),
      ],
      (t.capsule_in_a_year, DateTime(today.year + 1, today.month, today.day)),
    ];
  }

  static DateTime _birthdayAt(DateTime birth, int year) =>
      DateTime(year, birth.month, birth.day);

  static DateTime _nextBirthday(ChildModel child, DateTime today) {
    final DateTime thisYear = _birthdayAt(child.dateOfBirth, today.year);
    return thisYear.isAfter(today)
        ? thisYear
        : _birthdayAt(child.dateOfBirth, today.year + 1);
  }

  Future<void> _pickDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: openDate ?? now.add(const Duration(days: 365)),
      firstDate: now.add(const Duration(days: 1)),
      lastDate: DateTime(now.year + 40),
    );
    if (picked != null) setState(() => openDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime? openDate = this.openDate;
    final bool partnerSealed =
        widget.category.timeCapsule?.partnerLetter?.isNotEmpty ?? false;
    return Scaffold(
      appBar: appAppBar(title: t.time_capsule),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            FamilyEditorHeader(
              category: widget.category,
              children: children,
              explanation: t.time_capsule_editor_explanation(
                context: SessionService().gender,
                name: SessionService().partner?.name ?? '',
              ),
              onChangeTitle: widget.onChangeTitle,
            ),
            buttonContainer(
              icon: lock ? Icons.lock_outline : Icons.lock_open,
              title: lock ? t.lock : t.unlock,
              onTap: () => setState(() => lock = !lock),
            ),
            Text(t.capsule_opens_on, style: AppTextStyle().description),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (final (label, date) in _presets)
                  ChoiceChip(
                    label: Text(label),
                    labelStyle: AppTextStyle().dropDownValues,
                    selectedColor: AppColors.primaryColor,
                    selected:
                        openDate != null && DateUtils.isSameDay(openDate, date),
                    onSelected: (_) => setState(() => this.openDate = date),
                  ),
                ActionChip(
                  avatar: const Icon(Icons.edit_calendar_outlined, size: 18),
                  label: Text(t.capsule_other_date),
                  labelStyle: AppTextStyle().dropDownValues,
                  onPressed: _pickDate,
                ),
              ],
            ),
            if (openDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  "🔒 ${dateTimeToString(openDate)}",
                  style: AppTextStyle().description.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (partnerSealed)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  t.capsule_partner_sealed(
                    name: SessionService().partner?.name ?? '',
                  ),
                  style: AppTextStyle().smallDescription,
                  textAlign: TextAlign.center,
                ),
              ),
            AppTextField(
              hintText: t.capsule_letter_hint(name: joinNames(children)),
              maxLines: 12,
              keyboard: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: letter,
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          final DateTime? date = this.openDate;
          if (date == null) {
            kheasydevAppToast(t.capsule_date_required);
            return;
          }
          if (letter.text.trim().isEmpty) {
            kheasydevAppToast(t.no_allow_text_empty);
            return;
          }
          widget.onDone(
            widget.category.copyWith(lock: lock),
            letter.text,
            date,
          );
          context.popIfPossible();
        },
      ),
    );
  }
}
