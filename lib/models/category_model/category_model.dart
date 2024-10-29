import 'package:hive/hive.dart'; // Add Hive package
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
  static const String hiveKey = 'CategoryModel';
  @HiveType(typeId: 104, adapterName: 'CategoryModelAdapter')
  const factory CategoryModel({
    @HiveField(0) required CategoryEnum categoryType,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) String? id,
    @HiveField(4) String? titleAppear,
    @HiveField(5) String? text,
    @HiveField(6) List<String>? urls,
    @HiveField(7) @Default(false) bool lock,
    @HiveField(8) Map<int, Map<String, String>>? supriseMap,
    @HiveField(9) @WishesConverter() WishesModel? wishesList,
    @HiveField(10) @CalendarModelConverter() CalendarModel? calendarEvents,
    @HiveField(11) @QuestionModelListConverter() List<QuestionModel>? quizGame,
    @HiveField(12) @Default(0) int quizGameScore,
    @HiveField(13) @Default("Free") String inPlan,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
