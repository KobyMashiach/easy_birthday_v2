import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/fields/app_textfields.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class AddTextDialog extends StatefulWidget {
  final void Function(String text, bool? title) onInputText;
  final bool toggleTitleAppears;
  const AddTextDialog({
    super.key,
    required this.onInputText,
    this.toggleTitleAppears = false,
  });

  @override
  State<AddTextDialog> createState() => _AddTextDialogState();
}

class _AddTextDialogState extends State<AddTextDialog> {
  late TextEditingController textController;
  bool isTitle = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return generalDialog(
      title: t.add_text,
      width: MediaQuery.sizeOf(context).width,
      okButtonOnTap: () {
        if (textController.text.isNotEmpty) {
          widget.onInputText.call(textController.text, isTitle);
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
            maxLength: 100,
            maxLines: 4,
            keyboard: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
          ),
          if (widget.toggleTitleAppears)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(t.title),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GFToggle(
                    onChanged: (val) => isTitle = val!,
                    value: isTitle,
                    type: GFToggleType.ios,
                    enabledTrackColor: AppColors.primaryColor,
                  ),
                ),
                Text(t.description),
              ],
            ),
        ],
      ),
    );
  }
}
