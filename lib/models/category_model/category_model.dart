import 'package:easy_birthday/models/calendar_model/calendar_model.dart';
import 'package:easy_birthday/models/category_model/category_converters_json.dart';
import 'package:easy_birthday/models/quiz_models/question_model/question_model.dart';
import 'package:easy_birthday/models/wishes_model/wishes_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_enum.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required CategoryEnum categoryType,
    required String name,
    required String description,
    String? id,
    String? titleAppear,
    String? text,
    List<String>? urls,
    @Default(false) bool lock,
    Map<int, Map<String, String>>? supriseMap,
    @WishesConverter() WishesModel? wishesList,
    @CalendarModelConverter() CalendarModel? calendarEvents,
    @QuestionModelListConverter() List<QuestionModel>? quizGame,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
