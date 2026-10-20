import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/ready_texts.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:easy_birthday/features/home/presentation/bloc/home_bloc.dart';
import 'package:easy_birthday/features/home/presentation/widgets/category_partner_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PartnerHomeScreen extends StatelessWidget {
  final List<CategoryModel> categories;
  const PartnerHomeScreen({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            getEventsString(textEnum: ReadyTextEnum.title),
            style: AppTextStyle().bigTitle,
          ),
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
              final category = categories[index];
              return CategoryPartnerCard(
                category: category,
                onTap: () {
                  if (category.lock) {
                    showDialog(
                      context: context,
                      builder: (context) => generalDialog(
                        title: t.secret_dialog(
                          context: SessionService().gender,
                          categoryName: category.displayTitle,
                          name: SessionService().partner?.name ?? '',
                        ),
                        child: SvgPicture.asset(
                          secretIllustrations,
                          height: 150,
                        ),
                        childBeforeTitle: true,
                        oneButton: true,
                        okButtonText: t.exit,
                      ),
                    );
                  } else {
                    switch (category.categoryType) {
                      case CategoryEnum.text:
                        context.pushNamed(
                          Routing.displayText,
                          extra: (category: category),
                        );
                      case CategoryEnum.pictures:
                        context.pushNamed(
                          Routing.displayPicturesVideos,
                          extra: (category: category, isImages: true),
                        );
                      case CategoryEnum.videos:
                        context.pushNamed(
                          Routing.displayPicturesVideos,
                          extra: (category: category, isImages: false),
                        );

                      case CategoryEnum.quizGame:
                        context.pushNamed(
                          Routing.displayQuizGame,
                          extra: (
                            category: category,
                            saveQuestion:
                                (
                                  QuestionModel question,
                                  int index,
                                  int score,
                                ) => bloc.add(
                                  .saveQuizAnswer(
                                    category,
                                    question,
                                    index,
                                    score,
                                  ),
                                ),
                          ),
                        );

                      case CategoryEnum.birthdayCalendar:
                        context.pushNamed(
                          Routing.displayBirthdayCalendar,
                          extra: (category: category),
                        );

                      case CategoryEnum.birthdaySuprise:
                        context.pushNamed(
                          Routing.displayBirthdaySurprise,
                          extra: (category: category),
                        );

                      case CategoryEnum.wishesList:
                        context.pushNamed(
                          Routing.displayWishesList,
                          extra: (
                            category: category,
                            onDone: (WishesModel wishesList) =>
                                bloc.add(.saveWishes(category, wishesList)),
                          ),
                        );

                      case CategoryEnum.memoryGame:
                        context.pushNamed(
                          Routing.displayMemoryGame,
                          extra: (
                            category: category,
                            onDone: (int score) =>
                                bloc.add(.saveMemoryScore(category, score)),
                          ),
                        );
                    }
                  }
                },
              );
            },
            itemCount: categories.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
