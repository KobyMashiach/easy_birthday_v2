// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/core/general_functions.dart';
import 'package:easy_birthday/models/persona_model/role_model.dart';
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
    @HiveField(2) required String password,
    @HiveField(3) @RoleModelConverter() required RoleModel role,
    @HiveField(4)
    @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
    DateTime? dateOfBirth,
    @HiveField(5) String? profileImage,
    @HiveField(6) @Default("male") String gender,
    @HiveField(7) String? partnerGender,
    @HiveField(8) required bool registerComplete,
    @HiveField(9) String? email,
    @HiveField(10) String? eventId,
  }) = _PersonaModel;

  factory PersonaModel.fromJson(Map<String, dynamic> json) =>
      _$PersonaModelFromJson(json);
}
