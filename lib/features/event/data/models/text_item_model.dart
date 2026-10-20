import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_item_model.freezed.dart';
part 'text_item_model.g.dart';

@freezed
sealed class TextItemModel with _$TextItemModel {
  const factory TextItemModel({
    required String title,
    required String text,
    required List<String> items,
  }) = _TextItemModel;

  factory TextItemModel.fromJson(Map<String, dynamic> json) =>
      _$TextItemModelFromJson(json);
}
