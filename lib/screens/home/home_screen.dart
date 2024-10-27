import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/models/wishes_model/wishes_model.dart';
import 'package:easy_birthday/screens/owner_add_category/add_birthday_calendar_screen.dart';
import 'package:easy_birthday/screens/owner_add_category/add_birthday_suprise_screen.dart';
import 'package:easy_birthday/screens/owner_add_category/add_quiz_game_screen.dart';
import 'package:easy_birthday/screens/owner_add_category/add_wishes_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
import 'package:easy_birthday/repos/event_repo.dart';
import 'package:easy_birthday/screens/home/bloc/home_screen_bloc.dart';
import 'package:easy_birthday/screens/owner_add_category/add_pictures_videos_screen.dart';
import 'package:easy_birthday/screens/owner_add_category/add_text_screen.dart';
import 'package:easy_birthday/screens/home/inner/main_home_screens.dart/owner_home_screen.dart';
import 'package:easy_birthday/screens/home/inner/main_home_screens.dart/partner_home_screen.dart';
import 'package:easy_birthday/widgets/dialogs/choose_category_dialog.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:easy_birthday/widgets/general/side_menu_v2.dart';

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
                              HomeScreenEventAddOrEditCategory(
                                  category: category)),
                        ));
              case const (HomeScreenNavToAddText):
                final newState = state as HomeScreenNavToAddText;
                KheasydevNavigatePage().pushDuration(
                    context,
                    AddTextScreen(
                      category: newState.category,
                      onDone: (text) => bloc.add(
                          HomeScreenEventUpdateCategoryInEvent(
                              category:
                                  newState.category.copyWith(text: text))),
                    ));
              case const (HomeScreenNavToAddPictures):
                final newState = state as HomeScreenNavToAddPictures;
                KheasydevNavigatePage().pushDuration(
                    context,
                    navToPicturesVideosScreen(newState.category, bloc,
                        isImagesPicker: true));
              case const (HomeScreenNavToAddVideos):
                final newState = state as HomeScreenNavToAddVideos;
                KheasydevNavigatePage().pushDuration(
                    context,
                    navToPicturesVideosScreen(newState.category, bloc,
                        isImagesPicker: false));
              case const (HomeScreenNavToAddBirthdayCalendar):
                final newState = state as HomeScreenNavToAddBirthdayCalendar;
                KheasydevNavigatePage().pushDuration(
                    context,
                    AddBirthdayCalendarScreen(
                      category: newState.category,
                      onDone: (calendar) => bloc.add(
                          HomeScreenEventUpdateCategoryInEvent(
                              category: newState.category
                                  .copyWith(calendarEvents: calendar))),
                    ));
              case const (HomeScreenNavToAddBirthdaySuprise):
                final newState = state as HomeScreenNavToAddBirthdaySuprise;
                KheasydevNavigatePage().pushDuration(
                    context,
                    AddBirthdaySupriseScreen(
                      category: newState.category,
                      onDone: (category, widgets) => bloc.add(
                          HomeScreenEventUploadSupriseInEvent(
                              category: category, widgets: widgets)),
                    ));
              case const (HomeScreenNavToAddQuizGame):
                final newState = state as HomeScreenNavToAddQuizGame;
                KheasydevNavigatePage().pushDuration(
                    context,
                    AddQuizGameScreen(
                      category: newState.category,
                      onDone: (questions, lock) => bloc.add(
                          HomeScreenEventUpdateCategoryInEvent(
                              category: newState.category
                                  .copyWith(quizGame: questions, lock: lock))),
                    ));
              case const (HomeScreenNavToAddWishesList):
                final newState = state as HomeScreenNavToAddWishesList;
                KheasydevNavigatePage().pushDuration(
                    context,
                    AddWishesListScreen(
                      category: newState.category,
                      onDone: (text, edit) => bloc.add(
                          HomeScreenEventUpdateCategoryInEvent(
                              category: newState.category.copyWith(
                                  // ignore: prefer_const_constructors
                                  wishesList: edit
                                      ? newState.category.wishesList!
                                          .copyWith(contract: text)
                                      : WishesModel(
                                          lock: false, contract: text)))),
                      deleteWishes: () => bloc.add(
                          HomeScreenEventUpdateCategoryInEvent(
                              category: newState.category.copyWith(
                                  // ignore: prefer_const_constructors
                                  wishesList: newState.category.wishesList!
                                      .copyWith(
                                          first: null,
                                          second: null,
                                          third: null,
                                          lock: false)))),
                    ));
              case const (HomeScreenOpenEditAgain):
                final newState = state as HomeScreenOpenEditAgain;
                KheasydevNavigatePage().pop(context);
                bloc.add(HomeScreenEventAddOrEditCategory(
                    category: newState.category, edit: true));
            }
          },
          builder: (context, state) {
            final bloc = context.read<HomeScreenBloc>();
            return Scaffold(
              appBar: appAppBar(title: t.home_screen),
              drawer: appSideMenuV2(context, 'home'),
              body: state is HomeScreenLoading
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        if (state.text != null) ...[
                          const SizedBox(height: 12),
                          Text(state.text!),
                        ],
                      ],
                    ))
                  : Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: globalUser.role.isPartner()
                            ? PartnerHomeScreen(
                                onChangeCategory: (category) => bloc.add(
                                    HomeScreenEventUpdateCategoryInEvent(
                                        category: category)),
                              )
                            : const OwnerHomeScreen(),
                      ),
                    ),
              floatingActionButton: globalUser.role.isNotPartner() &&
                      state is! HomeScreenLoading
                  ? FloatingActionButton.extended(
                      onPressed: () =>
                          bloc.add(HomeScreenEventAddButtonClicked()),
                      backgroundColor: AppColors.disableColor,
                      label: Text(t.add(context: globalGender),
                          style: AppTextStyle()
                              .description
                              .copyWith(color: Colors.white)),
                      icon: const Icon(Icons.add_rounded, color: Colors.white),
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }

  AddPicturesVideosScreen navToPicturesVideosScreen(
      CategoryModel category, HomeScreenBloc bloc,
      {required bool isImagesPicker}) {
    return AddPicturesVideosScreen(
      category: category,
      isImagesPicker: isImagesPicker,
      onAddFiles: (category, files) => bloc.add(
          HomeScreenEventUploadFilesInEvent(category: category, files: files)),
      onDeleteFiles: (category, indexes) => bloc.add(
          HomeScreenEventDeleteFilesInEvent(
              category: category, filesIndexes: indexes)),
    );
  }
}
