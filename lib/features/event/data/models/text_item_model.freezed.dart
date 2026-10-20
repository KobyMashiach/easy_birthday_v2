// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextItemModel {

 String get title; String get text; List<String> get items;
/// Create a copy of TextItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextItemModelCopyWith<TextItemModel> get copyWith => _$TextItemModelCopyWithImpl<TextItemModel>(this as TextItemModel, _$identity);

  /// Serializes this TextItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextItemModel&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,text,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'TextItemModel(title: $title, text: $text, items: $items)';
}


}

/// @nodoc
abstract mixin class $TextItemModelCopyWith<$Res>  {
  factory $TextItemModelCopyWith(TextItemModel value, $Res Function(TextItemModel) _then) = _$TextItemModelCopyWithImpl;
@useResult
$Res call({
 String title, String text, List<String> items
});




}
/// @nodoc
class _$TextItemModelCopyWithImpl<$Res>
    implements $TextItemModelCopyWith<$Res> {
  _$TextItemModelCopyWithImpl(this._self, this._then);

  final TextItemModel _self;
  final $Res Function(TextItemModel) _then;

/// Create a copy of TextItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? text = null,Object? items = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TextItemModel].
extension TextItemModelPatterns on TextItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TextItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String text,  List<String> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextItemModel() when $default != null:
return $default(_that.title,_that.text,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String text,  List<String> items)  $default,) {final _that = this;
switch (_that) {
case _TextItemModel():
return $default(_that.title,_that.text,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String text,  List<String> items)?  $default,) {final _that = this;
switch (_that) {
case _TextItemModel() when $default != null:
return $default(_that.title,_that.text,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextItemModel implements TextItemModel {
  const _TextItemModel({required this.title, required this.text, required final  List<String> items}): _items = items;
  factory _TextItemModel.fromJson(Map<String, dynamic> json) => _$TextItemModelFromJson(json);

@override final  String title;
@override final  String text;
 final  List<String> _items;
@override List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of TextItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextItemModelCopyWith<_TextItemModel> get copyWith => __$TextItemModelCopyWithImpl<_TextItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextItemModel&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,text,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'TextItemModel(title: $title, text: $text, items: $items)';
}


}

/// @nodoc
abstract mixin class _$TextItemModelCopyWith<$Res> implements $TextItemModelCopyWith<$Res> {
  factory _$TextItemModelCopyWith(_TextItemModel value, $Res Function(_TextItemModel) _then) = __$TextItemModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String text, List<String> items
});




}
/// @nodoc
class __$TextItemModelCopyWithImpl<$Res>
    implements _$TextItemModelCopyWith<$Res> {
  __$TextItemModelCopyWithImpl(this._self, this._then);

  final _TextItemModel _self;
  final $Res Function(_TextItemModel) _then;

/// Create a copy of TextItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? text = null,Object? items = null,}) {
  return _then(_TextItemModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
