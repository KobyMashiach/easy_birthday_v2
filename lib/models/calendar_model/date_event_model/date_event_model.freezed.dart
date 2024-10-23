// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DateEventModel _$DateEventModelFromJson(Map<String, dynamic> json) {
  return _DateEventModel.fromJson(json);
}

/// @nodoc
mixin _$DateEventModel {
  @TimeOfDayConverter()
  TimeOfDay get time => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateEventModelCopyWith<DateEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateEventModelCopyWith<$Res> {
  factory $DateEventModelCopyWith(
          DateEventModel value, $Res Function(DateEventModel) then) =
      _$DateEventModelCopyWithImpl<$Res, DateEventModel>;
  @useResult
  $Res call({@TimeOfDayConverter() TimeOfDay time, String description});
}

/// @nodoc
class _$DateEventModelCopyWithImpl<$Res, $Val extends DateEventModel>
    implements $DateEventModelCopyWith<$Res> {
  _$DateEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateEventModelImplCopyWith<$Res>
    implements $DateEventModelCopyWith<$Res> {
  factory _$$DateEventModelImplCopyWith(_$DateEventModelImpl value,
          $Res Function(_$DateEventModelImpl) then) =
      __$$DateEventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@TimeOfDayConverter() TimeOfDay time, String description});
}

/// @nodoc
class __$$DateEventModelImplCopyWithImpl<$Res>
    extends _$DateEventModelCopyWithImpl<$Res, _$DateEventModelImpl>
    implements _$$DateEventModelImplCopyWith<$Res> {
  __$$DateEventModelImplCopyWithImpl(
      _$DateEventModelImpl _value, $Res Function(_$DateEventModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? description = null,
  }) {
    return _then(_$DateEventModelImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateEventModelImpl implements _DateEventModel {
  const _$DateEventModelImpl(
      {@TimeOfDayConverter() required this.time, required this.description});

  factory _$DateEventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateEventModelImplFromJson(json);

  @override
  @TimeOfDayConverter()
  final TimeOfDay time;
  @override
  final String description;

  @override
  String toString() {
    return 'DateEventModel(time: $time, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateEventModelImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateEventModelImplCopyWith<_$DateEventModelImpl> get copyWith =>
      __$$DateEventModelImplCopyWithImpl<_$DateEventModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateEventModelImplToJson(
      this,
    );
  }
}

abstract class _DateEventModel implements DateEventModel {
  const factory _DateEventModel(
      {@TimeOfDayConverter() required final TimeOfDay time,
      required final String description}) = _$DateEventModelImpl;

  factory _DateEventModel.fromJson(Map<String, dynamic> json) =
      _$DateEventModelImpl.fromJson;

  @override
  @TimeOfDayConverter()
  TimeOfDay get time;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$DateEventModelImplCopyWith<_$DateEventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
