import 'package:easy_birthday/core/colors.dart';
import 'package:flutter/material.dart';

class AppToggleButton extends StatefulWidget {
  final Map<String, bool> items;
  final Function(String) onSelected;

  const AppToggleButton({
    super.key,
    required this.items,
    required this.onSelected,
  });

  @override
  State<AppToggleButton> createState() => _AppToggleButtonState();
}

class _AppToggleButtonState extends State<AppToggleButton> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.items.values.toList().indexOf(true);
  }

  @override
  Widget build(BuildContext context) {
    List<String> keys = widget.items.keys.toList();
    List<bool> isSelected = List.generate(
      keys.length,
      (index) => index == selectedIndex,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttomBackground, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ToggleButtons(
        isSelected: isSelected,
        borderRadius: BorderRadius.circular(30),
        borderWidth: 0,
        borderColor: Colors.transparent,
        selectedBorderColor: Colors.transparent,
        fillColor: Colors.transparent,
        onPressed: (index) {
          setState(() => selectedIndex = index);
          widget.onSelected(keys[index]);
        },
        children: List<Widget>.generate(
          keys.length,
          (index) => TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin:
                  index == selectedIndex ? Colors.black87 : Colors.transparent,
              end: index == selectedIndex ? Colors.black87 : Colors.transparent,
            ),
            duration: const Duration(milliseconds: 100),
            builder: (context, color, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: Text(
                  keys[index],
                  style: TextStyle(
                    color:
                        index == selectedIndex ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
