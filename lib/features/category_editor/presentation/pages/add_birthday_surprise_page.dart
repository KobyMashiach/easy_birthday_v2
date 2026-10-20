import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/add_text_dialog.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddBirthdaySurpriseScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(CategoryModel category, List<Widget> widgets) onDone;

  const AddBirthdaySurpriseScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
  });

  @override
  State<AddBirthdaySurpriseScreen> createState() =>
      _AddBirthdaySurpriseScreenState();
}

class _AddBirthdaySurpriseScreenState extends State<AddBirthdaySurpriseScreen> {
  bool lock = false;

  List<Widget> items = [];

  @override
  void initState() {
    lock = widget.category.lock;
    items = surpriseMapToWidgets(widget.category.surpriseMap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.birthday_suprise),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(t.add_suprise, style: AppTextStyle().bigTitle),
                SvgPicture.asset(surpriseIllustration, height: 200),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        t.add_text_pictures_description(
                          title: widget.category.displayTitle,
                        ),
                        style: AppTextStyle().title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AddTitleDialog(
                            title: widget.category.displayTitle,
                            onInputText: (text) {
                              widget.onChangeTitle.call(
                                widget.category.copyWith(titleAppear: text),
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  t.suprise_screen_description(
                    context: SessionService().gender,
                  ),
                  textAlign: TextAlign.center,
                ),
                buttons(),
                if (items.isNotEmpty) displayResultButton(context),
                kheasydevDivider(black: true),
                ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onReorder: onReorderList,
                  children: listGenerate(context),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {
          context.popIfPossible();
          widget.onDone.call(widget.category.copyWith(lock: lock), items);
        },
      ),
    );
  }

  List<Widget> listGenerate(BuildContext context) {
    return List.generate(
      items.length,
      (index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        key: ObjectKey(items[index]),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: const BoxConstraints(maxHeight: 150),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: widgetsCard(index, context),
        ),
      ),
    );
  }

  void onReorderList(int oldIndex, int newIndex) => setState(
    () {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Widget item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    },
  );

  Widget displayResultButton(BuildContext context) {
    return appButton(
      margin: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 4),
      text: t.display_result,
      unfillColors: true,
      onTap: () async => await showDialog(
        context: context,
        builder: (context) => generalDialog(
          oneButton: true,
          okButtonText: t.exit,
          noButtons: true,
          child: Column(
            children: List.generate(
              items.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _preview(items[index]),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListTile widgetsCard(int index, BuildContext context) {
    final widgetText = getWidgetText(items[index]);
    return ListTile(
      title: _preview(items[index]),
      onTap: () async => showDialog(
        context: context,
        builder: (context) =>
            generalDialog(child: _preview(items[index]), noButtons: true),
      ),
      trailing: ReorderableDragStartListener(
        index: index,
        child: const SizedBox(
          width: 48,
          height: 48,
          child: Icon(Icons.drag_handle),
        ),
      ),
      leading: IconButton(
        onPressed: () async {
          final userChoice = await showDialog<bool>(
            context: context,
            builder: (context) => generalDialog(
              title: t.sure_delete_name(
                context: SessionService().gender,
                text: widgetText,
              ),
            ),
          );
          if (userChoice == true && mounted) {
            setState(() => items.removeAt(index));
          }
        },
        icon: const Icon(Icons.delete, color: Colors.red, size: 28),
      ),
    );
  }

  Row buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonContainer(
          icon: Icons.image,
          title: t.add_picture,
          onTap: () async {
            final image = await pickImageImagePicker();
            if (image != null && mounted) {
              setState(() => items.add(Image.file(image, height: 150)));
            }
          },
        ),
        buttonContainer(
          icon: Icons.text_fields_rounded,
          title: t.add_text,
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) => AddTextDialog(
                toggleTitleAppears: true,
                onInputText: (text, title) {
                  setState(
                    () => items.add(
                      Text(
                        text,
                        style: title == true
                            ? AppTextStyle().subTitle
                            : AppTextStyle().description,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        buttonContainer(
          icon: lock ? Icons.lock_outline : Icons.lock_open,
          title: lock ? t.lock : t.unlock,
          onTap: () => setState(() => lock = !lock),
        ),
      ],
    );
  }

  /// Renders an item for display. Picked file images are decoded at a bounded
  /// size; the stored [Image] keeps its plain FileImage because the upload
  /// code identifies picked images by `image is FileImage`.
  Widget _preview(Widget item) {
    if (item is Image && item.image is FileImage) {
      return Image(
        image: ResizeImage(item.image, height: 450, allowUpscaling: false),
        height: item.height,
        width: item.width,
        fit: item.fit,
      );
    }
    return item;
  }

  /// Items are only ever [Text] or [Image] widgets.
  String getWidgetText(Widget item) {
    if (item is Text) {
      return item.data != null ? shortenString(item.data!) : t.the_text;
    }
    return t.the_image;
  }

  String shortenString(String input) {
    if (input.length <= 15) {
      return input;
    } else {
      return '${input.substring(0, 15)}...';
    }
  }
}
