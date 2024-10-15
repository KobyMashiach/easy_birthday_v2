import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

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
                const SizedBox(height: 24),
                Text(
                  t.suprise_screen_description(context: globalGender),
                  textAlign: TextAlign.center,
                ),
                buttons(),
                kheasydevDivider(black: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonContainer(
            color: AppColors.primaryColor,
            icon: Icons.image,
            title: t.add_picture,
            onTap: () {}),
        buttonContainer(
            color: AppColors.primaryColor,
            icon: Icons.text_fields_rounded,
            title: t.add_text,
            onTap: () {}),
      ],
    );
  }

  Container buttonContainer(
      {required Color color,
      required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Container(
      width: 100.0,
      height: 100.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          IconButton(
              icon: Icon(icon, color: Colors.white, size: 40),
              onPressed: onTap),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle().smallDescription,
            ),
          )
        ],
      ),
    );
  }
}
