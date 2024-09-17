import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:easy_birthday/widgets/dialogs/color_picker_dialog.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class ChooseAppColorScreen extends StatefulWidget {
  const ChooseAppColorScreen(
      {super.key, required this.onContinue, required this.onPrevious});

  final Function(Color? color) onContinue;
  final VoidCallback onPrevious;

  @override
  State<ChooseAppColorScreen> createState() => _ChooseAppColorScreenState();
}

class _ChooseAppColorScreenState extends State<ChooseAppColorScreen> {
  bool colorChange = false;
  Color selectedColor = AppColors.primaryColor;

  changeColor(Color color) {
    setState(() {
      selectedColor = color;
      colorChange = selectedColor != AppColors.primaryColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => widget.onPrevious(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(t.change_color,
                  style: AppTextStyle().title, textAlign: TextAlign.center),
              SvgPicture.asset(paletteIllustration, height: 200),
              const SizedBox(height: 24),
              AppButton(
                text: t.choose_color(context: globalGender),
                margin: EdgeInsets.symmetric(horizontal: 60),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => ColorPickerWidget(
                      initialColor: selectedColor,
                      onColorChanged: (color) {
                        changeColor(color);
                        KheasydevNavigatePage().popDuration(context);
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(t.recommended_colors),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedColors.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => changeColor(recommendedColors[index]),
                    child: CircleAvatar(
                      backgroundColor: recommendedColors[index],
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: selectedColor,
                minRadius: 60,
                child: Text(
                  t.selected_color,
                  style: AppTextStyle().description,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AppButtonsBottomNavigationBar(
          activeButtonText: colorChange ? t.continue_ : t.continue_no_change,
          activeButtonOnTap: () async {
            if (colorChange) {
              widget.onContinue.call(selectedColor);
            } else {
              widget.onContinue.call(null);
            }
          },
          inactiveButtonText: t.back,
          inactiveButtonOnTap: widget.onPrevious,
        ),
      ),
    );
  }
}

List<Color> recommendedColors = [
  Color.fromARGB(255, 220, 155, 155),
  Color.fromARGB(255, 220, 194, 155),
  Color.fromARGB(255, 220, 217, 155),
  Color.fromARGB(255, 188, 220, 155),
  Color.fromARGB(255, 155, 220, 214),
  Color.fromARGB(255, 205, 155, 220),
  Color.fromARGB(255, 220, 155, 200),
];
