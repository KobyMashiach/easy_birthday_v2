import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/choose_app_color_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/choose_plan_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/choose_texts_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/partner_details_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/register_step_row/register_step_row.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/own_details_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/explanation_screen.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstRegisterMain extends StatefulWidget {
  const FirstRegisterMain({super.key});

  @override
  State<FirstRegisterMain> createState() => _FirstRegisterMainState();
}

class _FirstRegisterMainState extends State<FirstRegisterMain> {
  late PageController pageController;
  int pageNumber = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 5);
  }

  moveNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    setState(() => pageNumber++);
  }

  movePreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    setState(() => pageNumber--);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PersonaDataSource(),
        ),
        RepositoryProvider(
          create: (context) => PersonaRepo(context.read<PersonaDataSource>()),
        ),
      ],
      child: Scaffold(
        appBar: appAppBar(
            title: pageNumber == 0
                ? t.explanation_screen_title
                : t.first_register),
        body: Column(
          children: [
            const SizedBox(height: 24),
            RegisterStepRow(pageNumber),
            const SizedBox(height: 24),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ExplanationScreen(
                    onContinue: () => moveNextPage(),
                  ),
                  OwnDetailsScreen(
                    onContinue: () => moveNextPage(),
                    onPrevious: () => movePreviousPage(),
                  ),
                  PartnerDetailsScreen(
                    onContinue: () => moveNextPage(),
                    onPrevious: () => movePreviousPage(),
                  ),
                  ChooseAppColorScreen(
                    onContinue: () => moveNextPage(),
                    onPrevious: () => movePreviousPage(),
                  ),
                  ChooseTextsScreen(
                    onContinue: () => moveNextPage(),
                    onPrevious: () => movePreviousPage(),
                  ),
                  ChoosePlanScreen(
                    onContinue: () {},
                    onPrevious: () => movePreviousPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
