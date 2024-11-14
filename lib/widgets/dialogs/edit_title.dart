import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/design/fields/app_textfields.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddTitleDialog extends StatefulWidget {
  final String title;
  final Function(String text) onInputText;
  const AddTitleDialog({
    super.key,
    required this.title,
    required this.onInputText,
  });

  @override
  State<AddTitleDialog> createState() => _AddTitleDialogState();
}

class _AddTitleDialogState extends State<AddTitleDialog> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController.text = widget.title;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return generalDialog(
      title: t.edit_title,
      width: MediaQuery.of(context).size.width,
      okButtonOnTap: () {
        if (textController.text.isNotEmpty) {
          widget.onInputText.call(textController.text);
          KheasydevNavigatePage().pop(context);
        } else {
          kheasydevAppToast(t.text_appear_required);
        }
      },
      child: Column(
        children: [
          AppTextField(
            hintText: t.write_text,
            controller: textController,
            maxLength: 30,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
