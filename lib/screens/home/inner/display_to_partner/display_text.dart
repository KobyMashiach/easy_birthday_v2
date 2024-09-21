import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

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
              Text(
                category.titleAppear!,
                style: AppTextStyle().title,
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                readTextIllustration,
                height: 200,
              ),
              kheasydevDivider(black: true),
              Expanded(
                child: Scrollbar(
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Text(
                        category.text!,
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
