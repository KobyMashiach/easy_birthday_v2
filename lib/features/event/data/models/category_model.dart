// ignore_for_file: invalid_annotation_target

import 'package:easy_birthday/features/event/data/models/memory_game_model.dart';
import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/category_converters_json.dart';
import 'package:easy_birthday/features/event/data/models/look_alike_model.dart';
import 'package:easy_birthday/features/event/data/models/milestone_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/time_capsule_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_enum.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
sealed class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required CategoryEnum categoryType,
    required String name,
    required String description,
    String? id,
    String? titleAppear,
    String? text,
    List<String>? urls,
    @Default(false) bool lock,
    // Stored under the original (misspelled) key in Firestore.
    @JsonKey(name: 'supriseMap') Map<int, Map<String, String>>? surpriseMap,
    @WishesConverter() WishesModel? wishesList,
    @CalendarModelConverter() CalendarModel? calendarEvents,
    @QuestionModelListConverter() List<QuestionModel>? quizGame,
    @Default(0) int quizGameScore,
    @Default("Free") String inPlan,
    @MemoryConverter() MemoryGameModel? memoryGame,

    /// The children a family category is about (`EventModel.children`).
    @Default([]) List<String> childIds,
    @TimeCapsuleConverter() TimeCapsuleModel? timeCapsule,

    /// Daily averages by `ParentStat.name`.
    Map<String, double>? parentStats,
    @MilestoneListConverter() List<MilestoneModel>? milestones,
    @LookAlikeConverter() LookAlikeModel? lookAlike,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  /// The owner's custom title, or the category type's default name.
  String get displayTitle => titleAppear ?? name;
}
