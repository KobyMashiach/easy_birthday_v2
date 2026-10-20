import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/button_container.dart';
import 'package:easy_birthday/features/category_editor/presentation/widgets/edit_title_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class AddTextScreen extends StatefulWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onChangeTitle;
  final void Function(CategoryModel category, String text) onDone;
  const AddTextScreen({
    super.key,
    required this.category,
    required this.onChangeTitle,
    required this.onDone,
  });

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
                    Flexible(
                      child: Text(
                        t.write_text_to(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (SessionService().event?.planSubscribe.isNotFree ??
                        false)
                      buttonContainer(
                        title: t.create_greeting_using_ai,
                        icon: Icons.generating_tokens_outlined,
                        onTap: () => context.pushNamed(
                          Routing.generateGreeting,
                          extra: (
                            generateGreeting: (String? generateText) {
                              context.popIfPossible();
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
                      onTap: () => setState(() => lock = !lock),
                    ),
                  ],
                ),
                AppTextField(
                  hintText: t.add_text,
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
            );
            context.popIfPossible();
          } else {
            kheasydevAppToast(t.no_allow_text_empty);
          }
        },
      ),
    );
  }
}
