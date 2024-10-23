// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarModel _$CalendarModelFromJson(Map<String, dynamic> json) {
  return _CalendarModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarModel {
  @DateConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @DateConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  @DateEventMapConverter()
  Map<DateTime, List<DateEventModel>> get dateEventMap =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarModelCopyWith<CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarModelCopyWith<$Res> {
  factory $CalendarModelCopyWith(
          CalendarModel value, $Res Function(CalendarModel) then) =
      _$CalendarModelCopyWithImpl<$Res, CalendarModel>;
  @useResult
  $Res call(
      {@DateConverter() DateTime? startDate,
      @DateConverter() DateTime? endDate,
      @DateEventMapConverter()
      Map<DateTime, List<DateEventModel>> dateEventMap});
}

/// @nodoc
class _$CalendarModelCopyWithImpl<$Res, $Val extends CalendarModel>
    implements $CalendarModelCopyWith<$Res> {
  _$CalendarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? dateEventMap = null,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEventMap: null == dateEventMap
          ? _value.dateEventMap
          : dateEventMap // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<DateEventModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarModelImplCopyWith<$Res>
    implements $CalendarModelCopyWith<$Res> {
  factory _$$CalendarModelImplCopyWith(
          _$CalendarModelImpl value, $Res Function(_$CalendarModelImpl) then) =
      __$$CalendarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateConverter() DateTime? startDate,
      @DateConverter() DateTime? endDate,
      @DateEventMapConverter()
      Map<DateTime, List<DateEventModel>> dateEventMap});
}

/// @nodoc
class __$$CalendarModelImplCopyWithImpl<$Res>
    extends _$CalendarModelCopyWithImpl<$Res, _$CalendarModelImpl>
    implements _$$CalendarModelImplCopyWith<$Res> {
  __$$CalendarModelImplCopyWithImpl(
      _$CalendarModelImpl _value, $Res Function(_$CalendarModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? dateEventMap = null,
  }) {
    return _then(_$CalendarModelImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEventMap: null == dateEventMap
          ? _value._dateEventMap
          : dateEventMap // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<DateEventModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarModelImpl implements _CalendarModel {
  const _$CalendarModelImpl(
      {@DateConverter() this.startDate,
      @DateConverter() this.endDate,
      @DateEventMapConverter()
      final Map<DateTime, List<DateEventModel>> dateEventMap = const {}})
      : _dateEventMap = dateEventMap;

  factory _$CalendarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarModelImplFromJson(json);

  @override
  @DateConverter()
  final DateTime? startDate;
  @override
  @DateConverter()
  final DateTime? endDate;
  final Map<DateTime, List<DateEventModel>> _dateEventMap;
  @override
  @JsonKey()
  @DateEventMapConverter()
  Map<DateTime, List<DateEventModel>> get dateEventMap {
    if (_dateEventMap is EqualUnmodifiableMapView) return _dateEventMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dateEventMap);
  }

  @override
  String toString() {
    return 'CalendarModel(startDate: $startDate, endDate: $endDate, dateEventMap: $dateEventMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarModelImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._dateEventMap, _dateEventMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate,
      const DeepCollectionEquality().hash(_dateEventMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarModelImplCopyWith<_$CalendarModelImpl> get copyWith =>
      __$$CalendarModelImplCopyWithImpl<_$CalendarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarModelImplToJson(
      this,
    );
  }
}

abstract class _CalendarModel implements CalendarModel {
  const factory _CalendarModel(
          {@DateConverter() final DateTime? startDate,
          @DateConverter() final DateTime? endDate,
          @DateEventMapConverter()
          final Map<DateTime, List<DateEventModel>> dateEventMap}) =
      _$CalendarModelImpl;

  factory _CalendarModel.fromJson(Map<String, dynamic> json) =
      _$CalendarModelImpl.fromJson;

  @override
  @DateConverter()
  DateTime? get startDate;
  @override
  @DateConverter()
  DateTime? get endDate;
  @override
  @DateEventMapConverter()
  Map<DateTime, List<DateEventModel>> get dateEventMap;
  @override
  @JsonKey(ignore: true)
  _$$CalendarModelImplCopyWith<_$CalendarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
