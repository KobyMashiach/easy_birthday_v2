import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/screens/home/bloc/home_screen_bloc.dart';
import 'package:easy_birthday/widgets/dialogs/choose_category_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            }
          },
          builder: (context, state) {
            final bloc = context.read<HomeScreenBloc>();

            return Scaffold(
              appBar: appAppBar(title: t.home_screen),
              drawer: appSideMenuV2(context, 'home'),
              body: Column(
                children: [],
              ),
              floatingActionButton: globalUser.role.isNotPartner()
                  ? FloatingActionButton.extended(
                      onPressed: () =>
                          bloc.add(HomeScreenEventAddButtonClicked()),
                      backgroundColor: AppColors.primaryColor,
                      label: Text(t.add(context: globalGender),
                          style: AppTextStyle().description),
                      icon: Icon(Icons.add_rounded),
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}
