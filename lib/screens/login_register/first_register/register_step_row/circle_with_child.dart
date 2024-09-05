import 'package:easy_birthday/core/colors.dart';
import 'package:flutter/material.dart';

class CircleWithChild extends StatelessWidget {
  final Widget child;
  final bool? fillColor;

  const CircleWithChild({super.key, required this.child, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: fillColor == true ? AppColors.primaryColor : null,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.greyDisableColor,
          width: 1,
        ),
      ),
      child: Center(
        child: child is Icon
            ? Icon(
                (child as Icon).icon,
                size: 12,
                color:
                    fillColor == true ? Colors.white : AppColors.primaryColor,
              )
            : Text((child as Text).data ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
      ),
    );
  }
}
