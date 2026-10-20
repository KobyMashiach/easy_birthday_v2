import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class AddTitleDialog extends StatefulWidget {
  final String title;
  final void Function(String text) onInputText;
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
      width: MediaQuery.sizeOf(context).width,
      okButtonOnTap: () {
        if (textController.text.isNotEmpty) {
          widget.onInputText.call(textController.text);
          Navigator.of(context).pop();
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
