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
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
