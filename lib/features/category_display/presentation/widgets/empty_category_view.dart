import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screens_top.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

/// Friendly placeholder shown to the partner when a category has no content
/// yet (e.g. the owner created it but never filled it in).
class EmptyCategoryView extends StatelessWidget {
  final CategoryModel category;
  const EmptyCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: category.displayTitle),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DisplayScreensTop(category: category),
                Text(
                  t.nothing_here_yet,
                  style: AppTextStyle().title,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
