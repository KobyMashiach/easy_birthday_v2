import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/wishes_model/wishes_model.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddWishesListScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(String text, bool edit) onDone;
  final VoidCallback deleteWishes;
  const AddWishesListScreen(
      {super.key,
      required this.category,
      required this.onDone,
      required this.deleteWishes});

  @override
  State<AddWishesListScreen> createState() => _AddWishesListScreenState();
}

class _AddWishesListScreenState extends State<AddWishesListScreen> {
  late TextEditingController textController;

  @override
  void initState() {
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
                Text(
                  t.write_contract_to(title: widget.category.titleAppear!),
                  style: AppTextStyle().title,
                  textAlign: TextAlign.center,
                ),
                if (widget.category.wishesList?.lock ?? false)
                  appButton(
                    text: t.display_wishes,
                    margin: const EdgeInsets.all(12),
                    onTap: () async {
                      final wishesList = widget.category.wishesList!;
                      await showDialog(
                        context: context,
                        builder: (context) => generalDialog(
                          title: t.wishes_list,
                          description: t.delete_wishes_description(
                              context: globalGender,
                              name: globalPartnerUser!.name),
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
                              Row(
                                children: [
                                  Text("1. ${wishesList.first}"),
                                ],
                              ),
                              Text("2. ${wishesList.second}"),
                              Text("3. ${wishesList.third}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                AppTextField(
                  hintText: t.write_contract,
                  maxLines: 12,
                  keyboard: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: textController,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        oneButton: true,
        activeButtonOnTap: () {
          if (textController.text.isNotEmpty) {
            widget.onDone
                .call(textController.text, widget.category.wishesList != null);
            KheasydevNavigatePage().pop(context);
          } else {
            kheasydevAppToast(t.no_allow_text_empty);
          }
        },
      ),
    );
  }

  bool checkAllWishesComplete() {
    final WishesModel? wishesList = widget.category.wishesList;
    if (wishesList == null) return false;
    if (wishesList.first == null) return false;
    if (wishesList.second == null) return false;
    if (wishesList.third == null) return false;
    return true;
  }
}
