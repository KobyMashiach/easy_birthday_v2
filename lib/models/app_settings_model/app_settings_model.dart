import 'package:easy_birthday/models/app_settings_model/color_converter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'app_settings_model.freezed.dart';
part 'app_settings_model.g.dart';

@freezed
class AppSettingsModel with _$AppSettingsModel {
  static const String hiveKey = 'AppSettingsModel';
  @HiveType(typeId: 101, adapterName: 'AppSettingsModelAdapter')
  factory AppSettingsModel({
    @HiveField(0) @ColorConverter() required Color appColor,
  }) = _AppSettingsModel;

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
}
