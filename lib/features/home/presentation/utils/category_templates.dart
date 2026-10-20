import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';

/// The categories the owner can add, with their display name and description.
/// Built on every access so names follow the current language/gender, and
/// never crashes when the partner hasn't been loaded yet.
List<CategoryModel> get categoriesList {
  final gender = SessionService().gender;
  return [
    CategoryModel(
      categoryType: CategoryEnum.text,
      name: t.text,
      description: t.text_description(context: gender),
    ),
    CategoryModel(
      categoryType: CategoryEnum.pictures,
      name: t.pictures,
      description: t.pictures_description(context: gender),
    ),
    CategoryModel(
      categoryType: CategoryEnum.videos,
      name: t.videos,
      description: t.videos_description(context: gender),
      inPlan: "Standard",
    ),
    CategoryModel(
      categoryType: CategoryEnum.quizGame,
      name: t.quiz_game,
      description: t.quiz_game_description(context: gender),
      inPlan: "Platinum",
    ),
    CategoryModel(
      categoryType: CategoryEnum.birthdayCalendar,
      name: t.birthday_calendar,
      description: t.birthday_calendar_description(context: gender),
      inPlan: "Platinum",
    ),
    CategoryModel(
      categoryType: CategoryEnum.birthdaySuprise,
      name: t.birthday_suprise,
      description: t.birthday_suprise_description(context: gender),
      inPlan: "Standard",
    ),
    CategoryModel(
      categoryType: CategoryEnum.wishesList,
      name: t.wishes_list,
      description: t.wishes_list_description(
        context: gender,
        name: SessionService().partner?.name ?? '',
      ),
      inPlan: "Standard",
    ),
    CategoryModel(
      categoryType: CategoryEnum.memoryGame,
      name: t.memory_game,
      description: t.memory_game_description(context: gender),
      inPlan: "Standard",
    ),
  ];
}
