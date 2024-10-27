import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/text_items_model/text_item_model.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_birthday_calendar.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_birthday_suprise.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_pictures_videos.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_quiz_game.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_text.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_wishes_list.dart';
import 'package:easy_birthday/widgets/cards/category_partner_card.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class PartnerHomeScreen extends StatelessWidget {
  final Function(CategoryModel category) onChangeCategory;
  const PartnerHomeScreen({super.key, required this.onChangeCategory});

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
                      KheasydevNavigatePage().pushDuration(
                          context, DisplayQuizGame(category: category));

                    case CategoryEnum.birthdayCalendar:
                      KheasydevNavigatePage().pushDuration(
                          context, DisplayBirthdayCalendar(category: category));

                    case CategoryEnum.birthdaySuprise:
                      if (category.lock) {
                        showDialog(
                          context: context,
                          builder: (context) => generalDialog(
                              title: t.secret_dialog(
                                  context: globalGender,
                                  categoryName:
                                      category.titleAppear ?? category.name,
                                  name: globalPartnerUser!.name),
                              child: SvgPicture.asset(secretIllustrations,
                                  height: 150),
                              childBeforeTitle: true,
                              oneButton: true,
                              okButtonText: t.exit),
                        );
                      } else {
                        KheasydevNavigatePage().pushDuration(context,
                            DisplayBirthdaySuprise(category: category));
                      }
                    case CategoryEnum.wishesList:
                      KheasydevNavigatePage().pushDuration(
                          context,
                          DisplayWishesList(
                            category: category,
                            onDone: (wishesList) => onChangeCategory.call(
                                category.copyWith(wishesList: wishesList)),
                          ));
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
