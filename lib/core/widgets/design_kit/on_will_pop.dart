import 'package:easy_birthday/core/widgets/design_kit/dialogs.dart';
import 'package:flutter/material.dart';

/// Asks before leaving the app. Returns true when the user confirmed.
Future<bool> kheasydevOnWillPop(
  BuildContext context, {
  required Color primaryColor,
  required Color buttonBackground,
  required String title,
  required String description,
  required String yesText,
  required String noText,
}) async {
  return (await showDialog<bool>(
        context: context,
        builder: (context) => KheasydevDialog(
          title: title,
          description: description,
          isDismissable: false,
          primaryColor: primaryColor,
          buttonBackground: buttonBackground,
          buttons: [
            GenericButtonModel(
              text: yesText,
              type: GenericButtonType.elevated,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            GenericButtonModel(
              text: noText,
              type: GenericButtonType.outlined,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      )) ??
      false;
}
