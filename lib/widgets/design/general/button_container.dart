import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:flutter/material.dart';

Widget buttonContainer(
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100.0,
      height: 100.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 40),
          Text(title, style: AppTextStyle().smallDescription)
        ],
      ),
    ),
  );
}
