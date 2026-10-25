// ignore_for_file: invalid_annotation_target

import 'package:easy_birthday/core/utils/converters/color_converter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'app_settings_model.freezed.dart';
part 'app_settings_model.g.dart';

@freezed
@HiveType(typeId: 101, adapterName: 'AppSettingsModelAdapter')
sealed class AppSettingsModel with _$AppSettingsModel {
  static const String hiveKey = 'AppSettingsModel';
  factory AppSettingsModel({
    @HiveField(0) @ColorConverter() required Color appColor,
    @HiveField(1) required String languageCode,

    /// The last "what's new" spotlight shown on this device.
    @HiveField(2) String? whatsNewSeen,
  }) = _AppSettingsModel;

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
}
