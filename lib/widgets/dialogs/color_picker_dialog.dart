import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class ColorPickerWidget extends StatefulWidget {
  final Color initialColor;
  final Function(Color) onColorChanged;

  const ColorPickerWidget({super.key, required this.initialColor, required this.onColorChanged});

  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    Color currentColor = widget.initialColor;
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
            })
      ],
      child: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: currentColor,
          displayThumbColor: true,
          // labelTypes: [],
          onColorChanged: (Color color) => currentColor = color,
          pickerAreaHeightPercent: 0.8,
        ),
      ),
    );
  }
}
