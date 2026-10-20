// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarModel {

@DateConverter() DateTime? get startDate;@DateConverter() DateTime? get endDate;@DateEventMapConverter() Map<DateTime, List<DateEventModel>> get dateEventMap;
/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarModelCopyWith<CalendarModel> get copyWith => _$CalendarModelCopyWithImpl<CalendarModel>(this as CalendarModel, _$identity);

  /// Serializes this CalendarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.dateEventMap, dateEventMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(dateEventMap));

@override
String toString() {
  return 'CalendarModel(startDate: $startDate, endDate: $endDate, dateEventMap: $dateEventMap)';
}


}

/// @nodoc
abstract mixin class $CalendarModelCopyWith<$Res>  {
  factory $CalendarModelCopyWith(CalendarModel value, $Res Function(CalendarModel) _then) = _$CalendarModelCopyWithImpl;
@useResult
$Res call({
@DateConverter() DateTime? startDate,@DateConverter() DateTime? endDate,@DateEventMapConverter() Map<DateTime, List<DateEventModel>> dateEventMap
});




}
/// @nodoc
class _$CalendarModelCopyWithImpl<$Res>
    implements $CalendarModelCopyWith<$Res> {
  _$CalendarModelCopyWithImpl(this._self, this._then);

  final CalendarModel _self;
  final $Res Function(CalendarModel) _then;

/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? dateEventMap = null,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dateEventMap: null == dateEventMap ? _self.dateEventMap : dateEventMap // ignore: cast_nullable_to_non_nullable
as Map<DateTime, List<DateEventModel>>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarModel].
extension CalendarModelPatterns on CalendarModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarModel value)  $default,){
final _that = this;
switch (_that) {
case _CalendarModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarModel value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DateConverter()  DateTime? startDate, @DateConverter()  DateTime? endDate, @DateEventMapConverter()  Map<DateTime, List<DateEventModel>> dateEventMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
return $default(_that.startDate,_that.endDate,_that.dateEventMap);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DateConverter()  DateTime? startDate, @DateConverter()  DateTime? endDate, @DateEventMapConverter()  Map<DateTime, List<DateEventModel>> dateEventMap)  $default,) {final _that = this;
switch (_that) {
case _CalendarModel():
return $default(_that.startDate,_that.endDate,_that.dateEventMap);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DateConverter()  DateTime? startDate, @DateConverter()  DateTime? endDate, @DateEventMapConverter()  Map<DateTime, List<DateEventModel>> dateEventMap)?  $default,) {final _that = this;
switch (_that) {
case _CalendarModel() when $default != null:
return $default(_that.startDate,_that.endDate,_that.dateEventMap);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarModel implements CalendarModel {
  const _CalendarModel({@DateConverter() this.startDate, @DateConverter() this.endDate, @DateEventMapConverter() final  Map<DateTime, List<DateEventModel>> dateEventMap = const {}}): _dateEventMap = dateEventMap;
  factory _CalendarModel.fromJson(Map<String, dynamic> json) => _$CalendarModelFromJson(json);

@override@DateConverter() final  DateTime? startDate;
@override@DateConverter() final  DateTime? endDate;
 final  Map<DateTime, List<DateEventModel>> _dateEventMap;
@override@JsonKey()@DateEventMapConverter() Map<DateTime, List<DateEventModel>> get dateEventMap {
  if (_dateEventMap is EqualUnmodifiableMapView) return _dateEventMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_dateEventMap);
}


/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarModelCopyWith<_CalendarModel> get copyWith => __$CalendarModelCopyWithImpl<_CalendarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._dateEventMap, _dateEventMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(_dateEventMap));

@override
String toString() {
  return 'CalendarModel(startDate: $startDate, endDate: $endDate, dateEventMap: $dateEventMap)';
}


}

/// @nodoc
abstract mixin class _$CalendarModelCopyWith<$Res> implements $CalendarModelCopyWith<$Res> {
  factory _$CalendarModelCopyWith(_CalendarModel value, $Res Function(_CalendarModel) _then) = __$CalendarModelCopyWithImpl;
@override @useResult
$Res call({
@DateConverter() DateTime? startDate,@DateConverter() DateTime? endDate,@DateEventMapConverter() Map<DateTime, List<DateEventModel>> dateEventMap
});




}
/// @nodoc
class __$CalendarModelCopyWithImpl<$Res>
    implements _$CalendarModelCopyWith<$Res> {
  __$CalendarModelCopyWithImpl(this._self, this._then);

  final _CalendarModel _self;
  final $Res Function(_CalendarModel) _then;

/// Create a copy of CalendarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? dateEventMap = null,}) {
  return _then(_CalendarModel(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dateEventMap: null == dateEventMap ? _self._dateEventMap : dateEventMap // ignore: cast_nullable_to_non_nullable
as Map<DateTime, List<DateEventModel>>,
  ));
}


}

// dart format on
