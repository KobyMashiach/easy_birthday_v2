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
  // Family categories: unlocked by the children set in the settings.
  timeCapsule,
  parentCoupons,
  babyLetter,
  parentStats,
  milestones,
  lookAlike,
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
      CategoryEnum.timeCapsule => secretIllustrations,
      CategoryEnum.parentCoupons => giftIllustration,
      CategoryEnum.babyLetter => writeLetterIllustration,
      CategoryEnum.parentStats => partyIllustrations,
      CategoryEnum.milestones => calendarIllustration,
      CategoryEnum.lookAlike => profileImageIllustrations,
    };
  }

  /// A coupon category is a wishes list shown as tear-off tickets.
  bool get usesWishes =>
      this == CategoryEnum.wishesList || this == CategoryEnum.parentCoupons;
}
