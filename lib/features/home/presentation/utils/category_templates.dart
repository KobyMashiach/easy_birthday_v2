import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/gender_utils.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';

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

/// Categories shown with a "new" badge in the add dialog.
const Set<CategoryEnum> newCategoryTypes = {
  CategoryEnum.timeCapsule,
  CategoryEnum.parentCoupons,
  CategoryEnum.babyLetter,
  CategoryEnum.parentStats,
  CategoryEnum.milestones,
  CategoryEnum.lookAlike,
};

/// Family categories: (type, the youngest age in years they no longer fit,
/// null for any age, whether the category is about one child).
const List<(CategoryEnum type, int? underYears, bool perChild)> _familyRules = [
  (CategoryEnum.babyLetter, 4, true),
  (CategoryEnum.parentStats, 4, true),
  (CategoryEnum.milestones, 6, true),
  (CategoryEnum.lookAlike, null, true),
  (CategoryEnum.timeCapsule, null, true),
  (CategoryEnum.parentCoupons, null, false),
];

/// The children [type] fits (all children for a category that isn't about
/// one child). Empty when the category is locked; non-family types fit none.
List<ChildModel> eligibleChildren(
  CategoryEnum type,
  List<ChildModel> children, [
  DateTime? now,
]) {
  for (final (ruleType, underYears, _) in _familyRules) {
    if (ruleType != type) continue;
    return [
      for (final child in children)
        if (underYears == null || child.yearsOld(now) < underYears) child,
    ];
  }
  return const [];
}

/// Whether a [type] category is about one child (it then stores `childId`).
bool isPerChildCategory(CategoryEnum type) => _familyRules.any(
  (rule) => rule.$1 == type && rule.$3,
);

/// The family categories [children] unlock, in display order.
List<CategoryModel> familyCategoriesList(List<ChildModel> children) {
  final gender = SessionService().gender;
  return [
    for (final (type, _, _) in _familyRules)
      if (eligibleChildren(type, children).isNotEmpty)
        CategoryModel(
          categoryType: type,
          name: _familyName(type),
          description: _familyDescription(type, gender),
        ),
  ];
}

String _familyName(CategoryEnum type) => switch (type) {
  CategoryEnum.timeCapsule => t.time_capsule,
  CategoryEnum.parentCoupons => t.parent_coupons,
  CategoryEnum.babyLetter => t.baby_letter,
  CategoryEnum.parentStats => t.parent_stats,
  CategoryEnum.milestones => t.milestones,
  CategoryEnum.lookAlike => t.look_alike,
  _ => '',
};

String _familyDescription(CategoryEnum type, GenderContext gender) =>
    switch (type) {
      CategoryEnum.timeCapsule => t.time_capsule_description(context: gender),
      CategoryEnum.parentCoupons => t.parent_coupons_description(
        context: gender,
      ),
      CategoryEnum.babyLetter => t.baby_letter_description(context: gender),
      CategoryEnum.parentStats => t.parent_stats_description(context: gender),
      CategoryEnum.milestones => t.milestones_description(context: gender),
      CategoryEnum.lookAlike => t.look_alike_description(context: gender),
      _ => '',
    };

/// A suggested title for a new [type] category: couple categories speak
/// to the partner, family ones name [children].
String suggestedCategoryTitle(CategoryEnum type, List<ChildModel> children) {
  final String name = joinNames(children);
  final String partner = SessionService().partner?.name ?? '';
  return switch (type) {
    CategoryEnum.text => t.title_text(name: partner),
    CategoryEnum.pictures => t.title_pictures,
    CategoryEnum.videos => t.title_videos,
    CategoryEnum.quizGame => t.title_quiz(context: getPartnerGender()),
    CategoryEnum.birthdayCalendar => t.title_calendar(name: partner),
    CategoryEnum.birthdaySuprise => t.title_surprise(name: partner),
    CategoryEnum.wishesList => t.title_wishes(name: partner),
    CategoryEnum.memoryGame => t.title_memory,
    CategoryEnum.timeCapsule => t.time_capsule_title(name: name),
    CategoryEnum.parentCoupons => t.parent_coupons,
    CategoryEnum.babyLetter => t.baby_letter_title(name: name),
    CategoryEnum.parentStats => t.parent_stats_title(name: name),
    CategoryEnum.milestones => t.milestones_title(name: name),
    CategoryEnum.lookAlike => t.look_alike_title(name: name),
  };
}

/// The children [category] is about that still exist, oldest first.
List<ChildModel> childrenOf(CategoryModel category) =>
    SessionService().event?.childrenByIds(category.childIds) ?? const [];
