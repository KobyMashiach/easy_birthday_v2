import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/screens/settings/setting_screen.dart';
import 'package:easy_birthday/widgets/cards/design/buttons/next_button.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

class ChooseAppColors extends StatefulWidget {
  bool? settings;

  ChooseAppColors({super.key, this.settings});

  @override
  State<ChooseAppColors> createState() => _ChooseAppColorsState();
}

String userColor = "";

class _ChooseAppColorsState extends State<ChooseAppColors> {
  @override
  Widget build(BuildContext context) {
    const double spaceBetween = 60;
    return Scaffold(
      appBar: appAppBar(title: 'בחר צבע'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              children: [
                const Text(
                  "בחירת צבע לאפליקציה, ניתן לשנות בהמשך",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                colorsCircles('blue'),
                const SizedBox(height: spaceBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    colorsCircles('green'),
                    const SizedBox(width: spaceBetween),
                    colorsCircles('pink'),
                  ],
                ),
                const SizedBox(height: spaceBetween),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    colorsCircles('yellow'),
                    const SizedBox(width: spaceBetween),
                    colorsCircles('red'),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: widget.settings == true
                  ? NextButton(
                      onTap: () async {
                        // updateFirestoreOnEvent(
                        //     key: 'appColor', value: userColor);
                        // await _saveAppColorLocal();
                        // KheasydevNavigatePage().pushAndRemoveUntil(context,
                        //     const BuildAppPage(2, page: SettingsScreen()));
                      },
                      icon: Icons.done,
                    )
                  : NextButton(
                      onTap: () async {
                        // updateFirestoreOnEvent(
                        //     key: 'appColor', value: userColor);
                        // await _saveAppColorLocal();
                        // KheasydevNavigatePage()
                        //     .pushWithoutContext(const ChooseAge());
                      },
                      icon: Icons.navigate_next,
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget colorsCircles(String color) {
    const double circleSize = 120;
    return InkWell(
      onTap: () {
        // setState(() {
        //   userColor = color;
        //   AppColor.updateDefaultColors(userColor: color);
        // });
      },
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: AppColor.getColorFromString(colorString: color),
        ),
      ),
    );
  }

  Future<void> _saveAppColorLocal() async {
    final box = await Hive.openBox('myBox');
    box.put('appColor', userColor);
  }
}
