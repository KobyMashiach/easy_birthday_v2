import 'package:freezed_annotation/freezed_annotation.dart';
part 'wishes_model.freezed.dart';
part 'wishes_model.g.dart';

@freezed
class WishesModel with _$WishesModel {
  const factory WishesModel({
    required bool lock,
    String? contract,
    String? first,
    String? second,
    String? third,
  }) = _WishesModel;

  factory WishesModel.fromJson(Map<String, dynamic> json) =>
      _$WishesModelFromJson(json);
}
