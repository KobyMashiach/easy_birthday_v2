import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/persona_functions.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_item_model.freezed.dart';
part 'text_item_model.g.dart';

@freezed
class TextItemModel with _$TextItemModel {
  const factory TextItemModel({
    required String title,
    required String text,
    required List<String> items,
  }) = _TextItemModel;

  factory TextItemModel.fromJson(Map<String, dynamic> json) =>
      _$TextItemModelFromJson(json);
}

enum ReadyTextEnum { title, description }

String buildReadyTexts(
    {required ReadyTextEnum textEnum,
    required Map<String, String> choosenItems}) {
  return switch (textEnum) {
    ReadyTextEnum.title =>
      "${globalPartnerUser!.name} ${getTextChoosenMap(choosenItems, 'title_text')} ${calculateNextAge()}",
    ReadyTextEnum.description =>
      "${getTextChoosenMap(choosenItems, 'relationship')} ${t.my_deer(context: getPartnerGender())}, ${t.special_age(age: calculateNextAge())}",
  };
}

String getTextChoosenMap(Map<String, String> choosenItems, String keyInMap) =>
    choosenItems.entries.firstWhere((e) => e.key == keyInMap).value;
