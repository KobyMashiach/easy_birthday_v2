import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/text_items_model/text_item_model.dart';
import 'package:easy_birthday/screens/home/inner/display_to_partner/display_birthday_suprise.dart';
import 'package:easy_birthday/screens/home/inner/display_to_partner/display_pictures_videos.dart';
import 'package:easy_birthday/screens/home/inner/display_to_partner/display_text.dart';
import 'package:easy_birthday/widgets/cards/category_partner_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class PartnerHomeScreen extends StatelessWidget {
  const PartnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(getEventsString(textEnum: ReadyTextEnum.title),
              style: AppTextStyle().bigTitle),
          SvgPicture.asset(balloonsIllustration, height: 300),
          Text(
            "${getEventsString(textEnum: ReadyTextEnum.description)}\n${t.got_full_app}",
            style: AppTextStyle().title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24.0,
              mainAxisSpacing: 24.0,
              childAspectRatio: 1 / 1.6,
            ),
            itemBuilder: (context, index) {
              final category = globalEvent!.categories[index];
              return CategoryPartnerCard(
                category: category,
                //TODO: navigate by type
                onTap: () {
                  switch (category.categoryType) {
                    case CategoryEnum.text:
                      KheasydevNavigatePage().pushDuration(
                          context, DisplayTextScreen(category: category));
                    case CategoryEnum.pictures:
                      KheasydevNavigatePage().pushDuration(
                          context,
                          DisplayPicturesVideosScreen(
                              category: category, isImages: true));
                    case CategoryEnum.videos:
                      KheasydevNavigatePage().pushDuration(
                          context,
                          DisplayPicturesVideosScreen(
                              category: category, isImages: false));

                    case CategoryEnum.quizGame:
                    case CategoryEnum.birthdayCalender:
                    case CategoryEnum.birthdaySuprise:
                      KheasydevNavigatePage().pushDuration(
                          context, DisplayBirthdaySuprise(category: category));
                  }
                },
              );
            },
            itemCount: globalEvent!.categories.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
