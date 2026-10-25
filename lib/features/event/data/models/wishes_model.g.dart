// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishesModel _$WishesModelFromJson(Map<String, dynamic> json) => _WishesModel(
  lock: json['lock'] as bool,
  contract: json['contract'] as String?,
  first: json['first'] as String?,
  second: json['second'] as String?,
  third: json['third'] as String?,
  redeemed:
      (json['redeemed'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
);

Map<String, dynamic> _$WishesModelToJson(_WishesModel instance) =>
    <String, dynamic>{
      'lock': instance.lock,
      'contract': instance.contract,
      'first': instance.first,
      'second': instance.second,
      'third': instance.third,
      'redeemed': instance.redeemed,
    };
