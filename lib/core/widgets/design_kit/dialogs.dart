import 'dart:async';

import 'package:easy_birthday/core/widgets/design_kit/app_button.dart';
import 'package:flutter/material.dart';

/// Dialogs copied as-is from the former kh_easy_dev package (visual design
/// intentionally unchanged).

class KheasydevDialog extends StatefulWidget {
  final double? height;
  final double? width;
  final String? title;
  final Widget? child;
  final List<GenericButtonModel>? buttons;
  final bool isButtonsVertical;
  final bool isDismissable;
  final Duration? duration;
  final String? description;
  final List<String>? descriptions;
  final bool? shouldDisplayX;
  final Color? primaryColor;
  final Color? buttonBackground;

  const KheasydevDialog({
    super.key,
    this.height,
    this.width,
    this.title,
    this.shouldDisplayX,
    this.child,
    this.buttons,
    this.isButtonsVertical = false,
    this.isDismissable = true,
    this.duration,
    this.description,
    this.descriptions,
    this.primaryColor,
    this.buttonBackground,
  });

  @override
  State<KheasydevDialog> createState() => _KheasydevDialogState();
}

class _KheasydevDialogState extends State<KheasydevDialog> {
  Timer? _timer;
  late bool shouldDisplayX;

  Widget _buildButtons(BuildContext context) {
    final uiButtons = widget.buttons!.map((buttonModel) {
      late ButtonStyleButton button;
      switch (buttonModel.type) {
        case GenericButtonType.elevated:
          button = ElevatedButton(
            onPressed: buttonModel.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonModel.color ?? Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(buttonModel.text),
            ),
          );
          break;
        case GenericButtonType.text:
          button = TextButton(
            onPressed: buttonModel.onPressed,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(buttonModel.text),
            ),
          );
          break;
        case GenericButtonType.outlined:
          button = OutlinedButton(
            onPressed: buttonModel.onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              side: BorderSide(color: Theme.of(context).primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(buttonModel.text),
            ),
          );
          break;
      }
      if (widget.isButtonsVertical || buttonModel.width != null) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.isButtonsVertical ? 8 : 0,
            horizontal: widget.isButtonsVertical ? 0 : 8,
          ),
          child: SizedBox(
            height: buttonModel.height,
            width: buttonModel.width,
            child: button,
          ),
        );
      } else {
        Widget child = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: buttonModel.height,
            child: button,
          ),
        );
        if (buttonModel.fit == FlexFit.loose) {
          child = Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(height: buttonModel.height, child: button),
            ),
          );
        }
        return Flexible(fit: buttonModel.fit, child: child);
      }
    }).toList();

    if (widget.isButtonsVertical) {
      return Column(children: uiButtons);
    } else {
      return Row(children: uiButtons);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.duration != null) {
      // One-shot (the original periodic timer could also pop the screen
      // underneath the dialog).
      _timer = Timer(widget.duration!, () {
        if (mounted) Navigator.of(context).maybePop();
      });
    }
    shouldDisplayX = widget.shouldDisplayX ?? true;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.isDismissable,
      child: SimpleDialog(
        backgroundColor: widget.primaryColor ?? Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        contentPadding: const EdgeInsets.all(10),
        children: [
          if (widget.isDismissable ||
              widget.title != null ||
              widget.description != null ||
              widget.descriptions != null)
            Stack(
              children: [
                if (widget.isDismissable && shouldDisplayX)
                  Container(
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      color: widget.buttonBackground ?? Colors.white,
                    ),
                    width: 26,
                    height: 26,
                    child: FittedBox(
                      child: IconButton(
                        tooltip: MaterialLocalizations.of(
                          context,
                        ).closeButtonTooltip,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        iconSize: 28,
                        icon: const Icon(Icons.close, color: Colors.black),
                      ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.isDismissable) Container(height: 25),
                    if (widget.title != null)
                      Text(
                        widget.title!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if (widget.descriptions != null)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...widget.descriptions!.map(
                            (description) => Text(
                              description,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    if (widget.description != null)
                      Center(
                        child: Text(
                          widget.description!,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 15),
                  ],
                ),
              ],
            )
          else
            const SizedBox(height: 20),
          if (widget.child != null)
            SizedBox(
              height: widget.height,
              width: widget.width,
              child: widget.child,
            ),
          if (widget.buttons != null && widget.buttons!.isNotEmpty)
            _buildButtons(context),
        ],
      ),
    );
  }
}

class GenericButtonModel {
  final VoidCallback? onPressed;
  final String text;
  final double? height;
  final double? width;
  final GenericButtonType type;
  final Color? color;
  final FlexFit fit;

  const GenericButtonModel({
    this.onPressed,
    required this.text,
    this.height,
    this.color,
    this.width,
    required this.type,
    this.fit = FlexFit.tight,
  });
}

enum GenericButtonType { elevated, text, outlined }

class KhEasydevDialogV2 extends StatelessWidget {
  final String? title;
  final String? description;
  final Color? primaryColor;
  final double? buttonsTextSize;
  final double? titleTextSize;
  final double? descriptionTextSize;
  final bool oneButton;
  final bool noButtons;
  final List<Widget>? buttons;
  final String? okButtonText;
  final String? cancelButtonText;
  final bool childBeforeTitle;
  final Widget? child;
  final double? height;
  final double? width;
  final VoidCallback? okButtonOnTap;

  const KhEasydevDialogV2({
    super.key,
    this.title,
    this.description,
    this.primaryColor,
    this.buttonsTextSize,
    this.titleTextSize,
    this.descriptionTextSize,
    this.oneButton = false,
    this.noButtons = false,
    this.buttons,
    this.okButtonText,
    this.cancelButtonText,
    this.childBeforeTitle = false,
    this.child,
    this.height,
    this.width,
    this.okButtonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      contentPadding: const EdgeInsets.all(10),
      children: [
        Stack(
          children: [
            Align(
              alignment: Directionality.of(context) == TextDirection.ltr
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: xButtonUI(context),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (child != null && childBeforeTitle) child!,
                    if (title != null)
                      Text(
                        title!,
                        style: TextStyle(
                          fontSize: titleTextSize ?? 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if (description != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          description!,
                          style: TextStyle(
                            fontSize: descriptionTextSize ?? 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (child != null && !childBeforeTitle)
                      SizedBox(height: height, width: width, child: child),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (buttons != null)
                          ...buttons!.map((button) => Expanded(child: button)),
                        if (buttons == null && !noButtons) ...[
                          Expanded(
                            child: kheasydevAppButton(
                              text: okButtonText ?? "OK",
                              textSize: buttonsTextSize,
                              primaryColor: primaryColor,
                              onTap:
                                  okButtonOnTap ??
                                  () => Navigator.of(context).pop(true),
                            ),
                          ),
                          if (!oneButton)
                            Expanded(
                              child: kheasydevAppButton(
                                text: cancelButtonText ?? "Cancel",
                                textSize: buttonsTextSize,
                                primaryColor: primaryColor,
                                unfillColors: true,
                                onTap: () => Navigator.of(context).pop(false),
                              ),
                            ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container xButtonUI(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.white,
      ),
      width: 26,
      height: 26,
      child: FittedBox(
        child: IconButton(
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 28,
          icon: const Icon(Icons.close, color: Colors.black),
        ),
      ),
    );
  }
}
