import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/features/event/data/models/calendar_converters_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_capsule_model.freezed.dart';
part 'time_capsule_model.g.dart';

/// Letters of both parents, sealed until [openDate].
@freezed
sealed class TimeCapsuleModel with _$TimeCapsuleModel {
  const factory TimeCapsuleModel({
    @DateConverter() required DateTime openDate,
    String? ownerLetter,
    String? partnerLetter,
  }) = _TimeCapsuleModel;

  factory TimeCapsuleModel.fromJson(Map<String, dynamic> json) =>
      _$TimeCapsuleModelFromJson(json);
}

extension TimeCapsuleModelX on TimeCapsuleModel {
  bool isOpen([DateTime? now]) => !(now ?? DateTime.now()).isBefore(openDate);
}
