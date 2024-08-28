import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SexChange extends StatefulWidget {
  final bool? settings;

  const SexChange({super.key, this.settings});

  @override
  State<SexChange> createState() => _SexChangeState();
}

class _SexChangeState extends State<SexChange> {
  int ownerIndex = 0, partnerIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.choose_sex),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(t.choose_own_sex, style: AppTextStyle().title),
              chooseSexToggle(initIndex: 0, partner: false),
              SizedBox(height: 28),
              Text(t.choose_partner_sex, style: AppTextStyle().title),
              chooseSexToggle(initIndex: 0, partner: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
          // oneButton: true,
          ),
    );
  }

  ToggleSwitch chooseSexToggle(
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
