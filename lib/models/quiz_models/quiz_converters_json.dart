import 'package:json_annotation/json_annotation.dart';
import 'package:easy_birthday/models/quiz_models/option_model/option_model.dart';

class OptionsConverter
    implements JsonConverter<OptionModel, Map<String, dynamic>> {
  const OptionsConverter();

  @override
  OptionModel fromJson(Map<String, dynamic> json) {
    return OptionModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(OptionModel option) {
    return option.toJson();
  }
}

class ListOptionsConverter
    implements JsonConverter<List<OptionModel>, List<dynamic>> {
  const ListOptionsConverter();

  @override
  List<OptionModel> fromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => OptionModel.fromJson(json)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<OptionModel> options) {
    return options.map((option) => option.toJson()).toList();
  }
}
