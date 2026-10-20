// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wear_os_login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WearOsLoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WearOsLoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WearOsLoginEvent()';
}


}

/// @nodoc
class $WearOsLoginEventCopyWith<$Res>  {
$WearOsLoginEventCopyWith(WearOsLoginEvent _, $Res Function(WearOsLoginEvent) __);
}


/// Adds pattern-matching-related methods to [WearOsLoginEvent].
extension WearOsLoginEventPatterns on WearOsLoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _RequestLogin value)?  requestLogin,TResult Function( _ReplyReceived value)?  replyReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _RequestLogin() when requestLogin != null:
return requestLogin(_that);case _ReplyReceived() when replyReceived != null:
return replyReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _RequestLogin value)  requestLogin,required TResult Function( _ReplyReceived value)  replyReceived,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _RequestLogin():
return requestLogin(_that);case _ReplyReceived():
return replyReceived(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _RequestLogin value)?  requestLogin,TResult? Function( _ReplyReceived value)?  replyReceived,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _RequestLogin() when requestLogin != null:
return requestLogin(_that);case _ReplyReceived() when replyReceived != null:
return replyReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  requestLogin,TResult Function( PhoneLoginReply reply)?  replyReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _RequestLogin() when requestLogin != null:
return requestLogin();case _ReplyReceived() when replyReceived != null:
return replyReceived(_that.reply);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  requestLogin,required TResult Function( PhoneLoginReply reply)  replyReceived,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _RequestLogin():
return requestLogin();case _ReplyReceived():
return replyReceived(_that.reply);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  requestLogin,TResult? Function( PhoneLoginReply reply)?  replyReceived,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _RequestLogin() when requestLogin != null:
return requestLogin();case _ReplyReceived() when replyReceived != null:
return replyReceived(_that.reply);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements WearOsLoginEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WearOsLoginEvent.init()';
}


}




/// @nodoc


class _RequestLogin implements WearOsLoginEvent {
  const _RequestLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WearOsLoginEvent.requestLogin()';
}


}




/// @nodoc


class _ReplyReceived implements WearOsLoginEvent {
  const _ReplyReceived(this.reply);
  

 final  PhoneLoginReply reply;

/// Create a copy of WearOsLoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyReceivedCopyWith<_ReplyReceived> get copyWith => __$ReplyReceivedCopyWithImpl<_ReplyReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyReceived&&(identical(other.reply, reply) || other.reply == reply));
}


@override
int get hashCode => Object.hash(runtimeType,reply);

@override
String toString() {
  return 'WearOsLoginEvent.replyReceived(reply: $reply)';
}


}

/// @nodoc
abstract mixin class _$ReplyReceivedCopyWith<$Res> implements $WearOsLoginEventCopyWith<$Res> {
  factory _$ReplyReceivedCopyWith(_ReplyReceived value, $Res Function(_ReplyReceived) _then) = __$ReplyReceivedCopyWithImpl;
@useResult
$Res call({
 PhoneLoginReply reply
});




}
/// @nodoc
class __$ReplyReceivedCopyWithImpl<$Res>
    implements _$ReplyReceivedCopyWith<$Res> {
  __$ReplyReceivedCopyWithImpl(this._self, this._then);

  final _ReplyReceived _self;
  final $Res Function(_ReplyReceived) _then;

/// Create a copy of WearOsLoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reply = null,}) {
  return _then(_ReplyReceived(
null == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as PhoneLoginReply,
  ));
}


}

/// @nodoc
mixin _$WearOsLoginState {

 WearOsLoginStatus get status;
/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WearOsLoginStateCopyWith<WearOsLoginState> get copyWith => _$WearOsLoginStateCopyWithImpl<WearOsLoginState>(this as WearOsLoginState, _$identity);





@override
String toString() {
  return 'WearOsLoginState(status: $status)';
}


}

/// @nodoc
abstract mixin class $WearOsLoginStateCopyWith<$Res>  {
  factory $WearOsLoginStateCopyWith(WearOsLoginState value, $Res Function(WearOsLoginState) _then) = _$WearOsLoginStateCopyWithImpl;
@useResult
$Res call({
 WearOsLoginStatus status
});




}
/// @nodoc
class _$WearOsLoginStateCopyWithImpl<$Res>
    implements $WearOsLoginStateCopyWith<$Res> {
  _$WearOsLoginStateCopyWithImpl(this._self, this._then);

  final WearOsLoginState _self;
  final $Res Function(WearOsLoginState) _then;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WearOsLoginStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [WearOsLoginState].
extension WearOsLoginStatePatterns on WearOsLoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( NavigateToCategories value)?  navigateToCategories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToCategories() when navigateToCategories != null:
return navigateToCategories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( NavigateToCategories value)  navigateToCategories,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case ErrorMessage():
return errorMessage(_that);case NavigateToCategories():
return navigateToCategories(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( NavigateToCategories value)?  navigateToCategories,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToCategories() when navigateToCategories != null:
return navigateToCategories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( WearOsLoginStatus status)?  initial,TResult Function( WearOsLoginStatus status)?  loading,TResult Function( WearOsLoginStatus status)?  loaded,TResult Function( WearOsLoginStatus status,  String error)?  errorMessage,TResult Function( WearOsLoginStatus status,  String eventId)?  navigateToCategories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.status);case Loading() when loading != null:
return loading(_that.status);case Loaded() when loaded != null:
return loaded(_that.status);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.status,_that.error);case NavigateToCategories() when navigateToCategories != null:
return navigateToCategories(_that.status,_that.eventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( WearOsLoginStatus status)  initial,required TResult Function( WearOsLoginStatus status)  loading,required TResult Function( WearOsLoginStatus status)  loaded,required TResult Function( WearOsLoginStatus status,  String error)  errorMessage,required TResult Function( WearOsLoginStatus status,  String eventId)  navigateToCategories,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.status);case Loading():
return loading(_that.status);case Loaded():
return loaded(_that.status);case ErrorMessage():
return errorMessage(_that.status,_that.error);case NavigateToCategories():
return navigateToCategories(_that.status,_that.eventId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( WearOsLoginStatus status)?  initial,TResult? Function( WearOsLoginStatus status)?  loading,TResult? Function( WearOsLoginStatus status)?  loaded,TResult? Function( WearOsLoginStatus status,  String error)?  errorMessage,TResult? Function( WearOsLoginStatus status,  String eventId)?  navigateToCategories,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.status);case Loading() when loading != null:
return loading(_that.status);case Loaded() when loaded != null:
return loaded(_that.status);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.status,_that.error);case NavigateToCategories() when navigateToCategories != null:
return navigateToCategories(_that.status,_that.eventId);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements WearOsLoginState {
  const Initial(this.status);
  

@override final  WearOsLoginStatus status;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);





@override
String toString() {
  return 'WearOsLoginState.initial(status: $status)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $WearOsLoginStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 WearOsLoginStatus status
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(Initial(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WearOsLoginStatus,
  ));
}


}

/// @nodoc


class Loading implements WearOsLoginState {
  const Loading(this.status);
  

@override final  WearOsLoginStatus status;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);





@override
String toString() {
  return 'WearOsLoginState.loading(status: $status)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $WearOsLoginStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 WearOsLoginStatus status
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(Loading(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WearOsLoginStatus,
  ));
}


}

/// @nodoc


class Loaded implements WearOsLoginState {
  const Loaded(this.status);
  

@override final  WearOsLoginStatus status;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'WearOsLoginState.loaded(status: $status)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $WearOsLoginStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 WearOsLoginStatus status
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(Loaded(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WearOsLoginStatus,
  ));
}


}

/// @nodoc


class ErrorMessage implements WearOsLoginState {
  const ErrorMessage(this.status, this.error);
  

@override final  WearOsLoginStatus status;
 final  String error;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'WearOsLoginState.errorMessage(status: $status, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $WearOsLoginStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 WearOsLoginStatus status, String error
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? error = null,}) {
  return _then(ErrorMessage(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WearOsLoginStatus,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateToCategories implements WearOsLoginState {
  const NavigateToCategories(this.status, this.eventId);
  

@override final  WearOsLoginStatus status;
 final  String eventId;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToCategoriesCopyWith<NavigateToCategories> get copyWith => _$NavigateToCategoriesCopyWithImpl<NavigateToCategories>(this, _$identity);





@override
String toString() {
  return 'WearOsLoginState.navigateToCategories(status: $status, eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class $NavigateToCategoriesCopyWith<$Res> implements $WearOsLoginStateCopyWith<$Res> {
  factory $NavigateToCategoriesCopyWith(NavigateToCategories value, $Res Function(NavigateToCategories) _then) = _$NavigateToCategoriesCopyWithImpl;
@override @useResult
$Res call({
 WearOsLoginStatus status, String eventId
});




}
/// @nodoc
class _$NavigateToCategoriesCopyWithImpl<$Res>
    implements $NavigateToCategoriesCopyWith<$Res> {
  _$NavigateToCategoriesCopyWithImpl(this._self, this._then);

  final NavigateToCategories _self;
  final $Res Function(NavigateToCategories) _then;

/// Create a copy of WearOsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? eventId = null,}) {
  return _then(NavigateToCategories(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WearOsLoginStatus,null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
