// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MilestoneModel _$MilestoneModelFromJson(Map<String, dynamic> json) =>
    _MilestoneModel(
      title: json['title'] as String,
      date: const DateConverter().fromJson(json['date'] as Timestamp),
      emoji: json['emoji'] as String? ?? "⭐",
      note: json['note'] as String?,
      imageUrl: json['imageUrl'] as String?,
      childId: json['childId'] as String?,
    );

Map<String, dynamic> _$MilestoneModelToJson(_MilestoneModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': const DateConverter().toJson(instance.date),
      'emoji': instance.emoji,
      'note': instance.note,
      'imageUrl': instance.imageUrl,
      'childId': instance.childId,
    };
