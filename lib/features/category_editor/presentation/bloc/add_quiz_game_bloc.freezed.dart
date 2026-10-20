// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_quiz_game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddQuizGameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddQuizGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddQuizGameEvent()';
}


}

/// @nodoc
class $AddQuizGameEventCopyWith<$Res>  {
$AddQuizGameEventCopyWith(AddQuizGameEvent _, $Res Function(AddQuizGameEvent) __);
}


/// Adds pattern-matching-related methods to [AddQuizGameEvent].
extension AddQuizGameEventPatterns on AddQuizGameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddQuestion value)?  addQuestion,TResult Function( _RemoveQuestions value)?  removeQuestions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddQuestion() when addQuestion != null:
return addQuestion(_that);case _RemoveQuestions() when removeQuestions != null:
return removeQuestions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddQuestion value)  addQuestion,required TResult Function( _RemoveQuestions value)  removeQuestions,}){
final _that = this;
switch (_that) {
case _AddQuestion():
return addQuestion(_that);case _RemoveQuestions():
return removeQuestions(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddQuestion value)?  addQuestion,TResult? Function( _RemoveQuestions value)?  removeQuestions,}){
final _that = this;
switch (_that) {
case _AddQuestion() when addQuestion != null:
return addQuestion(_that);case _RemoveQuestions() when removeQuestions != null:
return removeQuestions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( QuestionModel question,  File? image)?  addQuestion,TResult Function( List<int> indexes)?  removeQuestions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddQuestion() when addQuestion != null:
return addQuestion(_that.question,_that.image);case _RemoveQuestions() when removeQuestions != null:
return removeQuestions(_that.indexes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( QuestionModel question,  File? image)  addQuestion,required TResult Function( List<int> indexes)  removeQuestions,}) {final _that = this;
switch (_that) {
case _AddQuestion():
return addQuestion(_that.question,_that.image);case _RemoveQuestions():
return removeQuestions(_that.indexes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( QuestionModel question,  File? image)?  addQuestion,TResult? Function( List<int> indexes)?  removeQuestions,}) {final _that = this;
switch (_that) {
case _AddQuestion() when addQuestion != null:
return addQuestion(_that.question,_that.image);case _RemoveQuestions() when removeQuestions != null:
return removeQuestions(_that.indexes);case _:
  return null;

}
}

}

/// @nodoc


class _AddQuestion implements AddQuizGameEvent {
  const _AddQuestion(this.question, this.image);
  

 final  QuestionModel question;
 final  File? image;

/// Create a copy of AddQuizGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddQuestionCopyWith<_AddQuestion> get copyWith => __$AddQuestionCopyWithImpl<_AddQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddQuestion&&(identical(other.question, question) || other.question == question)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,question,image);

@override
String toString() {
  return 'AddQuizGameEvent.addQuestion(question: $question, image: $image)';
}


}

/// @nodoc
abstract mixin class _$AddQuestionCopyWith<$Res> implements $AddQuizGameEventCopyWith<$Res> {
  factory _$AddQuestionCopyWith(_AddQuestion value, $Res Function(_AddQuestion) _then) = __$AddQuestionCopyWithImpl;
@useResult
$Res call({
 QuestionModel question, File? image
});


$QuestionModelCopyWith<$Res> get question;

}
/// @nodoc
class __$AddQuestionCopyWithImpl<$Res>
    implements _$AddQuestionCopyWith<$Res> {
  __$AddQuestionCopyWithImpl(this._self, this._then);

  final _AddQuestion _self;
  final $Res Function(_AddQuestion) _then;

/// Create a copy of AddQuizGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,Object? image = freezed,}) {
  return _then(_AddQuestion(
null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as QuestionModel,freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

/// Create a copy of AddQuizGameEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<$Res> get question {
  
  return $QuestionModelCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}

/// @nodoc


class _RemoveQuestions implements AddQuizGameEvent {
  const _RemoveQuestions(final  List<int> indexes): _indexes = indexes;
  

 final  List<int> _indexes;
 List<int> get indexes {
  if (_indexes is EqualUnmodifiableListView) return _indexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_indexes);
}


/// Create a copy of AddQuizGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveQuestionsCopyWith<_RemoveQuestions> get copyWith => __$RemoveQuestionsCopyWithImpl<_RemoveQuestions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveQuestions&&const DeepCollectionEquality().equals(other._indexes, _indexes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_indexes));

@override
String toString() {
  return 'AddQuizGameEvent.removeQuestions(indexes: $indexes)';
}


}

/// @nodoc
abstract mixin class _$RemoveQuestionsCopyWith<$Res> implements $AddQuizGameEventCopyWith<$Res> {
  factory _$RemoveQuestionsCopyWith(_RemoveQuestions value, $Res Function(_RemoveQuestions) _then) = __$RemoveQuestionsCopyWithImpl;
@useResult
$Res call({
 List<int> indexes
});




}
/// @nodoc
class __$RemoveQuestionsCopyWithImpl<$Res>
    implements _$RemoveQuestionsCopyWith<$Res> {
  __$RemoveQuestionsCopyWithImpl(this._self, this._then);

  final _RemoveQuestions _self;
  final $Res Function(_RemoveQuestions) _then;

/// Create a copy of AddQuizGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? indexes = null,}) {
  return _then(_RemoveQuestions(
null == indexes ? _self._indexes : indexes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
mixin _$AddQuizGameState {

 List<QuestionModel> get questions;
/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddQuizGameStateCopyWith<AddQuizGameState> get copyWith => _$AddQuizGameStateCopyWithImpl<AddQuizGameState>(this as AddQuizGameState, _$identity);





@override
String toString() {
  return 'AddQuizGameState(questions: $questions)';
}


}

/// @nodoc
abstract mixin class $AddQuizGameStateCopyWith<$Res>  {
  factory $AddQuizGameStateCopyWith(AddQuizGameState value, $Res Function(AddQuizGameState) _then) = _$AddQuizGameStateCopyWithImpl;
@useResult
$Res call({
 List<QuestionModel> questions
});




}
/// @nodoc
class _$AddQuizGameStateCopyWithImpl<$Res>
    implements $AddQuizGameStateCopyWith<$Res> {
  _$AddQuizGameStateCopyWithImpl(this._self, this._then);

  final AddQuizGameState _self;
  final $Res Function(AddQuizGameState) _then;

/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questions = null,}) {
  return _then(_self.copyWith(
questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AddQuizGameState].
extension AddQuizGameStatePatterns on AddQuizGameState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<QuestionModel> questions)?  initial,TResult Function( List<QuestionModel> questions)?  loading,TResult Function( List<QuestionModel> questions)?  loaded,TResult Function( List<QuestionModel> questions,  String error)?  errorMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.questions);case Loading() when loading != null:
return loading(_that.questions);case Loaded() when loaded != null:
return loaded(_that.questions);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.questions,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<QuestionModel> questions)  initial,required TResult Function( List<QuestionModel> questions)  loading,required TResult Function( List<QuestionModel> questions)  loaded,required TResult Function( List<QuestionModel> questions,  String error)  errorMessage,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.questions);case Loading():
return loading(_that.questions);case Loaded():
return loaded(_that.questions);case ErrorMessage():
return errorMessage(_that.questions,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<QuestionModel> questions)?  initial,TResult? Function( List<QuestionModel> questions)?  loading,TResult? Function( List<QuestionModel> questions)?  loaded,TResult? Function( List<QuestionModel> questions,  String error)?  errorMessage,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.questions);case Loading() when loading != null:
return loading(_that.questions);case Loaded() when loaded != null:
return loaded(_that.questions);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.questions,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AddQuizGameState {
  const Initial(final  List<QuestionModel> questions): _questions = questions;
  

 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);





@override
String toString() {
  return 'AddQuizGameState.initial(questions: $questions)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $AddQuizGameStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<QuestionModel> questions
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,}) {
  return _then(Initial(
null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}


}

/// @nodoc


class Loading implements AddQuizGameState {
  const Loading(final  List<QuestionModel> questions): _questions = questions;
  

 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);





@override
String toString() {
  return 'AddQuizGameState.loading(questions: $questions)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $AddQuizGameStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 List<QuestionModel> questions
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,}) {
  return _then(Loading(
null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}


}

/// @nodoc


class Loaded implements AddQuizGameState {
  const Loaded(final  List<QuestionModel> questions): _questions = questions;
  

 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'AddQuizGameState.loaded(questions: $questions)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $AddQuizGameStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 List<QuestionModel> questions
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,}) {
  return _then(Loaded(
null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}


}

/// @nodoc


class ErrorMessage implements AddQuizGameState {
  const ErrorMessage(final  List<QuestionModel> questions, this.error): _questions = questions;
  

 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  String error;

/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'AddQuizGameState.errorMessage(questions: $questions, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $AddQuizGameStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 List<QuestionModel> questions, String error
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of AddQuizGameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? error = null,}) {
  return _then(ErrorMessage(
null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
