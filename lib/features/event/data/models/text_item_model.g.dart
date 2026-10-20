// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextItemModel _$TextItemModelFromJson(Map<String, dynamic> json) =>
    _TextItemModel(
      title: json['title'] as String,
      text: json['text'] as String,
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TextItemModelToJson(_TextItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'items': instance.items,
    };
