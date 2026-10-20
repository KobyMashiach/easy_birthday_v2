// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangePasswordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangePasswordEvent()';
}


}

/// @nodoc
class $ChangePasswordEventCopyWith<$Res>  {
$ChangePasswordEventCopyWith(ChangePasswordEvent _, $Res Function(ChangePasswordEvent) __);
}


/// Adds pattern-matching-related methods to [ChangePasswordEvent].
extension ChangePasswordEventPatterns on ChangePasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SendOtp value)?  sendOtp,TResult Function( _SendOtpAgain value)?  sendOtpAgain,TResult Function( _VerifyOtp value)?  verifyOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _SendOtpAgain() when sendOtpAgain != null:
return sendOtpAgain(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SendOtp value)  sendOtp,required TResult Function( _SendOtpAgain value)  sendOtpAgain,required TResult Function( _VerifyOtp value)  verifyOtp,}){
final _that = this;
switch (_that) {
case _SendOtp():
return sendOtp(_that);case _SendOtpAgain():
return sendOtpAgain(_that);case _VerifyOtp():
return verifyOtp(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SendOtp value)?  sendOtp,TResult? Function( _SendOtpAgain value)?  sendOtpAgain,TResult? Function( _VerifyOtp value)?  verifyOtp,}){
final _that = this;
switch (_that) {
case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _SendOtpAgain() when sendOtpAgain != null:
return sendOtpAgain(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  sendOtp,TResult Function()?  sendOtpAgain,TResult Function( String otpCode)?  verifyOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOtp() when sendOtp != null:
return sendOtp();case _SendOtpAgain() when sendOtpAgain != null:
return sendOtpAgain();case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.otpCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  sendOtp,required TResult Function()  sendOtpAgain,required TResult Function( String otpCode)  verifyOtp,}) {final _that = this;
switch (_that) {
case _SendOtp():
return sendOtp();case _SendOtpAgain():
return sendOtpAgain();case _VerifyOtp():
return verifyOtp(_that.otpCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  sendOtp,TResult? Function()?  sendOtpAgain,TResult? Function( String otpCode)?  verifyOtp,}) {final _that = this;
switch (_that) {
case _SendOtp() when sendOtp != null:
return sendOtp();case _SendOtpAgain() when sendOtpAgain != null:
return sendOtpAgain();case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.otpCode);case _:
  return null;

}
}

}

/// @nodoc


class _SendOtp implements ChangePasswordEvent {
  const _SendOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangePasswordEvent.sendOtp()';
}


}




/// @nodoc


class _SendOtpAgain implements ChangePasswordEvent {
  const _SendOtpAgain();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtpAgain);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangePasswordEvent.sendOtpAgain()';
}


}




/// @nodoc


class _VerifyOtp implements ChangePasswordEvent {
  const _VerifyOtp(this.otpCode);
  

 final  String otpCode;

/// Create a copy of ChangePasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpCopyWith<_VerifyOtp> get copyWith => __$VerifyOtpCopyWithImpl<_VerifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtp&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode));
}


@override
int get hashCode => Object.hash(runtimeType,otpCode);

@override
String toString() {
  return 'ChangePasswordEvent.verifyOtp(otpCode: $otpCode)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpCopyWith<$Res> implements $ChangePasswordEventCopyWith<$Res> {
  factory _$VerifyOtpCopyWith(_VerifyOtp value, $Res Function(_VerifyOtp) _then) = __$VerifyOtpCopyWithImpl;
@useResult
$Res call({
 String otpCode
});




}
/// @nodoc
class __$VerifyOtpCopyWithImpl<$Res>
    implements _$VerifyOtpCopyWith<$Res> {
  __$VerifyOtpCopyWithImpl(this._self, this._then);

  final _VerifyOtp _self;
  final $Res Function(_VerifyOtp) _then;

/// Create a copy of ChangePasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otpCode = null,}) {
  return _then(_VerifyOtp(
null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ChangePasswordState {

 bool get otpVerified;
/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordStateCopyWith<ChangePasswordState> get copyWith => _$ChangePasswordStateCopyWithImpl<ChangePasswordState>(this as ChangePasswordState, _$identity);





@override
String toString() {
  return 'ChangePasswordState(otpVerified: $otpVerified)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordStateCopyWith<$Res>  {
  factory $ChangePasswordStateCopyWith(ChangePasswordState value, $Res Function(ChangePasswordState) _then) = _$ChangePasswordStateCopyWithImpl;
@useResult
$Res call({
 bool otpVerified
});




}
/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._self, this._then);

  final ChangePasswordState _self;
  final $Res Function(ChangePasswordState) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otpVerified = null,}) {
  return _then(_self.copyWith(
otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordState].
extension ChangePasswordStatePatterns on ChangePasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( NavigateToOtp value)?  navigateToOtp,TResult Function( VerificationSucceeded value)?  verificationSucceeded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that);case VerificationSucceeded() when verificationSucceeded != null:
return verificationSucceeded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( NavigateToOtp value)  navigateToOtp,required TResult Function( VerificationSucceeded value)  verificationSucceeded,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case ErrorMessage():
return errorMessage(_that);case NavigateToOtp():
return navigateToOtp(_that);case VerificationSucceeded():
return verificationSucceeded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( NavigateToOtp value)?  navigateToOtp,TResult? Function( VerificationSucceeded value)?  verificationSucceeded,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that);case VerificationSucceeded() when verificationSucceeded != null:
return verificationSucceeded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool otpVerified)?  initial,TResult Function( bool otpVerified)?  loading,TResult Function( bool otpVerified)?  loaded,TResult Function( bool otpVerified,  String error)?  errorMessage,TResult Function( bool otpVerified,  String verificationId)?  navigateToOtp,TResult Function( bool otpVerified)?  verificationSucceeded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.otpVerified);case Loading() when loading != null:
return loading(_that.otpVerified);case Loaded() when loaded != null:
return loaded(_that.otpVerified);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.otpVerified,_that.error);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that.otpVerified,_that.verificationId);case VerificationSucceeded() when verificationSucceeded != null:
return verificationSucceeded(_that.otpVerified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool otpVerified)  initial,required TResult Function( bool otpVerified)  loading,required TResult Function( bool otpVerified)  loaded,required TResult Function( bool otpVerified,  String error)  errorMessage,required TResult Function( bool otpVerified,  String verificationId)  navigateToOtp,required TResult Function( bool otpVerified)  verificationSucceeded,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.otpVerified);case Loading():
return loading(_that.otpVerified);case Loaded():
return loaded(_that.otpVerified);case ErrorMessage():
return errorMessage(_that.otpVerified,_that.error);case NavigateToOtp():
return navigateToOtp(_that.otpVerified,_that.verificationId);case VerificationSucceeded():
return verificationSucceeded(_that.otpVerified);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool otpVerified)?  initial,TResult? Function( bool otpVerified)?  loading,TResult? Function( bool otpVerified)?  loaded,TResult? Function( bool otpVerified,  String error)?  errorMessage,TResult? Function( bool otpVerified,  String verificationId)?  navigateToOtp,TResult? Function( bool otpVerified)?  verificationSucceeded,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.otpVerified);case Loading() when loading != null:
return loading(_that.otpVerified);case Loaded() when loaded != null:
return loaded(_that.otpVerified);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.otpVerified,_that.error);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that.otpVerified,_that.verificationId);case VerificationSucceeded() when verificationSucceeded != null:
return verificationSucceeded(_that.otpVerified);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ChangePasswordState {
  const Initial({required this.otpVerified});
  

@override final  bool otpVerified;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);





@override
String toString() {
  return 'ChangePasswordState.initial(otpVerified: $otpVerified)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 bool otpVerified
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpVerified = null,}) {
  return _then(Initial(
otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Loading implements ChangePasswordState {
  const Loading({required this.otpVerified});
  

@override final  bool otpVerified;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);





@override
String toString() {
  return 'ChangePasswordState.loading(otpVerified: $otpVerified)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 bool otpVerified
});




}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpVerified = null,}) {
  return _then(Loading(
otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Loaded implements ChangePasswordState {
  const Loaded({required this.otpVerified});
  

@override final  bool otpVerified;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'ChangePasswordState.loaded(otpVerified: $otpVerified)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 bool otpVerified
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpVerified = null,}) {
  return _then(Loaded(
otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ErrorMessage implements ChangePasswordState {
  const ErrorMessage({required this.otpVerified, required this.error});
  

@override final  bool otpVerified;
 final  String error;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'ChangePasswordState.errorMessage(otpVerified: $otpVerified, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 bool otpVerified, String error
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpVerified = null,Object? error = null,}) {
  return _then(ErrorMessage(
otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateToOtp implements ChangePasswordState {
  const NavigateToOtp({required this.otpVerified, required this.verificationId});
  

@override final  bool otpVerified;
 final  String verificationId;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToOtpCopyWith<NavigateToOtp> get copyWith => _$NavigateToOtpCopyWithImpl<NavigateToOtp>(this, _$identity);





@override
String toString() {
  return 'ChangePasswordState.navigateToOtp(otpVerified: $otpVerified, verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class $NavigateToOtpCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $NavigateToOtpCopyWith(NavigateToOtp value, $Res Function(NavigateToOtp) _then) = _$NavigateToOtpCopyWithImpl;
@override @useResult
$Res call({
 bool otpVerified, String verificationId
});




}
/// @nodoc
class _$NavigateToOtpCopyWithImpl<$Res>
    implements $NavigateToOtpCopyWith<$Res> {
  _$NavigateToOtpCopyWithImpl(this._self, this._then);

  final NavigateToOtp _self;
  final $Res Function(NavigateToOtp) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpVerified = null,Object? verificationId = null,}) {
  return _then(NavigateToOtp(
otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VerificationSucceeded implements ChangePasswordState {
  const VerificationSucceeded({required this.otpVerified});
  

@override final  bool otpVerified;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationSucceededCopyWith<VerificationSucceeded> get copyWith => _$VerificationSucceededCopyWithImpl<VerificationSucceeded>(this, _$identity);





@override
String toString() {
  return 'ChangePasswordState.verificationSucceeded(otpVerified: $otpVerified)';
}


}

/// @nodoc
abstract mixin class $VerificationSucceededCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $VerificationSucceededCopyWith(VerificationSucceeded value, $Res Function(VerificationSucceeded) _then) = _$VerificationSucceededCopyWithImpl;
@override @useResult
$Res call({
 bool otpVerified
});




}
/// @nodoc
class _$VerificationSucceededCopyWithImpl<$Res>
    implements $VerificationSucceededCopyWith<$Res> {
  _$VerificationSucceededCopyWithImpl(this._self, this._then);

  final VerificationSucceeded _self;
  final $Res Function(VerificationSucceeded) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpVerified = null,}) {
  return _then(VerificationSucceeded(
otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
