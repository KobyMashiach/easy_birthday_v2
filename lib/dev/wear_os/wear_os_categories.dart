import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/dev/wear_os/wear_design.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class WearOsCategories extends StatefulWidget {
  const WearOsCategories({super.key});

  @override
  State<WearOsCategories> createState() => _WearOsCategoriesState();
}

class _WearOsCategoriesState extends State<WearOsCategories> {
  @override
  Widget build(BuildContext context) {
    return WearDesign(
        child: Text(
      t.greeter(context: globalGender, name: globalUser.name),
      style: AppTextStyle().watchTitle,
    ));
  }
}
