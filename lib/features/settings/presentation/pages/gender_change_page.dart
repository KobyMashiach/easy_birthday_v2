import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class GenderChangeScreen extends StatefulWidget {
  final void Function((String owner, String partner) genders)
  changeGenderFunction;

  const GenderChangeScreen({super.key, required this.changeGenderFunction});

  @override
  State<GenderChangeScreen> createState() => _GenderChangeScreenState();
}

class _GenderChangeScreenState extends State<GenderChangeScreen> {
  int ownerIndex = checkIfMaleGender(SessionService().user.gender) ? 0 : 1,
      partnerIndex = SessionService().user.role.isNotPartner()
          ? checkIfMaleGender(SessionService().partner?.gender ?? "male")
                ? 0
                : 1
          : 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.choose_gender),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(t.choose_own_gender, style: AppTextStyle().title),
              chooseGenderToggle(initIndex: ownerIndex, partner: false),
              const SizedBox(height: 28),
              if (SessionService().user.role.isNotPartner()) ...[
                Text(t.choose_partner_gender, style: AppTextStyle().title),
                chooseGenderToggle(initIndex: partnerIndex, partner: true),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
        activeButtonOnTap: () {
          changeGender(male: ownerIndex == 0);
          final own = ownerIndex == 0 ? "male" : "female";
          final partn = partnerIndex == 0 ? "male" : "female";
          widget.changeGenderFunction.call((own, partn));
          context.popIfPossible();
        },
      ),
    );
  }

  ToggleSwitch chooseGenderToggle({
    required int initIndex,
    required bool partner,
  }) {
    return ToggleSwitch(
      initialLabelIndex: initIndex,
      labels: [t.male, t.female],
      onToggle: (index) {
        partner ? partnerIndex = index ?? 0 : ownerIndex = index ?? 0;
      },
      minWidth: 120.0,
      minHeight: 60,
      iconSize: 24,
      fontSize: 24,
      radiusStyle: true,
      cornerRadius: 100,
      activeFgColor: Colors.white,
      inactiveBgColor: AppColors.disableColor,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      animate: true,
      curve: Curves.decelerate,
      icons: const [Icons.male, Icons.female],
      activeBgColors: const [
        [Colors.blue],
        [Colors.pink],
      ],
    );
  }
}
