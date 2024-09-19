import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/services/translates/slang_settings.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class GenderChangeScreen extends StatefulWidget {
  final Function((String owner, String partner)) changeGenderFunction;

  const GenderChangeScreen({super.key, required this.changeGenderFunction});

  @override
  State<GenderChangeScreen> createState() => _GenderChangeScreenState();
}

class _GenderChangeScreenState extends State<GenderChangeScreen> {
  int ownerIndex = checkIfMaleGender(globalUser.gender) ? 0 : 1,
      partnerIndex = globalUser.role.isNotPartner()
          ? checkIfMaleGender(globalPartnerUser!.gender)
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
              chooseGenderToggle(
                  initIndex: globalUser.gender == "male" ? 0 : 1,
                  partner: false),
              SizedBox(height: 28),
              if (globalUser.role.isNotPartner()) ...[
                Text(t.choose_partner_gender, style: AppTextStyle().title),
                chooseGenderToggle(initIndex: partnerIndex, partner: true)
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
          KheasydevNavigatePage().pop(context);
        },
      ),
    );
  }

  ToggleSwitch chooseGenderToggle(
      {required int initIndex, required bool partner}) {
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
        [Colors.pink]
      ],
    );
  }
}
