import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
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

class AddBirthdaySupriseScreen extends StatefulWidget {
  final CategoryModel category;

  const AddBirthdaySupriseScreen(this.category, {super.key});

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
                if (items.isNotEmpty)
                  appButton(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 80.0, vertical: 4),
                    text: t.display_result,
                    unfillColors: true,
                    onTap: () async => await showDialog(
                      context: context,
                      builder: (context) => generalDialog(
                          title: t.greeting_before_edit,
                          oneButton: true,
                          okButtonText: t.exit,
                          noButtons: true),
                    ),
                  ),
                kheasydevDivider(black: true),
                ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onReorder: (int oldIndex, int newIndex) {
                    setState(
                      () {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final Widget item = items.removeAt(oldIndex);
                        items.insert(newIndex, item);
                      },
                    );
                  },
                  children: List.generate(items.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      key: ValueKey(index),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: const BoxConstraints(maxHeight: 150),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: items[index],
                          onTap: () async => showDialog(
                            context: context,
                            builder: (context) => generalDialog(
                                child: items[index], noButtons: true),
                          ),
                          trailing: ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.drag_handle),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {},
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
          onTap: () {},
        ),
        buttonContainer(
          icon: Icons.text_fields_rounded,
          title: t.add_text,
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) => AddTextDialog(onInputText: (text) {
                setState(() => items.add(Text(text)));
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
}
