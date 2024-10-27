import 'package:flutter/material.dart';

import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/display_screens_top.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';

class DisplayQuizGame extends StatefulWidget {
  const DisplayQuizGame({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<DisplayQuizGame> createState() => _DisplayQuizGameState();
}

class _DisplayQuizGameState extends State<DisplayQuizGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: widget.category.titleAppear!),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DisplayScreensTop(category: widget.category),
            ],
          ),
        ),
      ),
    );
  }
}
