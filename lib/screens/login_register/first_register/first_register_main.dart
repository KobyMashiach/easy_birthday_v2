import 'package:easy_birthday/core/hive/app_settings_data_source.dart';
import 'package:easy_birthday/core/hive/category_model_data_source.dart';
import 'package:easy_birthday/core/hive/persona_data_source.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/repos/persona_repo.dart';
import 'package:easy_birthday/screens/home/home_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/bloc/first_register_bloc.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/add_profile_image_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/choose_app_color_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/choose_plan_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/choose_texts_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/partner_details_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/register_step_row/register_step_row.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/own_details_screen.dart';
import 'package:easy_birthday/screens/login_register/first_register/inner/explanation_screen.dart';
import 'package:easy_birthday/screens/settings/inner/build_app_page.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

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
    pageController = PageController(initialPage: 0);
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
          create: (context) => AppSettingsDataSource(),
        ),
        RepositoryProvider(
          create: (context) => PersonaRepo(context.read<PersonaDataSource>()),
        ),
        RepositoryProvider(
          create: (context) => CategoryModelDataSource(),
        ),
        RepositoryProvider(
          create: (context) => EventRepo(),
        ),
      ],
      child: BlocProvider(
        create: (context) => FirstRegisterBloc(
          personaRepo: context.read<PersonaRepo>(),
          appSettingLocalDb: context.read<AppSettingsDataSource>(),
          eventRepo: context.read<EventRepo>(),
        )..add(FirstRegisterEventInit()),
        child: BlocConsumer<FirstRegisterBloc, FirstRegisterState>(
          listenWhen: (previous, current) => current is FirstRegisterStateNav,
          buildWhen: (previous, current) => current is! FirstRegisterStateNav,
          listener: (context, state) {
            switch (state.runtimeType) {
              case const (FirstRegisterStateNavHomeScreen):
                KheasydevNavigatePage().pushAndRemoveUntil(
                    context,
                    BuildAppPage(
                      10,
                      description: t.more_few_seconds,
                      page: const HomeScreen(),
                    ));
            }
          },
          builder: (context, state) {
            return BlocBuilder<FirstRegisterBloc, FirstRegisterState>(
              builder: (context, state) {
                final bloc = context.read<FirstRegisterBloc>();
                return Scaffold(
                  appBar: appAppBar(
                    title: pageNumber == 0
                        ? t.explanation_screen_title
                        : t.first_register,
                  ),
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
                              onContinue: (persona) {
                                bloc.add(FirstRegisterEventOwnDetails(
                                    persona: persona));
                                moveNextPage();
                              },
                              onPrevious: () => movePreviousPage(),
                            ),
                            PartnerDetailsScreen(
                              onContinue: (persona) {
                                bloc.add(FirstRegisterEventPartnerDetails(
                                    persona: persona));
                                moveNextPage();
                              },
                              onPrevious: () => movePreviousPage(),
                            ),
                            ChooseAppColorScreen(
                              onContinue: (color) {
                                if (color != null) {
                                  bloc.add(FirstRegisterEventChooseColor(
                                      color: color));
                                }
                                moveNextPage();
                              },
                              onPrevious: () => movePreviousPage(),
                            ),
                            ChooseTextsScreen(
                              onContinue: (choosenTexts) {
                                bloc.add(FirstRegisterEventChooseTexts(
                                    choosenTexts: choosenTexts));
                                moveNextPage();
                              },
                              onPrevious: () => movePreviousPage(),
                            ),
                            AddProfileImageScreen(
                              onContinue: (image) {
                                bloc.add(FirstRegisterEventAddProfileImage(
                                    imageFile: image));
                                moveNextPage();
                              },
                              onPrevious: () => movePreviousPage(),
                            ),
                            ChoosePlanScreen(
                              currentPlan: state.planModel,
                              onPlanPurchase: (planTitle) => bloc.add(
                                  FirstRegisterEventPlanPurchase(
                                      planTitle: planTitle)),
                              onContinue: () =>
                                  bloc.add(FirstRegisterEventFinishRegister()),
                              onPrevious: () => movePreviousPage(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
