// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_greeting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GenerateGreetingEvent {

 String get prompt;
/// Create a copy of GenerateGreetingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateGreetingEventCopyWith<GenerateGreetingEvent> get copyWith => _$GenerateGreetingEventCopyWithImpl<GenerateGreetingEvent>(this as GenerateGreetingEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateGreetingEvent&&(identical(other.prompt, prompt) || other.prompt == prompt));
}


@override
int get hashCode => Object.hash(runtimeType,prompt);

@override
String toString() {
  return 'GenerateGreetingEvent(prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class $GenerateGreetingEventCopyWith<$Res>  {
  factory $GenerateGreetingEventCopyWith(GenerateGreetingEvent value, $Res Function(GenerateGreetingEvent) _then) = _$GenerateGreetingEventCopyWithImpl;
@useResult
$Res call({
 String prompt
});




}
/// @nodoc
class _$GenerateGreetingEventCopyWithImpl<$Res>
    implements $GenerateGreetingEventCopyWith<$Res> {
  _$GenerateGreetingEventCopyWithImpl(this._self, this._then);

  final GenerateGreetingEvent _self;
  final $Res Function(GenerateGreetingEvent) _then;

/// Create a copy of GenerateGreetingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prompt = null,}) {
  return _then(_self.copyWith(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateGreetingEvent].
extension GenerateGreetingEventPatterns on GenerateGreetingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Generate value)?  generate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Generate() when generate != null:
return generate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Generate value)  generate,}){
final _that = this;
switch (_that) {
case _Generate():
return generate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Generate value)?  generate,}){
final _that = this;
switch (_that) {
case _Generate() when generate != null:
return generate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String prompt)?  generate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Generate() when generate != null:
return generate(_that.prompt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String prompt)  generate,}) {final _that = this;
switch (_that) {
case _Generate():
return generate(_that.prompt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String prompt)?  generate,}) {final _that = this;
switch (_that) {
case _Generate() when generate != null:
return generate(_that.prompt);case _:
  return null;

}
}

}

/// @nodoc


class _Generate implements GenerateGreetingEvent {
  const _Generate(this.prompt);
  

@override final  String prompt;

/// Create a copy of GenerateGreetingEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateCopyWith<_Generate> get copyWith => __$GenerateCopyWithImpl<_Generate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Generate&&(identical(other.prompt, prompt) || other.prompt == prompt));
}


@override
int get hashCode => Object.hash(runtimeType,prompt);

@override
String toString() {
  return 'GenerateGreetingEvent.generate(prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class _$GenerateCopyWith<$Res> implements $GenerateGreetingEventCopyWith<$Res> {
  factory _$GenerateCopyWith(_Generate value, $Res Function(_Generate) _then) = __$GenerateCopyWithImpl;
@override @useResult
$Res call({
 String prompt
});




}
/// @nodoc
class __$GenerateCopyWithImpl<$Res>
    implements _$GenerateCopyWith<$Res> {
  __$GenerateCopyWithImpl(this._self, this._then);

  final _Generate _self;
  final $Res Function(_Generate) _then;

/// Create a copy of GenerateGreetingEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prompt = null,}) {
  return _then(_Generate(
null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$GenerateGreetingState {

 String get generatedText;
/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateGreetingStateCopyWith<GenerateGreetingState> get copyWith => _$GenerateGreetingStateCopyWithImpl<GenerateGreetingState>(this as GenerateGreetingState, _$identity);





@override
String toString() {
  return 'GenerateGreetingState(generatedText: $generatedText)';
}


}

/// @nodoc
abstract mixin class $GenerateGreetingStateCopyWith<$Res>  {
  factory $GenerateGreetingStateCopyWith(GenerateGreetingState value, $Res Function(GenerateGreetingState) _then) = _$GenerateGreetingStateCopyWithImpl;
@useResult
$Res call({
 String generatedText
});




}
/// @nodoc
class _$GenerateGreetingStateCopyWithImpl<$Res>
    implements $GenerateGreetingStateCopyWith<$Res> {
  _$GenerateGreetingStateCopyWithImpl(this._self, this._then);

  final GenerateGreetingState _self;
  final $Res Function(GenerateGreetingState) _then;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? generatedText = null,}) {
  return _then(_self.copyWith(
generatedText: null == generatedText ? _self.generatedText : generatedText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateGreetingState].
extension GenerateGreetingStatePatterns on GenerateGreetingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( ErrorMessage value)?  errorMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( ErrorMessage value)  errorMessage,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case ErrorMessage():
return errorMessage(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( ErrorMessage value)?  errorMessage,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String generatedText)?  initial,TResult Function( String generatedText)?  loading,TResult Function( String generatedText)?  loaded,TResult Function( String generatedText,  String error)?  errorMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.generatedText);case Loading() when loading != null:
return loading(_that.generatedText);case Loaded() when loaded != null:
return loaded(_that.generatedText);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.generatedText,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String generatedText)  initial,required TResult Function( String generatedText)  loading,required TResult Function( String generatedText)  loaded,required TResult Function( String generatedText,  String error)  errorMessage,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.generatedText);case Loading():
return loading(_that.generatedText);case Loaded():
return loaded(_that.generatedText);case ErrorMessage():
return errorMessage(_that.generatedText,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String generatedText)?  initial,TResult? Function( String generatedText)?  loading,TResult? Function( String generatedText)?  loaded,TResult? Function( String generatedText,  String error)?  errorMessage,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.generatedText);case Loading() when loading != null:
return loading(_that.generatedText);case Loaded() when loaded != null:
return loaded(_that.generatedText);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.generatedText,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements GenerateGreetingState {
  const Initial({this.generatedText = ''});
  

@override@JsonKey() final  String generatedText;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);





@override
String toString() {
  return 'GenerateGreetingState.initial(generatedText: $generatedText)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $GenerateGreetingStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 String generatedText
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generatedText = null,}) {
  return _then(Initial(
generatedText: null == generatedText ? _self.generatedText : generatedText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Loading implements GenerateGreetingState {
  const Loading({required this.generatedText});
  

@override final  String generatedText;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);





@override
String toString() {
  return 'GenerateGreetingState.loading(generatedText: $generatedText)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $GenerateGreetingStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 String generatedText
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generatedText = null,}) {
  return _then(Loading(
generatedText: null == generatedText ? _self.generatedText : generatedText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Loaded implements GenerateGreetingState {
  const Loaded({required this.generatedText});
  

@override final  String generatedText;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'GenerateGreetingState.loaded(generatedText: $generatedText)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $GenerateGreetingStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 String generatedText
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generatedText = null,}) {
  return _then(Loaded(
generatedText: null == generatedText ? _self.generatedText : generatedText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorMessage implements GenerateGreetingState {
  const ErrorMessage({required this.generatedText, required this.error});
  

@override final  String generatedText;
 final  String error;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'GenerateGreetingState.errorMessage(generatedText: $generatedText, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $GenerateGreetingStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 String generatedText, String error
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of GenerateGreetingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generatedText = null,Object? error = null,}) {
  return _then(ErrorMessage(
generatedText: null == generatedText ? _self.generatedText : generatedText // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
