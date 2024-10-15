import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddBirthdaySupriseScreen extends StatefulWidget {
  final CategoryModel category;
  const AddBirthdaySupriseScreen(this.category, {super.key});

  @override
  State<AddBirthdaySupriseScreen> createState() =>
      _AddBirthdaySupriseScreenState();
}

class _AddBirthdaySupriseScreenState extends State<AddBirthdaySupriseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.birthday_suprise),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(t.add_suprise, style: AppTextStyle().bigTitle),
                SvgPicture.asset(supriseIllustration, height: 200),
                Text(
                  t.add_text_pictures_description(
                      title: widget.category.titleAppear!),
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
