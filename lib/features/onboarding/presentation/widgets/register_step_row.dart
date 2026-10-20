import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/circle_with_child.dart';
import 'package:flutter/material.dart';

class RegisterStepRow extends StatelessWidget {
  const RegisterStepRow(this.index, {super.key});

  final int index;

  Expanded rowDivider() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.greyDisableColor,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          height: 1.5,
        ),
      ),
    );
  }

  static const int _stepsCount = 7;

  Widget _stepIcon(int step) {
    if (index < step) return CircleWithChild(child: Text('${step + 1}'));
    if (index == step) {
      return const CircleWithChild(child: Icon(Icons.circle));
    }
    return const CircleWithChild(fillColor: true, child: Icon(Icons.check));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int step = 0; step < _stepsCount; step++) ...[
            if (step > 0) rowDivider(),
            _stepIcon(step),
            const SizedBox(width: 4),
          ],
        ],
      ),
    );
  }
}
