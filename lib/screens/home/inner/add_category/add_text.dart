import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddTextScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(String text) onDone;
  const AddTextScreen(
      {super.key, required this.category, required this.onDone});

  @override
  State<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends State<AddTextScreen> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
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
                Text(
                  t.write_text_to(title: widget.category.titleAppear!),
                  style: AppTextStyle().title,
                  textAlign: TextAlign.center,
                ),
                AppTextField(
                  hintText: t.add_text,
                  maxLines: 12,
                  keyboard: TextInputType.multiline,
                  controller: textController,
                  textInputAction: TextInputAction.newline,
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
            widget.onDone.call(textController.text);
            KheasydevNavigatePage().pop(context);
          } else {
            kheasydevAppToast(t.no_allow_text_empty);
          }
        },
      ),
    );
  }
}
