import 'package:easy_birthday/models/calendar_model/calendar_model.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/models/wishes_model/wishes_model.dart'; // Use correct case
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
