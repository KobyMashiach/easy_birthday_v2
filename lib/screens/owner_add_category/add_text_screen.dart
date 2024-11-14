import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/dev/generate_greeting.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/design/general/button_container.dart';
import 'package:easy_birthday/widgets/dialogs/edit_title.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddTextScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(CategoryModel category) onChangeTitle;
  final Function(CategoryModel category, String text) onDone;
  const AddTextScreen(
      {super.key,
      required this.category,
      required this.onChangeTitle,
      required this.onDone});

  @override
  State<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends State<AddTextScreen> {
  bool lock = false;
  late TextEditingController textController;

  @override
  void initState() {
    lock = widget.category.lock;
    textController = TextEditingController();
    textController.text = widget.category.text ?? "";
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
      appBar: appAppBar(title: t.add_text),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(t.add_text, style: AppTextStyle().bigTitle),
                SvgPicture.asset(writeLetterIllustration, height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.write_text_to(title: widget.category.titleAppear!),
                      style: AppTextStyle().title,
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => AddTitleDialog(
                                    title: widget.category.titleAppear!,
                                    onInputText: (text) {
                                      widget.onChangeTitle.call(widget.category
                                          .copyWith(titleAppear: text));
                                    },
                                  ));
                        },
                        icon: const Icon(Icons.edit))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (globalEvent!.planSubscribe.isNotFree)
                      buttonContainer(
                        title: t.create_greeting_using_ai,
                        icon: Icons.generating_tokens_outlined,
                        // margin: const EdgeInsets.all(12),
                        onTap: () => KheasydevNavigatePage().push(
                          context,
                          GenerateGreeting(
                            generateGreeting: (generateText) {
                              KheasydevNavigatePage().pop(context);
                              if (generateText != null) {
                                textController.text = generateText;
                              }
                            },
                          ),
                        ),
                      ),
                    buttonContainer(
                        icon: lock ? Icons.lock_outline : Icons.lock_open,
                        title: lock ? t.lock : t.unlock,
                        onTap: () => setState(() => lock = !lock)),
                  ],
                ),
                AppTextField(
                  hintText: t.add_text,
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
            widget.onDone.call(
                widget.category.copyWith(lock: lock), textController.text);
            KheasydevNavigatePage().pop(context);
          } else {
            kheasydevAppToast(t.no_allow_text_empty);
          }
        },
      ),
    );
  }
}
