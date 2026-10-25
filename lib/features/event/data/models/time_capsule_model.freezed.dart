// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_capsule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeCapsuleModel {

@DateConverter() DateTime get openDate; String? get ownerLetter; String? get partnerLetter;
/// Create a copy of TimeCapsuleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeCapsuleModelCopyWith<TimeCapsuleModel> get copyWith => _$TimeCapsuleModelCopyWithImpl<TimeCapsuleModel>(this as TimeCapsuleModel, _$identity);

  /// Serializes this TimeCapsuleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeCapsuleModel&&(identical(other.openDate, openDate) || other.openDate == openDate)&&(identical(other.ownerLetter, ownerLetter) || other.ownerLetter == ownerLetter)&&(identical(other.partnerLetter, partnerLetter) || other.partnerLetter == partnerLetter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openDate,ownerLetter,partnerLetter);

@override
String toString() {
  return 'TimeCapsuleModel(openDate: $openDate, ownerLetter: $ownerLetter, partnerLetter: $partnerLetter)';
}


}

/// @nodoc
abstract mixin class $TimeCapsuleModelCopyWith<$Res>  {
  factory $TimeCapsuleModelCopyWith(TimeCapsuleModel value, $Res Function(TimeCapsuleModel) _then) = _$TimeCapsuleModelCopyWithImpl;
@useResult
$Res call({
@DateConverter() DateTime openDate, String? ownerLetter, String? partnerLetter
});




}
/// @nodoc
class _$TimeCapsuleModelCopyWithImpl<$Res>
    implements $TimeCapsuleModelCopyWith<$Res> {
  _$TimeCapsuleModelCopyWithImpl(this._self, this._then);

  final TimeCapsuleModel _self;
  final $Res Function(TimeCapsuleModel) _then;

/// Create a copy of TimeCapsuleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openDate = null,Object? ownerLetter = freezed,Object? partnerLetter = freezed,}) {
  return _then(_self.copyWith(
openDate: null == openDate ? _self.openDate : openDate // ignore: cast_nullable_to_non_nullable
as DateTime,ownerLetter: freezed == ownerLetter ? _self.ownerLetter : ownerLetter // ignore: cast_nullable_to_non_nullable
as String?,partnerLetter: freezed == partnerLetter ? _self.partnerLetter : partnerLetter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeCapsuleModel].
extension TimeCapsuleModelPatterns on TimeCapsuleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeCapsuleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeCapsuleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeCapsuleModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeCapsuleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeCapsuleModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeCapsuleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DateConverter()  DateTime openDate,  String? ownerLetter,  String? partnerLetter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeCapsuleModel() when $default != null:
return $default(_that.openDate,_that.ownerLetter,_that.partnerLetter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DateConverter()  DateTime openDate,  String? ownerLetter,  String? partnerLetter)  $default,) {final _that = this;
switch (_that) {
case _TimeCapsuleModel():
return $default(_that.openDate,_that.ownerLetter,_that.partnerLetter);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DateConverter()  DateTime openDate,  String? ownerLetter,  String? partnerLetter)?  $default,) {final _that = this;
switch (_that) {
case _TimeCapsuleModel() when $default != null:
return $default(_that.openDate,_that.ownerLetter,_that.partnerLetter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeCapsuleModel implements TimeCapsuleModel {
  const _TimeCapsuleModel({@DateConverter() required this.openDate, this.ownerLetter, this.partnerLetter});
  factory _TimeCapsuleModel.fromJson(Map<String, dynamic> json) => _$TimeCapsuleModelFromJson(json);

@override@DateConverter() final  DateTime openDate;
@override final  String? ownerLetter;
@override final  String? partnerLetter;

/// Create a copy of TimeCapsuleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeCapsuleModelCopyWith<_TimeCapsuleModel> get copyWith => __$TimeCapsuleModelCopyWithImpl<_TimeCapsuleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeCapsuleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeCapsuleModel&&(identical(other.openDate, openDate) || other.openDate == openDate)&&(identical(other.ownerLetter, ownerLetter) || other.ownerLetter == ownerLetter)&&(identical(other.partnerLetter, partnerLetter) || other.partnerLetter == partnerLetter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openDate,ownerLetter,partnerLetter);

@override
String toString() {
  return 'TimeCapsuleModel(openDate: $openDate, ownerLetter: $ownerLetter, partnerLetter: $partnerLetter)';
}


}

/// @nodoc
abstract mixin class _$TimeCapsuleModelCopyWith<$Res> implements $TimeCapsuleModelCopyWith<$Res> {
  factory _$TimeCapsuleModelCopyWith(_TimeCapsuleModel value, $Res Function(_TimeCapsuleModel) _then) = __$TimeCapsuleModelCopyWithImpl;
@override @useResult
$Res call({
@DateConverter() DateTime openDate, String? ownerLetter, String? partnerLetter
});




}
/// @nodoc
class __$TimeCapsuleModelCopyWithImpl<$Res>
    implements _$TimeCapsuleModelCopyWith<$Res> {
  __$TimeCapsuleModelCopyWithImpl(this._self, this._then);

  final _TimeCapsuleModel _self;
  final $Res Function(_TimeCapsuleModel) _then;

/// Create a copy of TimeCapsuleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? openDate = null,Object? ownerLetter = freezed,Object? partnerLetter = freezed,}) {
  return _then(_TimeCapsuleModel(
openDate: null == openDate ? _self.openDate : openDate // ignore: cast_nullable_to_non_nullable
as DateTime,ownerLetter: freezed == ownerLetter ? _self.ownerLetter : ownerLetter // ignore: cast_nullable_to_non_nullable
as String?,partnerLetter: freezed == partnerLetter ? _self.partnerLetter : partnerLetter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
