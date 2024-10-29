import 'package:easy_birthday/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class DualNumberCircularProgress extends StatelessWidget {
  final int activeNumber;
  final int totalNumber;
  final double size;

  const DualNumberCircularProgress({
    super.key,
    required this.activeNumber,
    required this.totalNumber,
    this.size = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = activeNumber / totalNumber;
    double strokeWidth = size * 0.02;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: size / 32.0,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.disableColor),
            ),
          ),
          Transform.scale(
            scale: size / 32.0,
            child: CircularProgressIndicator(
              value: progressValue,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "$activeNumber",
                    style: TextStyle(
                      fontSize: size * 0.30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                kheasydevDivider(black: true),
                Expanded(
                  child: Text(
                    "$totalNumber",
                    style: TextStyle(
                      fontSize: size * 0.24,
                      color: AppColors.disableColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
