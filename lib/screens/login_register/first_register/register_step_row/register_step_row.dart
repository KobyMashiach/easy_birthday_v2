import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/screens/login_register/first_register/register_step_row/circle_with_child.dart';
import 'package:flutter/material.dart';

class RegisterStepRow extends StatelessWidget {
  final int index;
  const RegisterStepRow(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    const circleIcon = CircleWithChild(child: Icon(Icons.circle));
    const checkIcon =
        CircleWithChild(fillColor: true, child: Icon(Icons.check));
    const textSecondChild = CircleWithChild(child: Text("2"));
    const textThirdChild = CircleWithChild(child: Text("3"));
    const textFourthChild = CircleWithChild(child: Text("4"));
    const textFifthChild = CircleWithChild(child: Text("5"));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          index == 0 ? circleIcon : checkIcon,
          const SizedBox(width: 4),
          rowDivider(),
          index == 0
              ? textSecondChild
              : index == 1
                  ? circleIcon
                  : checkIcon,
          const SizedBox(width: 4),
          rowDivider(),
          index < 2
              ? textThirdChild
              : index == 2
                  ? circleIcon
                  : checkIcon,
          const SizedBox(width: 4),
          rowDivider(),
          index < 3
              ? textFourthChild
              : index == 3
                  ? circleIcon
                  : checkIcon,
          const SizedBox(width: 4),
          rowDivider(),
          index < 4
              ? textFifthChild
              : index == 4
                  ? circleIcon
                  : checkIcon,
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  Expanded rowDivider() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyDisableColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            height: 1.5),
      ),
    );
  }
}
