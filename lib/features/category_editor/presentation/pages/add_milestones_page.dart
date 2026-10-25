import 'dart:io';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/family_editor_header.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/milestone_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';

/// The children's "firsts": title, date, optional note and photo. New photos
/// are uploaded when saving.
class AddMilestonesScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(
    CategoryModel category,
    List<(MilestoneModel milestone, File? image)> milestones,
  )
  onDone;

  const AddMilestonesScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
  });

  @override
  State<AddMilestonesScreen> createState() => _AddMilestonesScreenState();
}

class _AddMilestonesScreenState extends State<AddMilestonesScreen> {
  late bool lock = widget.category.lock;
  late final List<ChildModel> children = childrenOf(widget.category);

  /// Saved milestones keep their URL; picked photos wait here for the save.
  late final List<(MilestoneModel, File?)> milestones = [
    for (final milestone
        in widget.category.milestones ?? const <MilestoneModel>[])
      (milestone, null),
  ];

  void _sort() => milestones.sort((a, b) => a.$1.date.compareTo(b.$1.date));

  Future<void> _edit([int? index]) async {
    final (MilestoneModel, File?)? result =
        await showModalBottomSheet<(MilestoneModel, File?)>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) => _MilestoneSheet(
            children: children,
            initial: index == null ? null : milestones[index],
          ),
        );
    if (result == null) return;
    setState(() {
      if (index == null) {
        milestones.add(result);
      } else {
        milestones[index] = result;
      }
      _sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.milestones),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
        children: [
          FamilyEditorHeader(
            category: widget.category,
            children: children,
            explanation: t.milestones_editor_explanation(
              context: SessionService().gender,
            ),
            onChangeTitle: widget.onChangeTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonContainer(
                icon: Icons.add_rounded,
                title: t.add_milestone,
                onTap: children.isEmpty ? () {} : _edit,
              ),
              buttonContainer(
                icon: lock ? Icons.lock_outline : Icons.lock_open,
                title: lock ? t.lock : t.unlock,
                onTap: () => setState(() => lock = !lock),
              ),
            ],
          ),
          if (milestones.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                t.no_milestones_yet,
                textAlign: TextAlign.center,
                style: AppTextStyle().smallDescription,
              ),
            ),
          for (final (index, (milestone, image)) in milestones.indexed)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                onTap: () => _edit(index),
                leading: Text(
                  milestone.emoji,
                  style: const TextStyle(fontSize: 32),
                ),
                title: Text(
                  milestone.title,
                  style: AppTextStyle().smallDescription.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _subtitle(milestone),
                  style: AppTextStyle().dropDownValues,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image != null || milestone.imageUrl != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox.square(
                          dimension: 44,
                          child: image != null
                              ? Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                  cacheWidth: 150,
                                )
                              : AppNetworkImage(
                                  url: milestone.imageUrl!,
                                  memCacheWidth: 150,
                                ),
                        ),
                      ),
                    IconButton(
                      tooltip: t.delete,
                      onPressed: () =>
                          setState(() => milestones.removeAt(index)),
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          widget.onDone(widget.category.copyWith(lock: lock), milestones);
          context.popIfPossible();
        },
      ),
    );
  }

  String _subtitle(MilestoneModel milestone) {
    final ChildModel? child =
        children.where((c) => c.id == milestone.childId).firstOrNull ??
        children.firstOrNull;
    final String date = dateTimeToString(milestone.date);
    if (child == null) return date;
    final String age = t.at_age(
      age: ageBetween(child.dateOfBirth, milestone.date),
    );
    return children.length > 1
        ? "${child.emoji} ${child.name} · $age · $date"
        : "$age · $date";
  }
}

/// Ready milestones: (emoji, title).
List<(String emoji, String title)> get milestonePresets => [
  ("😊", t.ms_first_smile),
  ("🔄", t.ms_rolled_over),
  ("🦷", t.ms_first_tooth),
  ("🪑", t.ms_sat_up),
  ("🐛", t.ms_crawled),
  ("🥣", t.ms_first_food),
  ("🗣️", t.ms_first_word),
  ("👣", t.ms_first_steps),
  ("😴", t.ms_slept_through),
  ("✂️", t.ms_first_haircut),
  ("🎒", t.ms_first_daycare),
  ("🎂", t.ms_first_birthday),
];

class _MilestoneSheet extends StatefulWidget {
  final List<ChildModel> children;
  final (MilestoneModel, File?)? initial;

  const _MilestoneSheet({required this.children, this.initial});

  @override
  State<_MilestoneSheet> createState() => _MilestoneSheetState();
}

class _MilestoneSheetState extends State<_MilestoneSheet> {
  late final MilestoneModel? initial = widget.initial?.$1;
  late final TextEditingController title = TextEditingController(
    text: initial?.title,
  );
  late final TextEditingController note = TextEditingController(
    text: initial?.note,
  );
  late String emoji = initial?.emoji ?? "⭐";
  late ChildModel child =
      widget.children.where((c) => c.id == initial?.childId).firstOrNull ??
      widget.children.first;
  late DateTime date = initial?.date ?? DateTime.now();
  late File? image = widget.initial?.$2;
  late String? imageUrl = initial?.imageUrl;

  @override
  void dispose() {
    title.dispose();
    note.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.isBefore(child.dateOfBirth) ? child.dateOfBirth : date,
      firstDate: child.dateOfBirth,
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => date = picked);
  }

  Future<void> _pickImage() async {
    final File? picked = await pickImageImagePicker();
    if (picked != null) setState(() => image = picked);
  }

  void _save() {
    if (title.text.trim().isEmpty) {
      kheasydevAppToast(t.milestone_title_required);
      return;
    }
    Navigator.of(context).pop((
      MilestoneModel(
        title: title.text.trim(),
        date: date,
        emoji: emoji,
        note: note.text.trim().isEmpty ? null : note.text.trim(),
        // A new photo replaces the saved one when uploaded.
        imageUrl: image == null ? imageUrl : null,
        childId: child.id,
      ),
      image,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final File? image = this.image;
    final String? imageUrl = this.imageUrl;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
        left: 16,
        right: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(t.add_milestone, style: AppTextStyle().title),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              alignment: WrapAlignment.center,
              children: [
                for (final (presetEmoji, presetTitle) in milestonePresets)
                  ChoiceChip(
                    label: Text("$presetEmoji $presetTitle"),
                    labelStyle: AppTextStyle().dropDownValues,
                    selectedColor: AppColors.primaryColor,
                    selected: title.text == presetTitle,
                    onSelected: (_) => setState(() {
                      emoji = presetEmoji;
                      title.text = presetTitle;
                    }),
                  ),
              ],
            ),
            AppTextField(
              hintText: t.milestone_title,
              controller: title,
              maxLength: 40,
              counterText: "",
              onChanged: (_) => setState(() {}),
            ),
            if (widget.children.length > 1)
              Wrap(
                spacing: 8,
                children: [
                  for (final c in widget.children)
                    ChoiceChip(
                      label: Text("${c.emoji} ${c.name}"),
                      labelStyle: AppTextStyle().dropDownValues,
                      selectedColor: AppColors.primaryColor,
                      selected: child == c,
                      onSelected: (_) => setState(() => child = c),
                    ),
                ],
              ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.event_outlined),
              label: Text(
                "${dateTimeToString(date)} · ${t.at_age(age: ageBetween(child.dateOfBirth, date))}",
                style: AppTextStyle().dropDownValues,
              ),
            ),
            AppTextField(
              hintText: t.milestone_note,
              controller: note,
              maxLines: 3,
              maxLength: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (image != null || imageUrl != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox.square(
                        dimension: 64,
                        child: image != null
                            ? Image.file(
                                image,
                                fit: BoxFit.cover,
                                cacheWidth: 200,
                              )
                            : AppNetworkImage(
                                url: imageUrl!,
                                memCacheWidth: 200,
                              ),
                      ),
                    ),
                  ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: Text(
                      image != null || imageUrl != null
                          ? t.replace_photo
                          : t.add_photo_optional,
                      style: AppTextStyle().dropDownValues,
                    ),
                  ),
                ),
                if (image != null || imageUrl != null)
                  IconButton(
                    tooltip: t.delete,
                    onPressed: () => setState(() {
                      this.image = null;
                      this.imageUrl = null;
                    }),
                    icon: const Icon(Icons.close),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            appButton(text: t.save, onTap: _save),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
