import 'package:easy_birthday/core/constants/app_constants.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/general/app_buttons_bottom_navigation_bar.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/side_menu_v2.dart';
import 'package:easy_birthday/features/auth/presentation/bloc/first_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FirstLoginScreen extends StatelessWidget {
  const FirstLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstLoginBloc.fromContext(context),
      child: BlocListener<FirstLoginBloc, FirstLoginState>(
        listenWhen: (_, current) => current.isOneShot,
        listener: (context, _) => context.goNamed(Routing.home),
        child: Builder(
          builder: (context) => Scaffold(
            appBar: appAppBar(
              title: t.greeter(
                context: SessionService().gender,
                name: SessionService().user.name,
              ),
            ),
            drawer: appSideMenuV2(context, 'home'),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 12,
                        ),
                        child: Column(
                          spacing: 24,
                          children: [
                            Text(
                              "Easy Birthday",
                              style: AppTextStyle().bigTitle,
                            ),
                            SvgPicture.asset(giftIllustration, height: 200),
                            Text(
                              t.greeting_first_login(
                                context: SessionService().gender,
                                name: SessionService().partner?.name ?? '',
                              ),
                              textAlign: TextAlign.center,
                              style: AppTextStyle().description,
                            ),
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
              activeButtonOnTap: () =>
                  context.read<FirstLoginBloc>().add(const .continuePressed()),
            ),
          ),
        ),
      ),
    );
  }
}
