import 'package:easy_birthday/models/wishes_model/wishes_model.dart'; // Use correct case
import 'package:json_annotation/json_annotation.dart';

class WishesConverter
    implements JsonConverter<WishesModel, Map<String, dynamic>> {
  const WishesConverter();

  @override
  WishesModel fromJson(Map<String, dynamic> json) {
    return WishesModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(WishesModel wishes) {
    return wishes.toJson();
  }
}
