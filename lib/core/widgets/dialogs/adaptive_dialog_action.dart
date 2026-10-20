import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A dialog button that is a [CupertinoDialogAction] on iOS/macOS and a
/// [TextButton] elsewhere. Use inside `AlertDialog.adaptive`.
Widget adaptiveDialogAction(
  BuildContext context, {
  required String text,
  required VoidCallback onPressed,
  bool isDestructive = false,
  bool isDefault = false,
}) {
  final platform = Theme.of(context).platform;
  if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      isDestructiveAction: isDestructive,
      isDefaultAction: isDefault,
      child: Text(text),
    );
  }
  return TextButton(
    onPressed: onPressed,
    style: isDestructive
        ? TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          )
        : null,
    child: Text(text),
  );
}
