// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MilestoneModel {

 String get title;@DateConverter() DateTime get date; String get emoji; String? get note; String? get imageUrl;/// Whose milestone it is, when the category is about several children.
 String? get childId;
/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneModelCopyWith<MilestoneModel> get copyWith => _$MilestoneModelCopyWithImpl<MilestoneModel>(this as MilestoneModel, _$identity);

  /// Serializes this MilestoneModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneModel&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.note, note) || other.note == note)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.childId, childId) || other.childId == childId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,date,emoji,note,imageUrl,childId);

@override
String toString() {
  return 'MilestoneModel(title: $title, date: $date, emoji: $emoji, note: $note, imageUrl: $imageUrl, childId: $childId)';
}


}

/// @nodoc
abstract mixin class $MilestoneModelCopyWith<$Res>  {
  factory $MilestoneModelCopyWith(MilestoneModel value, $Res Function(MilestoneModel) _then) = _$MilestoneModelCopyWithImpl;
@useResult
$Res call({
 String title,@DateConverter() DateTime date, String emoji, String? note, String? imageUrl, String? childId
});




}
/// @nodoc
class _$MilestoneModelCopyWithImpl<$Res>
    implements $MilestoneModelCopyWith<$Res> {
  _$MilestoneModelCopyWithImpl(this._self, this._then);

  final MilestoneModel _self;
  final $Res Function(MilestoneModel) _then;

/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? date = null,Object? emoji = null,Object? note = freezed,Object? imageUrl = freezed,Object? childId = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,childId: freezed == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MilestoneModel].
extension MilestoneModelPatterns on MilestoneModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestoneModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestoneModel value)  $default,){
final _that = this;
switch (_that) {
case _MilestoneModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestoneModel value)?  $default,){
final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title, @DateConverter()  DateTime date,  String emoji,  String? note,  String? imageUrl,  String? childId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
return $default(_that.title,_that.date,_that.emoji,_that.note,_that.imageUrl,_that.childId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title, @DateConverter()  DateTime date,  String emoji,  String? note,  String? imageUrl,  String? childId)  $default,) {final _that = this;
switch (_that) {
case _MilestoneModel():
return $default(_that.title,_that.date,_that.emoji,_that.note,_that.imageUrl,_that.childId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title, @DateConverter()  DateTime date,  String emoji,  String? note,  String? imageUrl,  String? childId)?  $default,) {final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
return $default(_that.title,_that.date,_that.emoji,_that.note,_that.imageUrl,_that.childId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MilestoneModel implements MilestoneModel {
  const _MilestoneModel({required this.title, @DateConverter() required this.date, this.emoji = "⭐", this.note, this.imageUrl, this.childId});
  factory _MilestoneModel.fromJson(Map<String, dynamic> json) => _$MilestoneModelFromJson(json);

@override final  String title;
@override@DateConverter() final  DateTime date;
@override@JsonKey() final  String emoji;
@override final  String? note;
@override final  String? imageUrl;
/// Whose milestone it is, when the category is about several children.
@override final  String? childId;

/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneModelCopyWith<_MilestoneModel> get copyWith => __$MilestoneModelCopyWithImpl<_MilestoneModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestoneModel&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.note, note) || other.note == note)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.childId, childId) || other.childId == childId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,date,emoji,note,imageUrl,childId);

@override
String toString() {
  return 'MilestoneModel(title: $title, date: $date, emoji: $emoji, note: $note, imageUrl: $imageUrl, childId: $childId)';
}


}

/// @nodoc
abstract mixin class _$MilestoneModelCopyWith<$Res> implements $MilestoneModelCopyWith<$Res> {
  factory _$MilestoneModelCopyWith(_MilestoneModel value, $Res Function(_MilestoneModel) _then) = __$MilestoneModelCopyWithImpl;
@override @useResult
$Res call({
 String title,@DateConverter() DateTime date, String emoji, String? note, String? imageUrl, String? childId
});




}
/// @nodoc
class __$MilestoneModelCopyWithImpl<$Res>
    implements _$MilestoneModelCopyWith<$Res> {
  __$MilestoneModelCopyWithImpl(this._self, this._then);

  final _MilestoneModel _self;
  final $Res Function(_MilestoneModel) _then;

/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? date = null,Object? emoji = null,Object? note = freezed,Object? imageUrl = freezed,Object? childId = freezed,}) {
  return _then(_MilestoneModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,childId: freezed == childId ? _self.childId : childId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
