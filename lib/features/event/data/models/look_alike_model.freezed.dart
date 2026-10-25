// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'look_alike_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LookAlikeModel {

/// By child id.
 Map<String, String> get childImageUrls; String? get ownerImageUrl; String? get partnerImageUrl; Map<String, String> get ownerAnswers; Map<String, String> get partnerAnswers;/// The partner finished the game; the owner can reopen it.
 bool get lock;
/// Create a copy of LookAlikeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookAlikeModelCopyWith<LookAlikeModel> get copyWith => _$LookAlikeModelCopyWithImpl<LookAlikeModel>(this as LookAlikeModel, _$identity);

  /// Serializes this LookAlikeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookAlikeModel&&const DeepCollectionEquality().equals(other.childImageUrls, childImageUrls)&&(identical(other.ownerImageUrl, ownerImageUrl) || other.ownerImageUrl == ownerImageUrl)&&(identical(other.partnerImageUrl, partnerImageUrl) || other.partnerImageUrl == partnerImageUrl)&&const DeepCollectionEquality().equals(other.ownerAnswers, ownerAnswers)&&const DeepCollectionEquality().equals(other.partnerAnswers, partnerAnswers)&&(identical(other.lock, lock) || other.lock == lock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(childImageUrls),ownerImageUrl,partnerImageUrl,const DeepCollectionEquality().hash(ownerAnswers),const DeepCollectionEquality().hash(partnerAnswers),lock);

@override
String toString() {
  return 'LookAlikeModel(childImageUrls: $childImageUrls, ownerImageUrl: $ownerImageUrl, partnerImageUrl: $partnerImageUrl, ownerAnswers: $ownerAnswers, partnerAnswers: $partnerAnswers, lock: $lock)';
}


}

/// @nodoc
abstract mixin class $LookAlikeModelCopyWith<$Res>  {
  factory $LookAlikeModelCopyWith(LookAlikeModel value, $Res Function(LookAlikeModel) _then) = _$LookAlikeModelCopyWithImpl;
@useResult
$Res call({
 Map<String, String> childImageUrls, String? ownerImageUrl, String? partnerImageUrl, Map<String, String> ownerAnswers, Map<String, String> partnerAnswers, bool lock
});




}
/// @nodoc
class _$LookAlikeModelCopyWithImpl<$Res>
    implements $LookAlikeModelCopyWith<$Res> {
  _$LookAlikeModelCopyWithImpl(this._self, this._then);

  final LookAlikeModel _self;
  final $Res Function(LookAlikeModel) _then;

/// Create a copy of LookAlikeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? childImageUrls = null,Object? ownerImageUrl = freezed,Object? partnerImageUrl = freezed,Object? ownerAnswers = null,Object? partnerAnswers = null,Object? lock = null,}) {
  return _then(_self.copyWith(
childImageUrls: null == childImageUrls ? _self.childImageUrls : childImageUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>,ownerImageUrl: freezed == ownerImageUrl ? _self.ownerImageUrl : ownerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,partnerImageUrl: freezed == partnerImageUrl ? _self.partnerImageUrl : partnerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,ownerAnswers: null == ownerAnswers ? _self.ownerAnswers : ownerAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,partnerAnswers: null == partnerAnswers ? _self.partnerAnswers : partnerAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LookAlikeModel].
extension LookAlikeModelPatterns on LookAlikeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookAlikeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookAlikeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookAlikeModel value)  $default,){
final _that = this;
switch (_that) {
case _LookAlikeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookAlikeModel value)?  $default,){
final _that = this;
switch (_that) {
case _LookAlikeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, String> childImageUrls,  String? ownerImageUrl,  String? partnerImageUrl,  Map<String, String> ownerAnswers,  Map<String, String> partnerAnswers,  bool lock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookAlikeModel() when $default != null:
return $default(_that.childImageUrls,_that.ownerImageUrl,_that.partnerImageUrl,_that.ownerAnswers,_that.partnerAnswers,_that.lock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, String> childImageUrls,  String? ownerImageUrl,  String? partnerImageUrl,  Map<String, String> ownerAnswers,  Map<String, String> partnerAnswers,  bool lock)  $default,) {final _that = this;
switch (_that) {
case _LookAlikeModel():
return $default(_that.childImageUrls,_that.ownerImageUrl,_that.partnerImageUrl,_that.ownerAnswers,_that.partnerAnswers,_that.lock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, String> childImageUrls,  String? ownerImageUrl,  String? partnerImageUrl,  Map<String, String> ownerAnswers,  Map<String, String> partnerAnswers,  bool lock)?  $default,) {final _that = this;
switch (_that) {
case _LookAlikeModel() when $default != null:
return $default(_that.childImageUrls,_that.ownerImageUrl,_that.partnerImageUrl,_that.ownerAnswers,_that.partnerAnswers,_that.lock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LookAlikeModel implements LookAlikeModel {
  const _LookAlikeModel({final  Map<String, String> childImageUrls = const {}, this.ownerImageUrl, this.partnerImageUrl, final  Map<String, String> ownerAnswers = const {}, final  Map<String, String> partnerAnswers = const {}, this.lock = false}): _childImageUrls = childImageUrls,_ownerAnswers = ownerAnswers,_partnerAnswers = partnerAnswers;
  factory _LookAlikeModel.fromJson(Map<String, dynamic> json) => _$LookAlikeModelFromJson(json);

/// By child id.
 final  Map<String, String> _childImageUrls;
/// By child id.
@override@JsonKey() Map<String, String> get childImageUrls {
  if (_childImageUrls is EqualUnmodifiableMapView) return _childImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_childImageUrls);
}

@override final  String? ownerImageUrl;
@override final  String? partnerImageUrl;
 final  Map<String, String> _ownerAnswers;
@override@JsonKey() Map<String, String> get ownerAnswers {
  if (_ownerAnswers is EqualUnmodifiableMapView) return _ownerAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ownerAnswers);
}

 final  Map<String, String> _partnerAnswers;
@override@JsonKey() Map<String, String> get partnerAnswers {
  if (_partnerAnswers is EqualUnmodifiableMapView) return _partnerAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_partnerAnswers);
}

/// The partner finished the game; the owner can reopen it.
@override@JsonKey() final  bool lock;

/// Create a copy of LookAlikeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookAlikeModelCopyWith<_LookAlikeModel> get copyWith => __$LookAlikeModelCopyWithImpl<_LookAlikeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookAlikeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookAlikeModel&&const DeepCollectionEquality().equals(other._childImageUrls, _childImageUrls)&&(identical(other.ownerImageUrl, ownerImageUrl) || other.ownerImageUrl == ownerImageUrl)&&(identical(other.partnerImageUrl, partnerImageUrl) || other.partnerImageUrl == partnerImageUrl)&&const DeepCollectionEquality().equals(other._ownerAnswers, _ownerAnswers)&&const DeepCollectionEquality().equals(other._partnerAnswers, _partnerAnswers)&&(identical(other.lock, lock) || other.lock == lock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_childImageUrls),ownerImageUrl,partnerImageUrl,const DeepCollectionEquality().hash(_ownerAnswers),const DeepCollectionEquality().hash(_partnerAnswers),lock);

@override
String toString() {
  return 'LookAlikeModel(childImageUrls: $childImageUrls, ownerImageUrl: $ownerImageUrl, partnerImageUrl: $partnerImageUrl, ownerAnswers: $ownerAnswers, partnerAnswers: $partnerAnswers, lock: $lock)';
}


}

/// @nodoc
abstract mixin class _$LookAlikeModelCopyWith<$Res> implements $LookAlikeModelCopyWith<$Res> {
  factory _$LookAlikeModelCopyWith(_LookAlikeModel value, $Res Function(_LookAlikeModel) _then) = __$LookAlikeModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, String> childImageUrls, String? ownerImageUrl, String? partnerImageUrl, Map<String, String> ownerAnswers, Map<String, String> partnerAnswers, bool lock
});




}
/// @nodoc
class __$LookAlikeModelCopyWithImpl<$Res>
    implements _$LookAlikeModelCopyWith<$Res> {
  __$LookAlikeModelCopyWithImpl(this._self, this._then);

  final _LookAlikeModel _self;
  final $Res Function(_LookAlikeModel) _then;

/// Create a copy of LookAlikeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? childImageUrls = null,Object? ownerImageUrl = freezed,Object? partnerImageUrl = freezed,Object? ownerAnswers = null,Object? partnerAnswers = null,Object? lock = null,}) {
  return _then(_LookAlikeModel(
childImageUrls: null == childImageUrls ? _self._childImageUrls : childImageUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>,ownerImageUrl: freezed == ownerImageUrl ? _self.ownerImageUrl : ownerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,partnerImageUrl: freezed == partnerImageUrl ? _self.partnerImageUrl : partnerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,ownerAnswers: null == ownerAnswers ? _self._ownerAnswers : ownerAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,partnerAnswers: null == partnerAnswers ? _self._partnerAnswers : partnerAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
