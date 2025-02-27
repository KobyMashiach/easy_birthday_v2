import 'package:easy_birthday/screens/partner_display_screens/display_memory_game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/models/text_items_model/text_item_model.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_birthday_calendar.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_birthday_suprise.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_pictures_videos.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_quiz_game.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_text.dart';
import 'package:easy_birthday/screens/partner_display_screens/display_wishes_list.dart';
import 'package:easy_birthday/widgets/cards/category_partner_card.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';

class PartnerHomeScreen extends StatefulWidget {
  final Function(CategoryModel category) onChangeCategory;
  const PartnerHomeScreen({super.key, required this.onChangeCategory});

  @override
  State<PartnerHomeScreen> createState() => _PartnerHomeScreenState();
}

class _PartnerHomeScreenState extends State<PartnerHomeScreen> {
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
              crossAxisCount: kIsWeb ? 6 : 2,
              crossAxisSpacing: 24.0,
              mainAxisSpacing: 24.0,
              childAspectRatio: 1 / 1.6,
            ),
            itemBuilder: (context, index) {
              final category = globalEvent!.categories[index];
              return CategoryPartnerCard(
                category: category,
                onTap: () {
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
                            context,
                            DisplayQuizGame(
                              category: category,
                              saveQuestion: (question, index, score) {
                                List<QuestionModel> oldQuestions =
                                    List.from(category.quizGame ?? []);
                                oldQuestions[index] = question;
                                widget.onChangeCategory.call(category.copyWith(
                                    quizGame: oldQuestions,
                                    quizGameScore: score));
                              },
                            ));

                      case CategoryEnum.birthdayCalendar:
                        KheasydevNavigatePage().pushDuration(context,
                            DisplayBirthdayCalendar(category: category));

                      case CategoryEnum.birthdaySuprise:
                        KheasydevNavigatePage().pushDuration(context,
                            DisplayBirthdaySuprise(category: category));

                      case CategoryEnum.wishesList:
                        KheasydevNavigatePage().pushDuration(
                            context,
                            DisplayWishesList(
                              category: category,
                              onDone: (wishesList) => widget.onChangeCategory
                                  .call(category.copyWith(
                                      wishesList: wishesList)),
                            ));

                      case CategoryEnum.memoryGame:
                        KheasydevNavigatePage().pushDuration(
                            context,
                            DisplayMemoryGame(
                              category: category,
                              onDone: (score) => widget.onChangeCategory.call(
                                  category.copyWith(
                                      memoryGame: category.memoryGame!
                                          .copyWith(score: score, lock: true))),
                            ));
                    }
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
