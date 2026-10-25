import 'package:easy_birthday/features/event/data/models/calendar_model.dart';
import 'package:easy_birthday/features/event/data/models/look_alike_model.dart';
import 'package:easy_birthday/features/event/data/models/memory_game_model.dart';
import 'package:easy_birthday/features/event/data/models/milestone_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/models/time_capsule_model.dart';
import 'package:easy_birthday/features/event/data/models/wishes_model.dart';
import 'package:json_annotation/json_annotation.dart';

class WishesConverter
    implements JsonConverter<WishesModel, Map<String, dynamic>> {
  const WishesConverter();

  @override
  WishesModel fromJson(Map<String, dynamic> json) {
    return WishesModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(WishesModel wishes) {
    return wishes.toJson();
  }
}

class CalendarModelConverter
    implements JsonConverter<CalendarModel, Map<String, dynamic>> {
  const CalendarModelConverter();

  @override
  CalendarModel fromJson(Map<String, dynamic> json) {
    return CalendarModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CalendarModel calendarModel) {
    return calendarModel.toJson();
  }
}

class QuestionModelListConverter
    implements JsonConverter<List<QuestionModel>, List<dynamic>> {
  const QuestionModelListConverter();

  @override
  List<QuestionModel> fromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => QuestionModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  List<dynamic> toJson(List<QuestionModel> questionModels) {
    return questionModels
        .map((questionModel) => questionModel.toJson())
        .toList();
  }
}

class MemoryConverter
    implements JsonConverter<MemoryGameModel, Map<String, dynamic>> {
  const MemoryConverter();

  @override
  MemoryGameModel fromJson(Map<String, dynamic> json) {
    return MemoryGameModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MemoryGameModel memoryGame) {
    return memoryGame.toJson();
  }
}

class TimeCapsuleConverter
    implements JsonConverter<TimeCapsuleModel, Map<String, dynamic>> {
  const TimeCapsuleConverter();

  @override
  TimeCapsuleModel fromJson(Map<String, dynamic> json) {
    return TimeCapsuleModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TimeCapsuleModel timeCapsule) {
    return timeCapsule.toJson();
  }
}

class MilestoneListConverter
    implements JsonConverter<List<MilestoneModel>, List<dynamic>> {
  const MilestoneListConverter();

  @override
  List<MilestoneModel> fromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => MilestoneModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  List<dynamic> toJson(List<MilestoneModel> milestones) {
    return milestones.map((milestone) => milestone.toJson()).toList();
  }
}

class LookAlikeConverter
    implements JsonConverter<LookAlikeModel, Map<String, dynamic>> {
  const LookAlikeConverter();

  @override
  LookAlikeModel fromJson(Map<String, dynamic> json) {
    return LookAlikeModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LookAlikeModel lookAlike) {
    return lookAlike.toJson();
  }
}
