// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemoryGameModel {

 List<String> get imagesUrls; int get score; bool get lock;
/// Create a copy of MemoryGameModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemoryGameModelCopyWith<MemoryGameModel> get copyWith => _$MemoryGameModelCopyWithImpl<MemoryGameModel>(this as MemoryGameModel, _$identity);

  /// Serializes this MemoryGameModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemoryGameModel&&const DeepCollectionEquality().equals(other.imagesUrls, imagesUrls)&&(identical(other.score, score) || other.score == score)&&(identical(other.lock, lock) || other.lock == lock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imagesUrls),score,lock);

@override
String toString() {
  return 'MemoryGameModel(imagesUrls: $imagesUrls, score: $score, lock: $lock)';
}


}

/// @nodoc
abstract mixin class $MemoryGameModelCopyWith<$Res>  {
  factory $MemoryGameModelCopyWith(MemoryGameModel value, $Res Function(MemoryGameModel) _then) = _$MemoryGameModelCopyWithImpl;
@useResult
$Res call({
 List<String> imagesUrls, int score, bool lock
});




}
/// @nodoc
class _$MemoryGameModelCopyWithImpl<$Res>
    implements $MemoryGameModelCopyWith<$Res> {
  _$MemoryGameModelCopyWithImpl(this._self, this._then);

  final MemoryGameModel _self;
  final $Res Function(MemoryGameModel) _then;

/// Create a copy of MemoryGameModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagesUrls = null,Object? score = null,Object? lock = null,}) {
  return _then(_self.copyWith(
imagesUrls: null == imagesUrls ? _self.imagesUrls : imagesUrls // ignore: cast_nullable_to_non_nullable
as List<String>,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MemoryGameModel].
extension MemoryGameModelPatterns on MemoryGameModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemoryGameModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemoryGameModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemoryGameModel value)  $default,){
final _that = this;
switch (_that) {
case _MemoryGameModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemoryGameModel value)?  $default,){
final _that = this;
switch (_that) {
case _MemoryGameModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> imagesUrls,  int score,  bool lock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemoryGameModel() when $default != null:
return $default(_that.imagesUrls,_that.score,_that.lock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> imagesUrls,  int score,  bool lock)  $default,) {final _that = this;
switch (_that) {
case _MemoryGameModel():
return $default(_that.imagesUrls,_that.score,_that.lock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> imagesUrls,  int score,  bool lock)?  $default,) {final _that = this;
switch (_that) {
case _MemoryGameModel() when $default != null:
return $default(_that.imagesUrls,_that.score,_that.lock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemoryGameModel implements MemoryGameModel {
  const _MemoryGameModel({required final  List<String> imagesUrls, this.score = 0, this.lock = false}): _imagesUrls = imagesUrls;
  factory _MemoryGameModel.fromJson(Map<String, dynamic> json) => _$MemoryGameModelFromJson(json);

 final  List<String> _imagesUrls;
@override List<String> get imagesUrls {
  if (_imagesUrls is EqualUnmodifiableListView) return _imagesUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagesUrls);
}

@override@JsonKey() final  int score;
@override@JsonKey() final  bool lock;

/// Create a copy of MemoryGameModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemoryGameModelCopyWith<_MemoryGameModel> get copyWith => __$MemoryGameModelCopyWithImpl<_MemoryGameModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemoryGameModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemoryGameModel&&const DeepCollectionEquality().equals(other._imagesUrls, _imagesUrls)&&(identical(other.score, score) || other.score == score)&&(identical(other.lock, lock) || other.lock == lock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_imagesUrls),score,lock);

@override
String toString() {
  return 'MemoryGameModel(imagesUrls: $imagesUrls, score: $score, lock: $lock)';
}


}

/// @nodoc
abstract mixin class _$MemoryGameModelCopyWith<$Res> implements $MemoryGameModelCopyWith<$Res> {
  factory _$MemoryGameModelCopyWith(_MemoryGameModel value, $Res Function(_MemoryGameModel) _then) = __$MemoryGameModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> imagesUrls, int score, bool lock
});




}
/// @nodoc
class __$MemoryGameModelCopyWithImpl<$Res>
    implements _$MemoryGameModelCopyWith<$Res> {
  __$MemoryGameModelCopyWithImpl(this._self, this._then);

  final _MemoryGameModel _self;
  final $Res Function(_MemoryGameModel) _then;

/// Create a copy of MemoryGameModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagesUrls = null,Object? score = null,Object? lock = null,}) {
  return _then(_MemoryGameModel(
imagesUrls: null == imagesUrls ? _self._imagesUrls : imagesUrls // ignore: cast_nullable_to_non_nullable
as List<String>,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
