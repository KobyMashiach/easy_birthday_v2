import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/core/widgets/design_kit/pressable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryPartnerCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  const CategoryPartnerCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      semanticLabel: category.displayTitle,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.hairline),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withValues(alpha: 0.14),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: titleAndLockIcon(),
            ),
            SvgPicture.asset(
              category.categoryType.getImage(),
              height: 150,
            ),
            Text(
              category.name,
              style: AppTextStyle().smallDescription.copyWith(
                color: AppColors.inkSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack titleAndLockIcon() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            category.displayTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle().description.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ),
        if (category.lock)
          const PositionedDirectional(
            end: 12,
            child: Icon(Icons.lock_outline, color: AppColors.inkSecondary),
          ),
      ],
    );
  }
}
