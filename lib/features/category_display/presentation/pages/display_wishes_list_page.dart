import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screens_top.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DisplayWishesList extends StatefulWidget {
  const DisplayWishesList({
    super.key,
    required this.category,
    required this.onDone,
  });

  final CategoryModel category;
  final void Function(WishesModel wishesList) onDone;

  @override
  State<DisplayWishesList> createState() => _DisplayWishesListState();
}

class _DisplayWishesListState extends State<DisplayWishesList> {
  final TextEditingController firstWish = TextEditingController();
  final TextEditingController secondWish = TextEditingController();
  final TextEditingController thirdWish = TextEditingController();

  WishesModel? _wishesList;
  WishesModel get wishesList => _wishesList!;
  set wishesList(WishesModel value) => _wishesList = value;

  @override
  void initState() {
    super.initState();
    _wishesList = widget.category.wishesList;
    if (_wishesList != null) _initControllers();
  }

  @override
  void dispose() {
    firstWish.dispose();
    secondWish.dispose();
    thirdWish.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_wishesList == null) {
      return EmptyCategoryView(category: widget.category);
    }
    final bool allFieldsComplete = checkAllFieldsComplete();
    return Scaffold(
      appBar: appAppBar(
        title: widget.category.displayTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DisplayScreensTop(category: widget.category),
                wishesList.lock
                    // At least a screen high (texts at the top, as before) but
                    // grows instead of overflowing in landscape / large text.
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Expanded lets long texts wrap instead of
                            // overflowing the row.
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.wish_list_lock_title,
                                    style: AppTextStyle().title,
                                  ),
                                  Text(
                                    t.wish_list_lock_description(
                                      name:
                                          SessionService().partner?.name ?? '',
                                    ),
                                    style: AppTextStyle().description,
                                  ),
                                  const SizedBox(height: 24),
                                  Text("1. ${wishesList.first ?? ""}"),
                                  Text("2. ${wishesList.second ?? ""}"),
                                  Text("3. ${wishesList.third ?? ""}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          appButton(
                            text: t.please_read_contract(
                              context: SessionService().gender,
                              name: SessionService().partner?.name ?? '',
                            ),
                            margin: const EdgeInsets.all(12),
                            onTap: () => showDialog<void>(
                              context: context,
                              builder: (context) => generalDialog(
                                oneButton: true,
                                description: wishesList.contract,
                              ),
                            ),
                          ),
                          wishTextField(
                            hintText: t.first_wish,
                            controller: firstWish,
                          ),
                          wishTextField(
                            hintText: t.second_wish,
                            controller: secondWish,
                          ),
                          wishTextField(
                            hintText: t.third_wish,
                            controller: thirdWish,
                          ),
                        ],
                      ),
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
                widget.onDone(wishesList);
                _close();
              },
              activeButtonText: t.save_and_lock,
              activeButtonOnTap: allFieldsComplete
                  ? () {
                      saveTextFields(lock: true);
                      widget.onDone(wishesList);
                      _close();
                    }
                  : null,
              activeButtonDisable: !allFieldsComplete,
            ),
    );
  }

  void _close() {
    if (context.canPop()) {
      context.pop();
    } else {
      Navigator.of(context).maybePop();
    }
  }

  AppTextField wishTextField({
    required String hintText,
    required TextEditingController controller,
  }) {
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
      first: firstWish.text,
      second: secondWish.text,
      third: thirdWish.text,
    );
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

  void _initControllers() {
    firstWish.text = wishesList.first ?? "";
    secondWish.text = wishesList.second ?? "";
    thirdWish.text = wishesList.third ?? "";
  }
}
