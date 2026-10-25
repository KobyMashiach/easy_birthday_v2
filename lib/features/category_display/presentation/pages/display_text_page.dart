import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/widgets/animations/typewriter_text.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screen_layout.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/greeting_card_frame.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

/// The owner's greeting, typed onto a decorated card.
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: GreetingCardFrame(
                child: TypewriterText(
                  category.text ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    height: 1.3,
                    color: Color.lerp(
                      AppColors.disableColor,
                      Colors.black,
                      0.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
