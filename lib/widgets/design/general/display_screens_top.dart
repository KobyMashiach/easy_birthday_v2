import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';

class DisplayScreensTop extends StatelessWidget {
  final CategoryModel category;
  final bool bottomSpace;
  const DisplayScreensTop(
      {super.key, required this.category, this.bottomSpace = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category.titleAppear!,
          style: AppTextStyle().title,
          textAlign: TextAlign.center,
        ),
        SvgPicture.asset(category.categoryType.getImage(), height: 200),
        kheasydevDivider(black: true),
        if (bottomSpace == true) const SizedBox(height: 12),
      ],
    );
  }
}
