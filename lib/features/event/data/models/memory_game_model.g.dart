// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemoryGameModel _$MemoryGameModelFromJson(Map<String, dynamic> json) =>
    _MemoryGameModel(
      imagesUrls: (json['imagesUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      score: (json['score'] as num?)?.toInt() ?? 0,
      lock: json['lock'] as bool? ?? false,
    );

Map<String, dynamic> _$MemoryGameModelToJson(_MemoryGameModel instance) =>
    <String, dynamic>{
      'imagesUrls': instance.imagesUrls,
      'score': instance.score,
      'lock': instance.lock,
    };
