import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class ColorPickerWidget extends StatefulWidget {
  final Color initialColor;
  final void Function(Color color) onColorChanged;

  const ColorPickerWidget({
    super.key,
    required this.initialColor,
    required this.onColorChanged,
  });

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  late Color currentColor = widget.initialColor;

  @override
  Widget build(BuildContext context) {
    return KheasydevDialog(
      title: t.pick_color,
      description: t.recommand_drak_colors,
      primaryColor: Colors.white,
      buttons: [
        GenericButtonModel(
          text: t.ok,
          type: GenericButtonType.outlined,
          onPressed: () {
            widget.onColorChanged(currentColor);
          },
        ),
      ],
      child: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: currentColor,
          displayThumbColor: true,
          onColorChanged: (Color color) => currentColor = color,
          pickerAreaHeightPercent: 0.8,
        ),
      ),
    );
  }
}
