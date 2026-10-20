// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OptionModel {

 String get text; bool get isCorrect;
/// Create a copy of OptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionModelCopyWith<OptionModel> get copyWith => _$OptionModelCopyWithImpl<OptionModel>(this as OptionModel, _$identity);

  /// Serializes this OptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isCorrect);

@override
String toString() {
  return 'OptionModel(text: $text, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $OptionModelCopyWith<$Res>  {
  factory $OptionModelCopyWith(OptionModel value, $Res Function(OptionModel) _then) = _$OptionModelCopyWithImpl;
@useResult
$Res call({
 String text, bool isCorrect
});




}
/// @nodoc
class _$OptionModelCopyWithImpl<$Res>
    implements $OptionModelCopyWith<$Res> {
  _$OptionModelCopyWithImpl(this._self, this._then);

  final OptionModel _self;
  final $Res Function(OptionModel) _then;

/// Create a copy of OptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? isCorrect = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OptionModel].
extension OptionModelPatterns on OptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptionModel value)  $default,){
final _that = this;
switch (_that) {
case _OptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _OptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  bool isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptionModel() when $default != null:
return $default(_that.text,_that.isCorrect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  bool isCorrect)  $default,) {final _that = this;
switch (_that) {
case _OptionModel():
return $default(_that.text,_that.isCorrect);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  bool isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _OptionModel() when $default != null:
return $default(_that.text,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptionModel implements OptionModel {
   _OptionModel({required this.text, required this.isCorrect});
  factory _OptionModel.fromJson(Map<String, dynamic> json) => _$OptionModelFromJson(json);

@override final  String text;
@override final  bool isCorrect;

/// Create a copy of OptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionModelCopyWith<_OptionModel> get copyWith => __$OptionModelCopyWithImpl<_OptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isCorrect);

@override
String toString() {
  return 'OptionModel(text: $text, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$OptionModelCopyWith<$Res> implements $OptionModelCopyWith<$Res> {
  factory _$OptionModelCopyWith(_OptionModel value, $Res Function(_OptionModel) _then) = __$OptionModelCopyWithImpl;
@override @useResult
$Res call({
 String text, bool isCorrect
});




}
/// @nodoc
class __$OptionModelCopyWithImpl<$Res>
    implements _$OptionModelCopyWith<$Res> {
  __$OptionModelCopyWithImpl(this._self, this._then);

  final _OptionModel _self;
  final $Res Function(_OptionModel) _then;

/// Create a copy of OptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? isCorrect = null,}) {
  return _then(_OptionModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
