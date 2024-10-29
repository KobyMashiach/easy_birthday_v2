import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/general/display_screens_top.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';

class DisplayTextScreen extends StatelessWidget {
  final CategoryModel category;
  const DisplayTextScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: category.titleAppear!),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              DisplayScreensTop(category: category, bottomSpace: false),
              Expanded(
                child: Scrollbar(
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Text(
                        category.text ?? "",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
