// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:math' as math;

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/widgets/cards/design/buttons/next_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SexChange extends StatefulWidget {
  bool? settings;

  SexChange({super.key, this.settings});

  @override
  State<SexChange> createState() => _SexChangeState();
}

class _SexChangeState extends State<SexChange> {
  int ownerIndex = 0, partnerIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'בחר מין'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    // appTranslate(context, 'choose_own_sex'),
                    "TODO: own_sex",
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  chooseSex(initIndex: 0, partner: false),
                  // ToDo: add if manager user show
                  ...managerUser(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: widget.settings == true
                  ? NextButton(
                      onTap: () async {
                        changeSexTapping(context);
                      },
                      icon: Icons.done,
                    )
                  : NextButton(
                      onTap: () async {
                        changeSexTapping(context);
                      },
                      icon: Icons.navigate_next,
                    ),
            )
          ],
        ),
      ),
    );
  }

  void changeSexTapping(BuildContext context) {
    // updateFirestoreOnEvent(
    //     key: 'sexOwner', value: ownerIndex == 0 ? "זכר" : "נקבה");
    // updateFirestoreOnEvent(
    //     key: 'sexPartner', value: partnerIndex == 0 ? "זכר" : "נקבה");
    // ownerIndex == 0
    //     ? Get.updateLocale(const Locale('he'))
    //     : Get.updateLocale(const Locale('fa'));
    // KheasydevNavigatePage().pushAndRemoveUntil(
    //     context, const BuildAppPage(2, page: SettingsScreen()));
  }

  ToggleSwitch chooseSex({required int initIndex, required bool partner}) {
    return ToggleSwitch(
      minWidth: 120.0,
      minHeight: 60,
      initialLabelIndex: initIndex,
      cornerRadius: 60.0,
      activeFgColor: Colors.white,
      inactiveBgColor: AppColor.disableColor,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: const ['זכר', 'נקבה'],
      icons: const [Icons.male, Icons.female],
      iconSize: 24,
      fontSize: 20,
      activeBgColors: const [
        [Colors.blue],
        [Colors.pink]
      ],
      onToggle: (index) {
        partner ? partnerIndex = index ?? 0 : ownerIndex = index ?? 0;
      },
    );
  }

  List<Widget> managerUser() {
    return [
      const SizedBox(height: 60),
      Text(
        // appTranslate(context, 'choose_partner_sex'),
        "TODO: partner sex",
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
      chooseSex(initIndex: 1, partner: true),
      const SizedBox(height: 60),
    ];
  }
}


//Get.updateLocale(const Locale('en'))