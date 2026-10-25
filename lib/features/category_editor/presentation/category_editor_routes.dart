import 'dart:io';

import 'package:easy_birthday/core/utils/routing/fade_page.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_baby_letter_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_birthday_calendar_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_birthday_surprise_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_look_alike_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_memory_game_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_milestones_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_parent_stats_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_pictures_videos_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_quiz_game_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_text_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_time_capsule_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/add_wishes_list_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/generate_greeting_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/quiz/add_question_page.dart';
import 'package:easy_birthday/features/category_editor/presentation/pages/quiz/remove_question_page.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/milestone_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> categoryEditorRoutes = [
  GoRoute(
    path: Routing.addText,
    name: Routing.addText,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(CategoryModel category, String text) onDone,
              });
      return fadePage(
        state,
        AddTextScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.generateGreeting,
    name: Routing.generateGreeting,
    builder: (context, state) {
      final extra =
          state.extra
              as ({void Function(String? generateText) generateGreeting});
      return GenerateGreeting(generateGreeting: extra.generateGreeting);
    },
  ),
  GoRoute(
    path: Routing.addPicturesVideos,
    name: Routing.addPicturesVideos,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                bool isImagesPicker,
                void Function(CategoryModel category, List<File> files)
                onAddFiles,
                void Function(CategoryModel category, List<int> indexes)
                onDeleteFiles,
              });
      return fadePage(
        state,
        AddPicturesVideosScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          isImagesPicker: extra.isImagesPicker,
          onAddFiles: extra.onAddFiles,
          onDeleteFiles: extra.onDeleteFiles,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addQuizGame,
    name: Routing.addQuizGame,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(List<QuestionModel> questions, bool lock) onDone,
                VoidCallback openQuizAgain,
              });
      return fadePage(
        state,
        AddQuizGameScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
          openQuizAgain: extra.openQuizAgain,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addQuestion,
    name: Routing.addQuestion,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(QuestionModel question, File? image) onDone,
              });
      return fadePage(
        state,
        AddQuestionScreen(category: extra.category, onDone: extra.onDone),
      );
    },
  ),
  GoRoute(
    path: Routing.removeQuestions,
    name: Routing.removeQuestions,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                List<QuestionModel> questionsList,
                void Function(List<int> indexes) onDone,
              });
      return fadePage(
        state,
        RemoveQuestionScreen(
          questionsList: extra.questionsList,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addBirthdayCalendar,
    name: Routing.addBirthdayCalendar,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(CategoryModel category, CalendarModel calendar)
                onDone,
              });
      return fadePage(
        state,
        AddBirthdayCalendarScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addBirthdaySurprise,
    name: Routing.addBirthdaySurprise,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(CategoryModel category, List<Widget> widgets)
                onDone,
              });
      return fadePage(
        state,
        AddBirthdaySurpriseScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addWishesList,
    name: Routing.addWishesList,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(CategoryModel category, String text, bool edit)
                onDone,
                VoidCallback deleteWishes,
              });
      return fadePage(
        state,
        AddWishesListScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
          deleteWishes: extra.deleteWishes,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addMemoryGame,
    name: Routing.addMemoryGame,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(
                  CategoryModel category,
                  List<String> keptUrls,
                  List<File> newFiles,
                )
                onDone,
                VoidCallback openMemoryAgain,
              });
      return fadePage(
        state,
        AddImagesMemoryGame(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
          openMemoryAgain: extra.openMemoryAgain,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addTimeCapsule,
    name: Routing.addTimeCapsule,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(
                  CategoryModel category,
                  String letter,
                  DateTime openDate,
                )
                onDone,
              });
      return fadePage(
        state,
        AddTimeCapsuleScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addBabyLetter,
    name: Routing.addBabyLetter,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(CategoryModel category, String text) onDone,
              });
      return fadePage(
        state,
        AddBabyLetterScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addParentStats,
    name: Routing.addParentStats,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(
                  CategoryModel category,
                  Map<String, double> stats,
                )
                onDone,
              });
      return fadePage(
        state,
        AddParentStatsScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addMilestones,
    name: Routing.addMilestones,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(
                  CategoryModel category,
                  List<(MilestoneModel milestone, File? image)> milestones,
                )
                onDone,
              });
      return fadePage(
        state,
        AddMilestonesScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.addLookAlike,
    name: Routing.addLookAlike,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(CategoryModel category) onChangeTitle,
                void Function(
                  CategoryModel category,
                  Map<String, String> ownerAnswers,
                  Map<String, File> childImages,
                  File? ownerImage,
                  File? partnerImage,
                )
                onDone,
                VoidCallback onReset,
              });
      return fadePage(
        state,
        AddLookAlikeScreen(
          category: extra.category,
          onChangeTitle: extra.onChangeTitle,
          onDone: extra.onDone,
          onReset: extra.onReset,
        ),
      );
    },
  ),
];
