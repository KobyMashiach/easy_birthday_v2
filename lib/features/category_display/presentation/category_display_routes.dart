import 'package:easy_birthday/core/utils/routing/fade_page.dart';
import 'package:easy_birthday/core/utils/routing/routing.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_baby_letter_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_birthday_calendar_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_birthday_surprise_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_look_alike_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_memory_game_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_milestones_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_parent_coupons_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_parent_stats_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_pictures_videos_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_quiz_game_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_text_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_time_capsule_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/display_wishes_list_page.dart';
import 'package:easy_birthday/features/category_display/presentation/pages/done_quiz_page.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> categoryDisplayRoutes = [
  GoRoute(
    path: Routing.displayText,
    name: Routing.displayText,
    pageBuilder: (context, state) {
      final extra = state.extra as ({CategoryModel category});
      return fadePage(state, DisplayTextScreen(category: extra.category));
    },
  ),
  GoRoute(
    path: Routing.displayPicturesVideos,
    name: Routing.displayPicturesVideos,
    pageBuilder: (context, state) {
      final extra = state.extra as ({CategoryModel category, bool isImages});
      return fadePage(
        state,
        DisplayPicturesVideosScreen(
          category: extra.category,
          isImages: extra.isImages,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.displayQuizGame,
    name: Routing.displayQuizGame,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(QuestionModel question, int index, int score)
                saveQuestion,
              });
      return fadePage(
        state,
        DisplayQuizGame(
          category: extra.category,
          saveQuestion: extra.saveQuestion,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.doneQuiz,
    name: Routing.doneQuiz,
    pageBuilder: (context, state) {
      final extra = state.extra as DoneQuizExtra;
      return fadePage(
        state,
        DoneQuizScreen(
          score: extra.score,
          numOfQuestions: extra.numOfQuestions,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.displayBirthdayCalendar,
    name: Routing.displayBirthdayCalendar,
    pageBuilder: (context, state) {
      final extra = state.extra as ({CategoryModel category});
      return fadePage(state, DisplayBirthdayCalendar(category: extra.category));
    },
  ),
  GoRoute(
    path: Routing.displayBirthdaySurprise,
    name: Routing.displayBirthdaySurprise,
    pageBuilder: (context, state) {
      final extra = state.extra as ({CategoryModel category});
      return fadePage(state, DisplayBirthdaySurprise(category: extra.category));
    },
  ),
  GoRoute(
    path: Routing.displayWishesList,
    name: Routing.displayWishesList,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(WishesModel wishesList) onDone,
              });
      return fadePage(
        state,
        DisplayWishesList(category: extra.category, onDone: extra.onDone),
      );
    },
  ),
  GoRoute(
    path: Routing.displayMemoryGame,
    name: Routing.displayMemoryGame,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({CategoryModel category, void Function(int score) onDone});
      return fadePage(
        state,
        DisplayMemoryGame(category: extra.category, onDone: extra.onDone),
      );
    },
  ),
  GoRoute(
    path: Routing.displayTimeCapsule,
    name: Routing.displayTimeCapsule,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(String letter) onSaveLetter,
              });
      return fadePage(
        state,
        DisplayTimeCapsule(
          category: extra.category,
          onSaveLetter: extra.onSaveLetter,
        ),
      );
    },
  ),
  GoRoute(
    path: Routing.displayParentCoupons,
    name: Routing.displayParentCoupons,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(WishesModel wishesList) onDone,
              });
      return fadePage(
        state,
        DisplayParentCoupons(category: extra.category, onDone: extra.onDone),
      );
    },
  ),
  GoRoute(
    path: Routing.displayBabyLetter,
    name: Routing.displayBabyLetter,
    pageBuilder: (context, state) {
      final extra = state.extra as ({CategoryModel category});
      return fadePage(state, DisplayBabyLetter(category: extra.category));
    },
  ),
  GoRoute(
    path: Routing.displayParentStats,
    name: Routing.displayParentStats,
    pageBuilder: (context, state) {
      final extra = state.extra as ({CategoryModel category});
      return fadePage(state, DisplayParentStats(category: extra.category));
    },
  ),
  GoRoute(
    path: Routing.displayMilestones,
    name: Routing.displayMilestones,
    pageBuilder: (context, state) {
      final extra = state.extra as ({CategoryModel category});
      return fadePage(state, DisplayMilestones(category: extra.category));
    },
  ),
  GoRoute(
    path: Routing.displayLookAlike,
    name: Routing.displayLookAlike,
    pageBuilder: (context, state) {
      final extra =
          state.extra
              as ({
                CategoryModel category,
                void Function(Map<String, String> answers) onDone,
              });
      return fadePage(
        state,
        DisplayLookAlike(category: extra.category, onDone: extra.onDone),
      );
    },
  ),
];
