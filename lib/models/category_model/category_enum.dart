// Enum Definition
import 'package:easy_birthday/core/consts.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';

enum CategoryEnum {
  text,
  pictures,
  videos,
  quizGame,
  birthdayCalender,
  birthdaySuprise,
}

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
  CategoryModel(
    categoryType: CategoryEnum.birthdayCalender,
    name: t.birthday_calender,
    description: t.birthday_calender_description(context: globalGender),
  ),
  CategoryModel(
    categoryType: CategoryEnum.birthdaySuprise,
    name: t.birthday_suprise,
    description: t.birthday_suprise_description(context: globalGender),
  ),
];

extension CategoryEnumX on CategoryEnum {
  String getImage() {
    return switch (this) {
      CategoryEnum.text => readTextIllustration,
      CategoryEnum.pictures => albumIllustration,
      CategoryEnum.videos => videosIllustration,
      CategoryEnum.quizGame => quizIllustration,
      CategoryEnum.birthdayCalender => calenderIllustration,
      CategoryEnum.birthdaySuprise => supriseIllustration,
    };
  }
}
