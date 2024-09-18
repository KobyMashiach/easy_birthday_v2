// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextItemModelImpl _$$TextItemModelImplFromJson(Map<String, dynamic> json) =>
    _$TextItemModelImpl(
      title: json['title'] as String,
      text: json['text'] as String,
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$TextItemModelImplToJson(_$TextItemModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'items': instance.items,
    };
