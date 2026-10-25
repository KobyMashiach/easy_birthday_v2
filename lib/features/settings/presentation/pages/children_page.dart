import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:easy_birthday/features/settings/presentation/bloc/children_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

/// The couple's children (settings). Their ages unlock the family
/// categories.
class ChildrenScreen extends StatelessWidget {
  const ChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ChildrenBloc.fromContext,
      child: BlocConsumer<ChildrenBloc, ChildrenState>(
        listenWhen: (_, current) => current.isOneShot,
        buildWhen: (_, current) => !current.isOneShot,
        listener: (context, state) =>
            kheasydevAppToast(t.operation_not_allowed),
        builder: (context, state) {
          final bloc = context.read<ChildrenBloc>();
          final children = state.children;
          return Scaffold(
            appBar: appAppBar(title: t.children),
            body: Column(
              children: [
                if (state is Saving) const LinearProgressIndicator(),
                Expanded(
                  child: children.isEmpty
                      ? const _EmptyChildren()
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
                          itemCount: children.length + 1,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            if (index == 0) return const _UnlockExplanation();
                            final child = children[index - 1];
                            return _ChildCard(
                              child: child,
                              onTap: () => _openEditor(context, bloc, child),
                              onDelete: () => _confirmDelete(
                                context,
                                bloc,
                                child,
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => _openEditor(context, bloc, null),
              backgroundColor: AppColors.disableColor,
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: Text(
                t.add_child(context: SessionService().gender),
                style: AppTextStyle().description.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _openEditor(
    BuildContext context,
    ChildrenBloc bloc,
    ChildModel? child,
  ) async {
    final ChildModel? saved = await showModalBottomSheet<ChildModel>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => _ChildEditorSheet(child: child),
    );
    if (saved != null && !bloc.isClosed) bloc.add(.saveChild(saved));
  }

  Future<void> _confirmDelete(
    BuildContext context,
    ChildrenBloc bloc,
    ChildModel child,
  ) async {
    final bool? sure = await showDialog<bool>(
      context: context,
      builder: (context) => generalDialog(
        title: t.sure_delete_name(
          context: SessionService().gender,
          text: child.name,
        ),
        description: t.delete_child_description,
      ),
    );
    if (sure == true && !bloc.isClosed) bloc.add(.deleteChild(child));
  }
}

class _EmptyChildren extends StatelessWidget {
  const _EmptyChildren();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text("👶🍼", style: TextStyle(fontSize: 72)),
            const SizedBox(height: 12),
            Text(
              t.no_children_yet,
              style: AppTextStyle().title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              t.children_unlock_explanation,
              style: AppTextStyle().smallDescription,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _UnlockExplanation extends StatelessWidget {
  const _UnlockExplanation();

  @override
  Widget build(BuildContext context) {
    return Text(
      t.children_unlock_explanation,
      style: AppTextStyle().smallDescription,
      textAlign: TextAlign.center,
    );
  }
}

class _ChildCard extends StatelessWidget {
  final ChildModel child;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _ChildCard({
    required this.child,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      for (final category in familyCategoriesList([child])) category.name,
    ];
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: child.isGirl
                    ? Colors.pink.shade50
                    : Colors.blue.shade50,
                child: Text(child.emoji, style: const TextStyle(fontSize: 32)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child.name,
                      style: AppTextStyle().description.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${dateTimeToString(child.dateOfBirth)} · ${child.ageText()}",
                      style: AppTextStyle().dropDownValues,
                    ),
                    if (names.isNotEmpty)
                      Text(
                        "🔓 ${names.join(" · ")}",
                        style: AppTextStyle().dropDownValues.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                tooltip: t.delete,
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Name, gender and birth date of a new or edited child; pops the child.
class _ChildEditorSheet extends StatefulWidget {
  final ChildModel? child;
  const _ChildEditorSheet({this.child});

  @override
  State<_ChildEditorSheet> createState() => _ChildEditorSheetState();
}

class _ChildEditorSheetState extends State<_ChildEditorSheet> {
  late final TextEditingController name = TextEditingController(
    text: widget.child?.name,
  );
  late bool isGirl = widget.child?.isGirl ?? true;
  late DateTime? dateOfBirth = widget.child?.dateOfBirth;

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateOfBirth ?? now,
      firstDate: DateTime(now.year - 30),
      lastDate: now,
    );
    if (picked != null) setState(() => dateOfBirth = picked);
  }

  void _save() {
    final DateTime? date = dateOfBirth;
    if (name.text.trim().isEmpty) {
      kheasydevAppToast(t.child_name_required);
      return;
    }
    if (date == null) {
      kheasydevAppToast(t.child_birth_date_required);
      return;
    }
    Navigator.of(context).pop(
      ChildModel(
        id: widget.child?.id ?? getRandomString(10),
        name: name.text.trim(),
        dateOfBirth: date,
        gender: isGirl ? "female" : "male",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime? date = dateOfBirth;
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
            Text(
              widget.child == null ? t.new_child : widget.child!.name,
              style: AppTextStyle().title,
            ),
            AppTextField(
              hintText: t.child_name,
              controller: name,
              maxLength: 20,
              counterText: "",
            ),
            ToggleSwitch(
              initialLabelIndex: isGirl ? 0 : 1,
              labels: [t.girl, t.boy],
              onToggle: (index) => isGirl = index == 0,
              minWidth: 120.0,
              minHeight: 50,
              fontSize: 22,
              radiusStyle: true,
              cornerRadius: 100,
              activeFgColor: Colors.white,
              inactiveBgColor: AppColors.disableColor,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              animate: true,
              curve: Curves.decelerate,
              activeBgColors: const [
                [Colors.pink],
                [Colors.blue],
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.cake_outlined),
              label: Text(
                date == null
                    ? t.child_birth_date
                    : "${t.child_birth_date}: ${dateTimeToString(date)}",
                style: AppTextStyle().smallDescription,
              ),
            ),
            const SizedBox(height: 24),
            appButton(text: t.save, onTap: _save),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
