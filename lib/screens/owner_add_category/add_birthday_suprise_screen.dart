import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/general/button_container.dart';
import 'package:easy_birthday/widgets/dialogs/add_text_dialog.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddBirthdaySupriseScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(CategoryModel category, List<Widget> widgets) onDone;

  const AddBirthdaySupriseScreen(
      {super.key, required this.category, required this.onDone});

  @override
  State<AddBirthdaySupriseScreen> createState() =>
      _AddBirthdaySupriseScreenState();
}

class _AddBirthdaySupriseScreenState extends State<AddBirthdaySupriseScreen> {
  bool lock = false;

  List<Widget> items = [];

  @override
  void initState() {
    lock = widget.category.lock;
    items = supriseMapToWidgets(widget.category.supriseMap);
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
                SvgPicture.asset(supriseIllustration, height: 200),
                Text(
                  t.add_text_pictures_description(
                      title: widget.category.titleAppear!),
                  style: AppTextStyle().title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  t.suprise_screen_description(context: globalGender),
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
          KheasydevNavigatePage().pop(context);
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
              key: ValueKey(index),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: const BoxConstraints(maxHeight: 150),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: widgetsCard(index, context),
              ),
            ));
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
                    items[index],
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
      title: items[index],
      onTap: () async => showDialog(
        context: context,
        builder: (context) =>
            generalDialog(child: items[index], noButtons: true),
      ),
      trailing: ReorderableDragStartListener(
        index: index,
        child: const Icon(Icons.drag_handle),
      ),
      leading: IconButton(
          onPressed: () async {
            final userChoise = await showDialog(
                context: context,
                builder: (context) => generalDialog(
                    title: t.sure_delete_name(
                        context: globalGender, text: widgetText)));
            if (userChoise == true) {
              setState(() => items.removeAt(index));
            }
          },
          icon: const Icon(Icons.delete, color: Colors.red, size: 28)),
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
            if (image != null) {
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
                    setState(() => items.add(Text(text,
                        style: title == true
                            ? AppTextStyle().subTitle
                            : AppTextStyle().description)));
                  }),
            );
          },
        ),
        buttonContainer(
            icon: lock ? Icons.lock_outline : Icons.lock_open,
            title: lock ? t.lock : t.unlock,
            onTap: () => setState(() => lock = !lock)),
      ],
    );
  }

  getWidgetText(Widget item) {
    if (item is Text) {
      return item.data != null ? shortenString(item.data!) : t.the_text;
    } else if (item is Image) {
      return t.the_image;
    }
  }

  String shortenString(String input) {
    if (input.length <= 15) {
      return input;
    } else {
      return '${input.substring(0, 15)}...';
    }
  }
}
