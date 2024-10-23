import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/screens/owner_add_category/quiz_game/add_question_screen.dart';
import 'package:easy_birthday/screens/owner_add_category/quiz_game/remove_question_screen.dart';
import 'package:easy_birthday/widgets/design/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class AddQuizGameScreen extends StatefulWidget {
  final CategoryModel category;
  final Function(List<QuestionModel> questions) onDone;
  const AddQuizGameScreen(
      {super.key, required this.category, required this.onDone});

  @override
  State<AddQuizGameScreen> createState() => _AddQuizGameScreenState();
}

class _AddQuizGameScreenState extends State<AddQuizGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.write_contract),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...topWidgets,
              const SizedBox(height: 24),
              Text(t.num_of_questions(number: widget.category.quizGame ?? 0)),
              const SizedBox(height: 24),
              appButton(
                text: t.add_question(context: globalGender),
                onTap: () => KheasydevNavigatePage().pushDuration(
                    context,
                    AddQuestionScreen(
                      category: widget.category,
                      onDone: (question, image) {},
                    )),
              ),
              const SizedBox(height: 12),
              appButton(
                text: t.remove_question(context: globalGender),
                onTap: () => KheasydevNavigatePage().pushDuration(
                    context,
                    RemoveQuestionScreen(
                      category: widget.category,
                      onDone: (questions) {},
                    )),
              ),
              const SizedBox(height: 12),
              appButton(
                text: t.show_questions,
                unfillColors: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {},
      ),
    );
  }

  List<Widget> get topWidgets {
    return [
      Text(t.quiz_game, style: AppTextStyle().bigTitle),
      SvgPicture.asset(widget.category.categoryType.getImage(), height: 200),
      Text(
        t.add_quiz_to(title: widget.category.titleAppear!),
        style: AppTextStyle().title,
        textAlign: TextAlign.center,
      ),
    ];
  }
}
