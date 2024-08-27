import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'persona_model.freezed.dart';
part 'persona_model.g.dart';

@freezed
class PersonaModel with _$PersonaModel {
  static const String hiveKey = 'personaModel';
  @HiveType(typeId: 100, adapterName: 'PersonaModelAdapter')
  factory PersonaModel({
    @HiveField(0) required String name,
    @HiveField(1) required String phoneNumber,
    @HiveField(2) String? email,
    @HiveField(3) required bool canEdit,
    @HiveField(4) int? age,
    @HiveField(5) String? profileImage,
  }) = _PersonaModel;

  factory PersonaModel.fromJson(Map<String, dynamic> json) =>
      _$PersonaModelFromJson(json);
}
