import 'dart:math' as math;

import 'package:easy_birthday/core/widgets/animations/staggered_entrance.dart';
import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
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
      children: [
        for (final (index, option) in question.options.indexed)
          StaggeredEntrance(
            index: index,
            from: const Offset(0, 16),
            child: _Feedback(
              // Replays when the question locks.
              key: ValueKey(question.isLocked),
              kind: _feedbackFor(option),
              child: buildOption(context, option),
            ),
          ),
      ],
    );
  }

  _FeedbackKind _feedbackFor(OptionModel option) {
    if (!question.isLocked) return _FeedbackKind.none;
    if (option.isCorrect) return _FeedbackKind.pulse;
    return option == question.selectedOption
        ? _FeedbackKind.shake
        : _FeedbackKind.none;
  }

  Widget buildOption(BuildContext context, OptionModel option) {
    final color = getColorForOption(option, question);
    return PressableScale(
      onTap: () => onClickedOption(option),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // Grows for long answers / large text instead of overflowing.
        constraints: const BoxConstraints(minHeight: 50),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: switch (color) {
            Colors.green => Colors.green.shade50,
            Colors.red => Colors.red.shade50,
            _ => Colors.grey.shade200,
          },
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color,
            width: color == Colors.green || color == Colors.red ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(option.text, style: const TextStyle(fontSize: 20)),
            ),
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

enum _FeedbackKind { none, pulse, shake }

/// The right answer pulses, a wrong pick shakes.
class _Feedback extends StatelessWidget {
  final _FeedbackKind kind;
  final Widget child;

  const _Feedback({super.key, required this.kind, required this.child});

  @override
  Widget build(BuildContext context) {
    if (kind == _FeedbackKind.none) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      builder: (context, v, child) => switch (kind) {
        _FeedbackKind.pulse => Transform.scale(
          scale: 1 + math.sin(v * math.pi) * 0.06,
          child: child,
        ),
        _ => Transform.translate(
          offset: Offset(math.sin(v * math.pi * 6) * 8 * (1 - v), 0),
          child: child,
        ),
      },
      child: child,
    );
  }
}
