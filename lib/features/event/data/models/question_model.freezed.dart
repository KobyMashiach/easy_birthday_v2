// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionModel {

 String get text;@ListOptionsConverter() List<OptionModel> get options; int? get partnerChoise; bool get isLocked;@OptionsConverter() OptionModel? get selectedOption; String? get imageUrl;
/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<QuestionModel> get copyWith => _$QuestionModelCopyWithImpl<QuestionModel>(this as QuestionModel, _$identity);

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionModel&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.partnerChoise, partnerChoise) || other.partnerChoise == partnerChoise)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.selectedOption, selectedOption) || other.selectedOption == selectedOption)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(options),partnerChoise,isLocked,selectedOption,imageUrl);

@override
String toString() {
  return 'QuestionModel(text: $text, options: $options, partnerChoise: $partnerChoise, isLocked: $isLocked, selectedOption: $selectedOption, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $QuestionModelCopyWith<$Res>  {
  factory $QuestionModelCopyWith(QuestionModel value, $Res Function(QuestionModel) _then) = _$QuestionModelCopyWithImpl;
@useResult
$Res call({
 String text,@ListOptionsConverter() List<OptionModel> options, int? partnerChoise, bool isLocked,@OptionsConverter() OptionModel? selectedOption, String? imageUrl
});


$OptionModelCopyWith<$Res>? get selectedOption;

}
/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._self, this._then);

  final QuestionModel _self;
  final $Res Function(QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? options = null,Object? partnerChoise = freezed,Object? isLocked = null,Object? selectedOption = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<OptionModel>,partnerChoise: freezed == partnerChoise ? _self.partnerChoise : partnerChoise // ignore: cast_nullable_to_non_nullable
as int?,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,selectedOption: freezed == selectedOption ? _self.selectedOption : selectedOption // ignore: cast_nullable_to_non_nullable
as OptionModel?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptionModelCopyWith<$Res>? get selectedOption {
    if (_self.selectedOption == null) {
    return null;
  }

  return $OptionModelCopyWith<$Res>(_self.selectedOption!, (value) {
    return _then(_self.copyWith(selectedOption: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuestionModel].
extension QuestionModelPatterns on QuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _QuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text, @ListOptionsConverter()  List<OptionModel> options,  int? partnerChoise,  bool isLocked, @OptionsConverter()  OptionModel? selectedOption,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.text,_that.options,_that.partnerChoise,_that.isLocked,_that.selectedOption,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text, @ListOptionsConverter()  List<OptionModel> options,  int? partnerChoise,  bool isLocked, @OptionsConverter()  OptionModel? selectedOption,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _QuestionModel():
return $default(_that.text,_that.options,_that.partnerChoise,_that.isLocked,_that.selectedOption,_that.imageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text, @ListOptionsConverter()  List<OptionModel> options,  int? partnerChoise,  bool isLocked, @OptionsConverter()  OptionModel? selectedOption,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.text,_that.options,_that.partnerChoise,_that.isLocked,_that.selectedOption,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionModel implements QuestionModel {
   _QuestionModel({required this.text, @ListOptionsConverter() required final  List<OptionModel> options, this.partnerChoise, this.isLocked = false, @OptionsConverter() this.selectedOption, this.imageUrl}): _options = options;
  factory _QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

@override final  String text;
 final  List<OptionModel> _options;
@override@ListOptionsConverter() List<OptionModel> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  int? partnerChoise;
@override@JsonKey() final  bool isLocked;
@override@OptionsConverter() final  OptionModel? selectedOption;
@override final  String? imageUrl;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionModelCopyWith<_QuestionModel> get copyWith => __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionModel&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.partnerChoise, partnerChoise) || other.partnerChoise == partnerChoise)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.selectedOption, selectedOption) || other.selectedOption == selectedOption)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_options),partnerChoise,isLocked,selectedOption,imageUrl);

@override
String toString() {
  return 'QuestionModel(text: $text, options: $options, partnerChoise: $partnerChoise, isLocked: $isLocked, selectedOption: $selectedOption, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$QuestionModelCopyWith<$Res> implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(_QuestionModel value, $Res Function(_QuestionModel) _then) = __$QuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String text,@ListOptionsConverter() List<OptionModel> options, int? partnerChoise, bool isLocked,@OptionsConverter() OptionModel? selectedOption, String? imageUrl
});


@override $OptionModelCopyWith<$Res>? get selectedOption;

}
/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(this._self, this._then);

  final _QuestionModel _self;
  final $Res Function(_QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? options = null,Object? partnerChoise = freezed,Object? isLocked = null,Object? selectedOption = freezed,Object? imageUrl = freezed,}) {
  return _then(_QuestionModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<OptionModel>,partnerChoise: freezed == partnerChoise ? _self.partnerChoise : partnerChoise // ignore: cast_nullable_to_non_nullable
as int?,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,selectedOption: freezed == selectedOption ? _self.selectedOption : selectedOption // ignore: cast_nullable_to_non_nullable
as OptionModel?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptionModelCopyWith<$Res>? get selectedOption {
    if (_self.selectedOption == null) {
    return null;
  }

  return $OptionModelCopyWith<$Res>(_self.selectedOption!, (value) {
    return _then(_self.copyWith(selectedOption: value));
  });
}
}

// dart format on
