import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:wear_plus/wear_plus.dart';

class WearDesign extends StatelessWidget {
  final Widget child;
  const WearDesign({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, _) {
        final isRound = shape == WearShape.round;
        final screenSize = MediaQuery.sizeOf(context);
        final screenHeight = screenSize.height;
        final screenWidth = screenSize.width;

        return Scaffold(
          body: Center(
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: isRound
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    )
                  : BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
