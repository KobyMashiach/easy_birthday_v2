import 'package:easy_birthday/models/quiz_models/option_model/option_model.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';

import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  final QuestionModel question;
  final ValueChanged<OptionModel> onClickedOption;
  const OptionsWidget({
    super.key,
    required this.question,
    required this.onClickedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: question.options
            .map((option) => buildOption(context, option))
            .toList());
  }

  Widget buildOption(BuildContext context, OptionModel option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.text, style: const TextStyle(fontSize: 20)),
            getIconForOption(option, question),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(OptionModel option, QuestionModel question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(OptionModel option, QuestionModel question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red);
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: Colors.green);
      }
    }
    return const SizedBox.shrink();
  }
}
