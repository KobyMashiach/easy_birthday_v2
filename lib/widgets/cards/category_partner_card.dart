import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryPartnerCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  const CategoryPartnerCard(
      {super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(color: AppColors.shadowColor),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                category.titleAppear!,
                textAlign: TextAlign.center,
                style: AppTextStyle()
                    .description
                    .copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
            ),
            SvgPicture.asset(
              category.categoryType.getImage(),
              height: 150,
            ),
            Text(category.name)
          ],
        ),
      ),
    );
  }
}
