// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventModel _$EventModelFromJson(Map<String, dynamic> json) => _EventModel(
  eventId: json['eventId'] as String,
  users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
  planSubscribe: const PlanConverter().fromJson(
    json['planSubscribe'] as Map<String, dynamic>,
  ),
  appColor: _$JsonConverterFromJson<int, Color>(
    json['appColor'],
    const ColorConverter().fromJson,
  ),
  imagesUrl: (json['imagesUrl'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  greeting: json['greeting'] as String?,
  partnerDateOfBirth: timestampToDateTime(
    json['partnerDateOfBirth'] as Timestamp?,
  ),
  chosenTexts: (json['choosenTexts'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map(
            (e) =>
                const CategoryConverter().fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  profileImageUrl: json['profileImageUrl'] as String?,
  children:
      (json['children'] as List<dynamic>?)
          ?.map(
            (e) => const ChildConverter().fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$EventModelToJson(_EventModel instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'users': instance.users,
      'planSubscribe': const PlanConverter().toJson(instance.planSubscribe),
      'appColor': _$JsonConverterToJson<int, Color>(
        instance.appColor,
        const ColorConverter().toJson,
      ),
      'imagesUrl': instance.imagesUrl,
      'greeting': instance.greeting,
      'partnerDateOfBirth': dateTimeToTimestamp(instance.partnerDateOfBirth),
      'choosenTexts': instance.chosenTexts,
      'categories': instance.categories
          .map(const CategoryConverter().toJson)
          .toList(),
      'profileImageUrl': instance.profileImageUrl,
      'children': instance.children.map(const ChildConverter().toJson).toList(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
