import 'dart:io';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/look_alike/look_alike_widgets.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/family_editor_header.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/look_alike_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';

/// Photos of each child and of both parents for the "who do they look like"
/// game, and the owner's own guesses (compared with the partner's at the
/// end).
class AddLookAlikeScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(
    CategoryModel category,
    Map<String, String> ownerAnswers,
    Map<String, File> childImages,
    File? ownerImage,
    File? partnerImage,
  )
  onDone;

  /// Lets the partner play again.
  final VoidCallback onReset;

  const AddLookAlikeScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
    required this.onReset,
  });

  @override
  State<AddLookAlikeScreen> createState() => _AddLookAlikeScreenState();
}

class _AddLookAlikeScreenState extends State<AddLookAlikeScreen> {
  late bool lock = widget.category.lock;
  late final List<ChildModel> children = childrenOf(widget.category);
  late final LookAlikeModel saved =
      widget.category.lookAlike ?? const LookAlikeModel();
  late final Map<String, String> answers = {...saved.ownerAnswers};
  final Map<String, File> childImages = {};
  File? ownerImage;
  File? partnerImage;

  Future<File?> _pick() => pickImageImagePicker();

  bool _hasChildPhoto(ChildModel child) =>
      childImages[child.id] != null || saved.childImageUrls[child.id] != null;

  @override
  Widget build(BuildContext context) {
    final names = lookAlikeParentNames();
    final String? youngest = children.lastOrNull?.ageText();
    return Scaffold(
      appBar: appAppBar(title: t.look_alike),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        children: [
          FamilyEditorHeader(
            category: widget.category,
            children: children,
            explanation: t.look_alike_editor_explanation(
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
          if (saved.lock)
            appButton(
              text: t.play_again(name: names.partner),
              margin: const EdgeInsets.all(12),
              onTap: () {
                widget.onReset();
                context.popIfPossible();
              },
            ),
          _Section(t.parents_photos),
          Text(
            t.parent_photo_hint(age: youngest ?? ''),
            textAlign: TextAlign.center,
            style: AppTextStyle().dropDownValues,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PhotoSlot(
                name: names.owner,
                file: ownerImage,
                url: saved.ownerImageUrl,
                onPick: () async {
                  final File? file = await _pick();
                  if (file != null) setState(() => ownerImage = file);
                },
              ),
              _PhotoSlot(
                name: names.partner,
                file: partnerImage,
                url: saved.partnerImageUrl,
                onPick: () async {
                  final File? file = await _pick();
                  if (file != null) setState(() => partnerImage = file);
                },
              ),
            ],
          ),
          _Section(t.children_photos),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              for (final child in children)
                _PhotoSlot(
                  name: child.name,
                  file: childImages[child.id],
                  url: saved.childImageUrls[child.id],
                  onPick: () async {
                    final File? file = await _pick();
                    if (file != null) {
                      setState(() => childImages[child.id] = file);
                    }
                  },
                ),
            ],
          ),
          _Section(t.your_guess_optional(context: SessionService().gender)),
          for (final child in children) ...[
            if (children.length > 1)
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Text(
                  "${child.emoji} ${child.name}",
                  style: AppTextStyle().smallDescription.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            for (final feature in LookAlikeFeature.values)
              _GuessRow(
                feature: feature,
                value: answers[lookAlikeKey(child.id, feature)],
                ownerName: names.owner,
                partnerName: names.partner,
                onChanged: (value) => setState(() {
                  final String key = lookAlikeKey(child.id, feature);
                  value == null ? answers.remove(key) : answers[key] = value;
                }),
              ),
          ],
        ],
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          if (!children.every(_hasChildPhoto)) {
            kheasydevAppToast(t.child_photo_required);
            return;
          }
          widget.onDone(
            widget.category.copyWith(lock: lock),
            answers,
            childImages,
            ownerImage,
            partnerImage,
          );
          context.popIfPossible();
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String text;
  const _Section(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyle().description.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _PhotoSlot extends StatelessWidget {
  final String name;
  final File? file;
  final String? url;
  final VoidCallback onPick;

  const _PhotoSlot({
    required this.name,
    required this.file,
    required this.url,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    final File? file = this.file;
    return GestureDetector(
      onTap: onPick,
      child: Column(
        children: [
          Stack(
            children: [
              file != null
                  ? Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        image: DecorationImage(
                          image: ResizeImage(FileImage(file), width: 300),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : RoundPhoto(url: url, name: name, size: 96),
              PositionedDirectional(
                end: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.disableColor,
                  child: const Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(name, style: AppTextStyle().dropDownValues),
        ],
      ),
    );
  }
}

class _GuessRow extends StatelessWidget {
  final LookAlikeFeature feature;
  final String? value;
  final String ownerName;
  final String partnerName;
  final ValueChanged<String?> onChanged;

  const _GuessRow({
    required this.feature,
    required this.value,
    required this.ownerName,
    required this.partnerName,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget choice(String answer, String name) => ChoiceChip(
      label: Text(name),
      labelStyle: AppTextStyle().dropDownValues,
      selectedColor: AppColors.primaryColor,
      selected: value == answer,
      onSelected: (selected) => onChanged(selected ? answer : null),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(feature.emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(feature.label, style: AppTextStyle().dropDownValues),
          ),
          choice(LookAlikeModel.owner, ownerName),
          const SizedBox(width: 6),
          choice(LookAlikeModel.partner, partnerName),
        ],
      ),
    );
  }
}
