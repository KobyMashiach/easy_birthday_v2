import 'dart:io';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_on_will_pop.dart';
import 'package:easy_birthday/core/widgets/general/side_menu_v2.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/home/presentation/bloc/home_bloc.dart';
import 'package:easy_birthday/features/home/presentation/widgets/choose_category_dialog.dart';
import 'package:easy_birthday/features/home/presentation/widgets/owner_home_view.dart';
import 'package:easy_birthday/features/home/presentation/widgets/partner_home_view.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_birthday/core/utils/routing/navigation_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc.fromContext(context)..add(const .init()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current.isOneShot,
        buildWhen: (previous, current) => !current.isOneShot,
        listener: _listener,
        builder: (context, state) {
          final bloc = context.read<HomeBloc>();
          final isLoading = state is Loading;
          final isPartner = SessionService().user.role.isPartner();
          final categories = state.event?.categories ?? const [];
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) appOnWillPop(context);
            },
            child: Scaffold(
              appBar: appAppBar(title: t.home_screen),
              drawer: appSideMenuV2(context, 'home'),
              body: switch (state) {
                Loading(:final text) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      if (text != null) ...[
                        const SizedBox(height: 12),
                        Text(text),
                      ],
                    ],
                  ),
                ),
                _ => Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: isPartner
                        ? PartnerHomeScreen(categories: categories)
                        : OwnerHomeScreen(categories: categories),
                  ),
                ),
              },
              floatingActionButton: !isPartner && !isLoading
                  ? FloatingActionButton.extended(
                      onPressed: () => bloc.add(const .addButtonClicked()),
                      backgroundColor: AppColors.disableColor,
                      label: Text(
                        t.add(context: SessionService().gender),
                        style: AppTextStyle().description.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      icon: const Icon(Icons.add_rounded, color: Colors.white),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }

  Future<void> _listener(BuildContext context, HomeState state) async {
    final bloc = context.read<HomeBloc>();
    void changeTitle(CategoryModel category) =>
        bloc.add(.changeTitle(category));

    switch (state) {
      case OpenAddDialog():
        await showDialog(
          context: context,
          builder: (context) => ChooseCategoryDialog(
            onChooseCategory: (category) =>
                bloc.add(.addOrEditCategory(category)),
          ),
        );
      case NavigateToAddText(:final category):
        context.pushNamed(
          Routing.addText,
          extra: (
            category: category,
            onChangeTitle: changeTitle,
            onDone: (CategoryModel category, String text) =>
                bloc.add(.saveText(category, text)),
          ),
        );
      case NavigateToAddPictures(:final category):
        _pushPicturesVideos(context, bloc, category, isImagesPicker: true);
      case NavigateToAddVideos(:final category):
        _pushPicturesVideos(context, bloc, category, isImagesPicker: false);
      case NavigateToAddBirthdayCalendar(:final category):
        context.pushNamed(
          Routing.addBirthdayCalendar,
          extra: (
            category: category,
            onChangeTitle: changeTitle,
            onDone: (CategoryModel category, CalendarModel calendar) =>
                bloc.add(.saveCalendar(category, calendar)),
          ),
        );
      case NavigateToAddBirthdaySurprise(:final category):
        context.pushNamed(
          Routing.addBirthdaySurprise,
          extra: (
            category: category,
            onChangeTitle: changeTitle,
            onDone: (CategoryModel category, List<Widget> widgets) =>
                bloc.add(.uploadSurprise(category, widgets)),
          ),
        );
      case NavigateToAddQuizGame(:final category):
        context.pushNamed(
          Routing.addQuizGame,
          extra: (
            category: category,
            onChangeTitle: changeTitle,
            onDone: (List<QuestionModel> questions, bool lock) =>
                bloc.add(.saveQuiz(category, questions, lock)),
          ),
        );
      case NavigateToAddWishesList(:final category):
        context.pushNamed(
          Routing.addWishesList,
          extra: (
            category: category,
            onChangeTitle: changeTitle,
            onDone: (CategoryModel category, String text, bool edit) =>
                bloc.add(.saveWishesContract(category, text, edit: edit)),
            deleteWishes: () => bloc.add(.resetWishes(category)),
          ),
        );
      case NavigateToAddMemoryGame(:final category):
        context.pushNamed(
          Routing.addMemoryGame,
          extra: (
            category: category,
            onChangeTitle: changeTitle,
            onDone:
                (
                  CategoryModel category,
                  List<String> keptUrls,
                  List<File> newFiles,
                ) => bloc.add(
                  .saveMemoryGameImages(category, keptUrls, newFiles),
                ),
            openMemoryAgain: () => bloc.add(.resetMemoryGame(category)),
          ),
        );
      case ErrorMessage(:final errorType):
        kheasydevAppToast(switch (errorType) {
          // A category write found it deleted meanwhile (on the other phone).
          AppErrorType.notFound => t.category_deleted,
          _ => t.operation_not_allowed,
        });
      case OpenEditAgain(:final category):
        // The editor may already be closed: never maybePop here, home's
        // PopScope would show the exit dialog.
        context.popIfPossible();
        bloc.add(.addOrEditCategory(category, edit: true));
      case Initial() || Loading() || Loaded():
        break;
    }
  }

  void _pushPicturesVideos(
    BuildContext context,
    HomeBloc bloc,
    CategoryModel category, {
    required bool isImagesPicker,
  }) {
    context.pushNamed(
      Routing.addPicturesVideos,
      extra: (
        category: category,
        onChangeTitle: (CategoryModel category) =>
            bloc.add(.changeTitle(category)),
        isImagesPicker: isImagesPicker,
        onAddFiles: (CategoryModel category, List<File> files) =>
            bloc.add(.uploadFiles(category, files)),
        onDeleteFiles: (CategoryModel category, List<int> indexes) =>
            bloc.add(.deleteFiles(category, indexes)),
      ),
    );
  }
}
