// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoryGameModelImpl _$$MemoryGameModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MemoryGameModelImpl(
      imagesUrls: (json['imagesUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      score: (json['score'] as num?)?.toInt() ?? 0,
      lock: json['lock'] as bool? ?? false,
    );

Map<String, dynamic> _$$MemoryGameModelImplToJson(
        _$MemoryGameModelImpl instance) =>
    <String, dynamic>{
      'imagesUrls': instance.imagesUrls,
      'score': instance.score,
      'lock': instance.lock,
    };
