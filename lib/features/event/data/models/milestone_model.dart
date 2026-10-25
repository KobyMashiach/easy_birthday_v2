import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_birthday/features/event/data/models/calendar_converters_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone_model.freezed.dart';
part 'milestone_model.g.dart';

/// One "first" of the child (first smile, first steps...).
@freezed
sealed class MilestoneModel with _$MilestoneModel {
  const factory MilestoneModel({
    required String title,
    @DateConverter() required DateTime date,
    @Default("⭐") String emoji,
    String? note,
    String? imageUrl,

    /// Whose milestone it is, when the category is about several children.
    String? childId,
  }) = _MilestoneModel;

  factory MilestoneModel.fromJson(Map<String, dynamic> json) =>
      _$MilestoneModelFromJson(json);
}
