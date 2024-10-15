import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
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
                      title: "sure delete?",
                    ));
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
            final image = await pickSingleImage();
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

  Widget buttonContainer(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.0,
        height: 100.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            Text(title, style: AppTextStyle().smallDescription)
          ],
        ),
      ),
    );
  }

  // void itemsUpdateFromServer() {
  //   if (widget.category.supriseMap != null) {
  //     Map<int, Map<String, String>> sortedMap = Map.fromEntries(
  //       widget.category.supriseMap!.entries.toList()
  //         ..sort((e1, e2) => e1.key.compareTo(e2.key)),
  //     );
  //     Map<int, Map<String, String>> updatedMap = {
  //       for (int i = 0; i < sortedMap.length; i++)
  //         i + 1: sortedMap.values.elementAt(i)
  //     };

  //     updatedMap.forEach(
  //       (key, value) {
  //         final element = value.entries.first;
  //         switch (element.key) {
  //           case "title":
  //             items.add(Text(element.value, style: AppTextStyle().subTitle));
  //           case "description":
  //             items.add(Text(element.value, style: AppTextStyle().description));
  //           case "image":
  //             items.add(Image.network(element.value, height: 150));
  //         }
  //       },
  //     );
  //   }
  // }
}
