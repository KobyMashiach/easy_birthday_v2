import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class RemoveQuestionScreen extends StatefulWidget {
  final List<QuestionModel> questionsList;
  final void Function(List<int> indexes) onDone;

  const RemoveQuestionScreen({
    super.key,
    required this.questionsList,
    required this.onDone,
  });

  @override
  State<RemoveQuestionScreen> createState() => _RemoveQuestionScreenState();
}

class _RemoveQuestionScreenState extends State<RemoveQuestionScreen> {
  late List<bool> checkBoxes;

  @override
  void initState() {
    super.initState();
    checkBoxes = List.generate(widget.questionsList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(
        title: t.remove_question(context: SessionService().gender),
      ),
      body: PopScope(
        canPop: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  t.choose_question_delete(context: SessionService().gender),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.50,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.questionsList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) => listViewBuilder(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        // The PopScope above blocks maybePop (the default cancel action).
        inactiveButtonOnTap: () {
          context.popIfPossible();
        },
        activeButtonOnTap: () {
          final List<int> trueIndexes = checkBoxes
              .asMap()
              .entries
              .where((entry) => entry.value == true)
              .map((entry) => entry.key)
              .toList();
          if (trueIndexes.isEmpty) {
            kheasydevAppToast(t.mark_least_one_question);
          } else {
            widget.onDone.call(trueIndexes);
            context.popIfPossible();
          }
        },
      ),
    );
  }

  Row listViewBuilder(int index) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Checkbox(
            value: checkBoxes[index],
            activeColor: AppColors.primaryColor,
            onChanged: (value) => setState(() {
              checkBoxes[index] = !checkBoxes[index];
            }),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            padding: const EdgeInsets.all(4),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(widget.questionsList.elementAt(index).text),
          ),
        ),
      ],
    );
  }
}
