// Enum Definition
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';

enum CategoryEnum { text, pictures, videos, quizGame }

List<CategoryModel> categoriesList = [
  CategoryModel(
    categoryType: CategoryEnum.text,
    name: t.text,
    description: t.text_description(context: globalGender),
  ),
  CategoryModel(
    categoryType: CategoryEnum.pictures,
    name: t.pictures,
    description: t.pictures_description(context: globalGender),
  ),
  CategoryModel(
    categoryType: CategoryEnum.videos,
    name: t.videos,
    description: t.videos_description(context: globalGender),
  ),
  CategoryModel(
    categoryType: CategoryEnum.quizGame,
    name: t.quiz_game,
    description: t.quiz_game_description(context: globalGender),
  ),
];

// Map<CategoryEnum, CategoryModel> categoriesMap = {
//   CategoryEnum.text: CategoryModel(
//     categoryType: CategoryEnum.text,
//     name: t.text,
//     description: t.text_description(context: globalGender),
//   ),
//   CategoryEnum.pictures: CategoryModel(
//     categoryType: CategoryEnum.pictures,
//     name: t.pictures,
//     description: t.pictures_description(context: globalGender),
//   ),
//   CategoryEnum.videos: CategoryModel(
//     categoryType: CategoryEnum.videos,
//     name: t.videos,
//     description: t.videos_description(context: globalGender),
//   ),
//   CategoryEnum.quizGame: CategoryModel(
//     categoryType: CategoryEnum.quizGame,
//     name: t.quiz_game,
//     description: t.quiz_game_description(context: globalGender),
//   ),
// };
