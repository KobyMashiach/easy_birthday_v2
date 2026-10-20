import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddWishesListScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;

  final void Function(CategoryModel category, String text, bool edit) onDone;
  final VoidCallback deleteWishes;
  const AddWishesListScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
    required this.deleteWishes,
  });

  @override
  State<AddWishesListScreen> createState() => _AddWishesListScreenState();
}

class _AddWishesListScreenState extends State<AddWishesListScreen> {
  bool lock = false;
  late TextEditingController textController;

  @override
  void initState() {
    lock = widget.category.lock;
    textController = TextEditingController();
    textController.text = widget.category.wishesList?.contract ?? "";
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.write_contract),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(t.write_contract, style: AppTextStyle().bigTitle),
                SvgPicture.asset(wishIllustrations, height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        t.write_contract_to(
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
                buttonContainer(
                  icon: lock ? Icons.lock_outline : Icons.lock_open,
                  title: lock ? t.lock : t.unlock,
                  onTap: () => setState(() => lock = !lock),
                ),
                if (widget.category.wishesList?.lock ?? false)
                  displayWishesButton(context),
                AppTextField(
                  hintText: t.write_contract,
                  maxLines: 12,
                  keyboard: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: textController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          if (textController.text.isNotEmpty) {
            widget.onDone.call(
              widget.category.copyWith(lock: lock),
              textController.text,
              widget.category.wishesList != null,
            );
            context.popIfPossible();
          } else {
            kheasydevAppToast(t.no_allow_text_empty);
          }
        },
      ),
    );
  }

  Widget displayWishesButton(BuildContext context) {
    return appButton(
      text: t.display_wishes,
      margin: const EdgeInsets.all(12),
      onTap: () async {
        final wishesList = widget.category.wishesList!;
        await showDialog(
          context: context,
          builder: (context) => generalDialog(
            title: t.wishes_list,
            description: t.delete_wishes_description(
              context: SessionService().gender,
              name: SessionService().partner?.name ?? '',
            ),
            okButtonText: t.delete_wishes,
            okButtonOnTap: () {
              widget.deleteWishes.call();
              Navigator.of(context).pop();
              Navigator.of(context).maybePop();
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1. ${wishesList.first ?? ""}"),
                Text("2. ${wishesList.second ?? ""}"),
                Text("3. ${wishesList.third ?? ""}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
