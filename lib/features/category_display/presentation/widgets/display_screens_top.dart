import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisplayScreensTop extends StatelessWidget {
  final CategoryModel category;
  final bool bottomSpace;
  const DisplayScreensTop({
    super.key,
    required this.category,
    this.bottomSpace = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category.displayTitle,
          style: AppTextStyle().title,
          textAlign: TextAlign.center,
        ),
        SvgPicture.asset(category.categoryType.getImage(), height: 200),
        kheasydevDivider(black: true),
        if (bottomSpace) const SizedBox(height: 12),
      ],
    );
  }
}
