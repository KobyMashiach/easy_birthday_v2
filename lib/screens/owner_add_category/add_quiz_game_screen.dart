import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/screens/owner_add_category/quiz_game/add_question_screen.dart';
import 'package:easy_birthday/screens/owner_add_category/quiz_game/remove_question_screen.dart';
import 'package:easy_birthday/services/firebase/firestore_data.dart';
import 'package:easy_birthday/widgets/design/general/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
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
  bool lock = false, loading = false;
  List<QuestionModel> questionsList = [];

  @override
  void initState() {
    super.initState();
    questionsList = widget.category.quizGame ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.quiz_game),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...topWidgets,
                    const SizedBox(height: 24),
                    Text(t.num_of_questions(number: questionsList.length)),
                    buttons(),
                    const SizedBox(height: 24),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: questionsList.length,
                      separatorBuilder: (context, index) => kheasydevDivider(
                          black: true,
                          padding: const EdgeInsets.symmetric(vertical: 4)),
                      itemBuilder: (context, index) => ListTile(
                        title: Text(questionsList[index].text),
                        trailing: questionsList[index].imageUrl != null
                            ? imageContainer(index)
                            : null,
                      ),
                    )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {
          widget.onDone.call(questionsList);
          KheasydevNavigatePage().pop(context);
        },
      ),
    );
  }

  ConstrainedBox imageContainer(int index) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 20,
        minHeight: 20,
        maxWidth: 50,
      ),
      child: CachedNetworkImage(
        imageUrl: questionsList[index].imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.white,
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
          title: t.add_question(context: globalGender),
          icon: Icons.add,
          onTap: () => KheasydevNavigatePage().pushDuration(
            context,
            AddQuestionScreen(
              category: widget.category,
              onDone: (question, image) async =>
                  await addQuestionDone(question, image),
            ),
          ),
        ),
        buttonContainer(
          title: t.remove_question(context: globalGender),
          icon: Icons.remove,
          onTap: () => questionsList.isNotEmpty
              ? KheasydevNavigatePage().pushDuration(
                  context,
                  RemoveQuestionScreen(
                    questionsList: questionsList,
                    onDone: (indexes) {
                      indexes.sort((a, b) => b.compareTo(a));
                      setState(() {
                        for (int index in indexes) {
                          if (index >= 0 && index < questionsList.length) {
                            questionsList.removeAt(index);
                          }
                        }
                      });
                    },
                  ),
                )
              : kheasydevAppToast(t.no_questions_add),
        ),
        buttonContainer(
            icon: lock ? Icons.lock_outline : Icons.lock_open,
            title: lock ? t.lock : t.unlock,
            onTap: () => setState(() => lock = !lock)),
      ],
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

  Future<void> addQuestionDone(QuestionModel question, File? image) async {
    setState(() => loading = true);
    String? fileUrl;
    if (image != null) {
      fileUrl = await firestoreUploadMediaToStorage(
          path: "${globalEvent!.eventId}/${widget.category.id}",
          file: image,
          fileName: getRandomString(5));
    }
    setState(() {
      List<QuestionModel> modifiableList = List.from(questionsList);
      modifiableList.add(question.copyWith(imageUrl: fileUrl));
      questionsList = modifiableList;
      loading = false;
    });
  }
}
