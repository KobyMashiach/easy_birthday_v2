import 'package:easy_birthday/core/constants/app_constants.dart';

enum CategoryEnum {
  text,
  pictures,
  videos,
  quizGame,
  birthdayCalendar,
  birthdaySuprise,
  wishesList,
  memoryGame,
}

/// The category's illustration asset.
extension CategoryEnumX on CategoryEnum {
  String getImage() {
    return switch (this) {
      CategoryEnum.text => readTextIllustration,
      CategoryEnum.pictures => albumIllustration,
      CategoryEnum.videos => videosIllustration,
      CategoryEnum.quizGame => quizIllustration,
      CategoryEnum.birthdayCalendar => calendarIllustration,
      CategoryEnum.birthdaySuprise => surpriseIllustration,
      CategoryEnum.wishesList => wishIllustrations,
      CategoryEnum.memoryGame => memoryIllustrations,
    };
  }
}
