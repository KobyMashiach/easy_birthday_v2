import 'package:easy_birthday/models/quiz_models/option_model/option_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  factory QuestionModel({
    required String text,
    required List<OptionModel> options,
    @Default(false) bool isLocked,
    OptionModel? selectedOption,
    String? imageUrl,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
