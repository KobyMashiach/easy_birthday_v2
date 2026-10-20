import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/design_kit/app_toast.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/onboarding/presentation/bloc/first_register_bloc.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/steps/add_profile_image_step.dart';
import 'package:easy_birthday/features/onboarding/presentation/pages/choose_app_color_page.dart';
import 'package:easy_birthday/features/onboarding/presentation/pages/choose_plan_page.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/steps/choose_texts_step.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/steps/explanation_step.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/steps/own_details_step.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/steps/partner_details_step.dart';
import 'package:easy_birthday/features/onboarding/presentation/widgets/register_step_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FirstRegisterMain extends StatefulWidget {
  const FirstRegisterMain({super.key});

  @override
  State<FirstRegisterMain> createState() => _FirstRegisterMainState();
}

class _FirstRegisterMainState extends State<FirstRegisterMain> {
  static const int _partnerPage = 2;

  final PageController pageController = PageController();
  int pageNumber = 0;

  /// A step is changing; taps meanwhile (double taps) are ignored so a step's
  /// data is sent once and [pageNumber] stays in sync with the page shown.
  bool _turning = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> _goToPage(int page, [VoidCallback? onLeave]) async {
    if (_turning || page == pageNumber) return;
    _turning = true;
    onLeave?.call();
    setState(() => pageNumber = page);
    try {
      await pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } finally {
      _turning = false;
    }
  }

  /// Even while a step is changing: the partner's phone must be fixed first.
  void _backToPartnerStep() {
    if (pageNumber <= _partnerPage) return;
    setState(() => pageNumber = _partnerPage);
    pageController.animateToPage(
      _partnerPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  /// Runs [onLeave] (sends the step's data) and shows the next step.
  void moveNextPage([VoidCallback? onLeave]) =>
      _goToPage(pageNumber + 1, onLeave);

  void movePreviousPage() => _goToPage(pageNumber - 1);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FirstRegisterBloc.fromContext(context)..add(const .init()),
      child: BlocConsumer<FirstRegisterBloc, FirstRegisterState>(
        listenWhen: (_, current) => current.isOneShot,
        buildWhen: (_, current) => !current.isOneShot,
        listener: (context, state) {
          switch (state) {
            case NavigateToHome():
              context.goNamed(
                Routing.buildApp,
                extra: (loadingTime: 10, description: t.more_few_seconds),
              );
            case ErrorMessage():
              kheasydevAppToast(t.something_went_wrong);
            case PartnerPhoneTaken():
              kheasydevAppToast(t.partner_phone_taken);
              _backToPartnerStep();
            case Initial() || Loaded():
              break;
          }
        },
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
                      ExplanationScreen(onContinue: moveNextPage),
                      OwnDetailsScreen(
                        onContinue: (persona) {
                          moveNextPage(
                            () => bloc.add(.saveOwnDetails(persona)),
                          );
                        },
                        onPrevious: movePreviousPage,
                      ),
                      PartnerDetailsScreen(
                        onContinue: (persona) {
                          moveNextPage(
                            () => bloc.add(.savePartnerDetails(persona)),
                          );
                        },
                        onPrevious: movePreviousPage,
                      ),
                      ChooseAppColorScreen(
                        onContinue: (color) {
                          moveNextPage(() {
                            if (color != null) bloc.add(.chooseColor(color));
                          });
                        },
                        onPrevious: movePreviousPage,
                      ),
                      ChooseTextsScreen(
                        onContinue: (chosenTexts) {
                          moveNextPage(
                            () => bloc.add(.chooseTexts(chosenTexts)),
                          );
                        },
                        onPrevious: movePreviousPage,
                      ),
                      AddProfileImageScreen(
                        onContinue: (image) {
                          moveNextPage(() => bloc.add(.addProfileImage(image)));
                        },
                        onPrevious: movePreviousPage,
                      ),
                      ChoosePlanScreen(
                        currentPlan: state.planModel,
                        // The store can report the purchase after the wizard
                        // is gone, so never add to a closed bloc.
                        onPlanPurchase: (planTitle) {
                          if (bloc.isClosed) return;
                          bloc.add(.purchasePlan(planTitle));
                        },
                        onContinue: () => bloc.add(const .finishRegister()),
                        onPrevious: movePreviousPage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
