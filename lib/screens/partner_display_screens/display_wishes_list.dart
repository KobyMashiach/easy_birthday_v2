import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/wishes_model/wishes_model.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/general/display_screens_top.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

class DisplayWishesList extends StatefulWidget {
  const DisplayWishesList({
    super.key,
    required this.category,
    required this.onDone,
  });

  final CategoryModel category;
  final Function(WishesModel wishesList) onDone;

  @override
  State<DisplayWishesList> createState() => _DisplayWishesListState();
}

class _DisplayWishesListState extends State<DisplayWishesList> {
  late TextEditingController firstWish;
  late TextEditingController secondWish;
  late TextEditingController thirdWish;

  late WishesModel wishesList;

  @override
  void initState() {
    firstWish = TextEditingController();
    secondWish = TextEditingController();
    thirdWish = TextEditingController();
    wishesList = widget.category.wishesList!;
    initConrollers();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firstWish.dispose();
    secondWish.dispose();
    thirdWish.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: widget.category.titleAppear!),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DisplayScreensTop(category: widget.category),
                wishesList.lock
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(t.wish_list_lock_title,
                                    style: AppTextStyle().title),
                                Text(t.wish_list_lock_description,
                                    style: AppTextStyle().description),
                                const SizedBox(height: 24),
                                Text("1. ${wishesList.first!}"),
                                Text("2. ${wishesList.second!}"),
                                Text("3. ${wishesList.third!}"),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          appButton(
                            text: t.please_read_contract(
                                context: globalGender,
                                name: globalPartnerUser!.name),
                            margin: const EdgeInsets.all(12),
                            onTap: () async => await showDialog(
                              context: context,
                              builder: (context) => generalDialog(
                                  oneButton: true,
                                  description: wishesList.contract),
                            ),
                          ),
                          wishTextField(
                              hintText: t.first_wish, controller: firstWish),
                          wishTextField(
                              hintText: t.second_wish, controller: secondWish),
                          wishTextField(
                              hintText: t.third_wish, controller: thirdWish),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: wishesList.lock
          ? null
          : AppButtonsBottomNavigationBar(
              middleButton: true,
              middleButtonText: t.save,
              middleButtonOnTap: () {
                saveTextFields(lock: false);
                widget.onDone.call(wishesList);
                Navigator.of(context).pop();
              },
              activeButtonText: t.save_and_lock,
              activeButtonOnTap: checkAllFieldsComplete()
                  ? () {
                      saveTextFields(lock: true);
                      widget.onDone.call(wishesList);
                      Navigator.of(context).pop();
                    }
                  : null,
              activeButtonDisable: !checkAllFieldsComplete(),
            ),
    );
  }

  AppTextField wishTextField(
      {required String hintText, required TextEditingController controller}) {
    return AppTextField(
      hintText: hintText,
      maxLength: 30,
      maxLines: 2,
      readOnly: wishesList.lock,
      controller: controller,
      onChanged: (value) => setState(() {}),
    );
  }

  void saveTextFields({required bool lock}) {
    wishesList = wishesList.copyWith(
        first: firstWish.text, second: secondWish.text, third: thirdWish.text);
    if (lock) {
      wishesList = wishesList.copyWith(lock: true);
    }
  }

  bool checkAllFieldsComplete() {
    if (firstWish.text.isEmpty) return false;
    if (secondWish.text.isEmpty) return false;
    if (thirdWish.text.isEmpty) return false;
    return true;
  }

  void initConrollers() {
    firstWish.text = wishesList.first ?? "";
    secondWish.text = wishesList.second ?? "";
    thirdWish.text = wishesList.third ?? "";
  }
}
