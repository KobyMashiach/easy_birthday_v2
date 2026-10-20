import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/buttons/app_button.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/color_picker_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseAppColorScreen extends StatefulWidget {
  const ChooseAppColorScreen({
    super.key,
    required this.onContinue,
    this.onPrevious,
    this.settingScreen,
  });

  final void Function(Color? color) onContinue;
  final VoidCallback? onPrevious;
  final bool? settingScreen;

  @override
  State<ChooseAppColorScreen> createState() => _ChooseAppColorScreenState();
}

class _ChooseAppColorScreenState extends State<ChooseAppColorScreen> {
  bool colorChange = false;
  Color selectedColor = AppColors.primaryColor;

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
      colorChange = selectedColor != AppColors.primaryColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.settingScreen ?? false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) widget.onPrevious?.call();
      },
      child: Scaffold(
        appBar: widget.settingScreen == true
            ? appAppBar(title: t.change_color)
            : null,
        // Scrolls on short screens; looks the same when everything fits.
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                t.change_color,
                style: AppTextStyle().title,
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(paletteIllustration, height: 200),
              const SizedBox(height: 24),
              appButton(
                text: t.choose_color(context: SessionService().gender),
                margin: const EdgeInsets.symmetric(horizontal: 60),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => ColorPickerWidget(
                      initialColor: selectedColor,
                      onColorChanged: (color) {
                        changeColor(color);
                        Navigator.of(context).pop();
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
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
          activeButtonText: widget.settingScreen == true
              ? t.ok
              : colorChange
              ? t.continue_
              : t.continue_no_change,
          activeButtonOnTap: () {
            if (colorChange) {
              widget.onContinue.call(selectedColor);
            } else {
              widget.onContinue.call(null);
            }
          },
          oneButton: widget.settingScreen ?? false,
          inactiveButtonText: t.back,
          inactiveButtonOnTap: widget.onPrevious,
        ),
      ),
    );
  }
}

const List<Color> recommendedColors = [
  Color.fromARGB(255, 220, 155, 155),
  Color.fromARGB(255, 220, 194, 155),
  Color.fromARGB(255, 220, 217, 155),
  Color.fromARGB(255, 188, 220, 155),
  Color.fromARGB(255, 155, 220, 214),
  Color.fromARGB(255, 205, 155, 220),
  Color.fromARGB(255, 220, 155, 200),
];
