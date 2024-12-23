import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/bottom_navigation_bars/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class FirstLoginScreen extends StatelessWidget {
  const FirstLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(
          title: t.greeter(context: globalGender, name: globalUser.name)),
      drawer: appSideMenuV2(context, 'home'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                  child: Column(
                    spacing: 24,
                    children: [
                      Text("Easy Birthday", style: AppTextStyle().bigTitle),
                      SvgPicture.asset(
                        giftIllustration,
                        height: 200,
                      ),
                      Text(
                          t.greeting_first_login(
                              context: globalGender,
                              name: globalPartnerUser!.name),
                          textAlign: TextAlign.center,
                          style: AppTextStyle().description),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppButtonsBottomNavigationBar(
          oneButton: true,
          activeButtonText: t.lets_continue,
          activeButtonOnTap: () {
            context
                .read<PersonaRepo>()
                .updatePersona(globalUser.copyWith(registerComplete: true));
            KheasydevNavigatePage().push(context, const HomeScreen());
          }),
    );
  }
}
