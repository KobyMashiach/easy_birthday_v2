import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:flutter/material.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final category = globalEvent!.categories[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: Text(
              category.titleAppear!,
              style: AppTextStyle()
                  .description
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemCount: globalEvent!.categories.length,
    );
  }
}
