// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WishesModelImpl _$$WishesModelImplFromJson(Map<String, dynamic> json) =>
    _$WishesModelImpl(
      lock: json['lock'] as bool,
      contract: json['contract'] as String?,
      first: json['first'] as String?,
      second: json['second'] as String?,
      third: json['third'] as String?,
    );

Map<String, dynamic> _$$WishesModelImplToJson(_$WishesModelImpl instance) =>
    <String, dynamic>{
      'lock': instance.lock,
      'contract': instance.contract,
      'first': instance.first,
      'second': instance.second,
      'third': instance.third,
    };
