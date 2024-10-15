import 'package:blobs/blobs.dart';
import 'package:easy_birthday/core/colors.dart';
import 'package:flutter/material.dart';

class BlobWidget extends StatelessWidget {
  final Widget child;
  const BlobWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Blob.random(
      size: screenWidth * 0.8,
      styles: BlobStyles(
          // color: AppColors.primaryColor.withOpacity(0.3),
          gradient: LinearGradient(colors: [
        AppColors.primaryColor.withOpacity(0.2),
        AppColors.primaryColor.withOpacity(0.8),
      ]).createShader(const Rect.fromLTRB(0, 0, 300, 300))),
      child: Center(
        child: child,
      ),
    );
  }
}
