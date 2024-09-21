import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_enum.dart'; // Import the CategoryEnum and extension

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required CategoryEnum categoryType,
    required String name,
    required String description,
    String? titleAppear,
    String? text,
    List<String>? urls,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
