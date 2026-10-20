import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/quiz_converters_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
sealed class QuestionModel with _$QuestionModel {
  factory QuestionModel({
    required String text,
    @ListOptionsConverter() required List<OptionModel> options,
    int? partnerChoise,
    @Default(false) bool isLocked,
    @OptionsConverter() OptionModel? selectedOption,
    String? imageUrl,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
