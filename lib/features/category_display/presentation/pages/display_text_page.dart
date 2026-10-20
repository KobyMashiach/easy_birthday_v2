import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screen_layout.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

class DisplayTextScreen extends StatelessWidget {
  final CategoryModel category;
  const DisplayTextScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: category.displayTitle),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: DisplayScreenLayout(
          category: category,
          bottomSpace: false,
          body: Scrollbar(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Text(category.text ?? "", textAlign: TextAlign.center),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
