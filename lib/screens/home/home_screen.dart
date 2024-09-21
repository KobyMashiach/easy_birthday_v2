import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/screens/home/bloc/home_screen_bloc.dart';
import 'package:easy_birthday/screens/home/inner/add_category/add_text.dart';
import 'package:easy_birthday/screens/home/inner/main_home_screens.dart/owner_home_screen.dart';
import 'package:easy_birthday/screens/home/inner/main_home_screens.dart/partner_home_screen.dart';
import 'package:easy_birthday/widgets/dialogs/choose_category_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => EventRepo(),
      child: BlocProvider(
        create: (context) =>
            HomeScreenBloc(eventRepo: context.read<EventRepo>()),
        child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          listenWhen: (previous, current) => current is HomeScreenStateNavigate,
          buildWhen: (previous, current) => current is! HomeScreenStateNavigate,
          listener: (context, state) async {
            final bloc = context.read<HomeScreenBloc>();
            switch (state.runtimeType) {
              case const (HomeScreenStateOpenAddDialog):
                await showDialog(
                    context: context,
                    builder: (context) => ChooseCategoryDialog(
                          onChooseCategory: (category) => bloc.add(
                              HomeScreenEventAddNewCategory(
                                  category: category)),
                        ));
              case const (HomeScreenNavToAddText):
                final newState = state as HomeScreenNavToAddText;
                KheasydevNavigatePage().push(
                    context,
                    AddTextScreen(
                      category: newState.category,
                      onDone: (text) => bloc.add(
                          HomeScreenEventUpdateCategoryInEvent(
                              category:
                                  newState.category.copyWith(text: text))),
                    ));
            }
          },
          builder: (context, state) {
            final bloc = context.read<HomeScreenBloc>();

            return Scaffold(
              appBar: appAppBar(title: t.home_screen),
              drawer: appSideMenuV2(context, 'home'),
              body: state is HomeScreenLoading
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: globalUser.role.isPartner()
                            ? PartnerHomeScreen()
                            : OwnerHomeScreen(
                                onDoneEditText: (category, text) => bloc.add(
                                    HomeScreenEventUpdateCategoryInEvent(
                                        category:
                                            category.copyWith(text: text))),
                              ),
                      ),
                    ),
              floatingActionButton: globalUser.role.isNotPartner()
                  ? FloatingActionButton.extended(
                      onPressed: () =>
                          bloc.add(HomeScreenEventAddButtonClicked()),
                      backgroundColor: AppColors.disableColor,
                      label: Text(t.add(context: globalGender),
                          style: AppTextStyle()
                              .description
                              .copyWith(color: Colors.white)),
                      icon: Icon(Icons.add_rounded, color: Colors.white),
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}
