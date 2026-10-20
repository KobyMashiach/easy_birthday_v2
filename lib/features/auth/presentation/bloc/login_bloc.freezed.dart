// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NavigateToRegister value)?  navigateToRegister,TResult Function( _LoginWithPassword value)?  loginWithPassword,TResult Function( _SendCode value)?  sendCode,TResult Function( _VerifyOtp value)?  verifyOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigateToRegister() when navigateToRegister != null:
return navigateToRegister(_that);case _LoginWithPassword() when loginWithPassword != null:
return loginWithPassword(_that);case _SendCode() when sendCode != null:
return sendCode(_that);case _VerifyOtp() when verifyOtp != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NavigateToRegister value)  navigateToRegister,required TResult Function( _LoginWithPassword value)  loginWithPassword,required TResult Function( _SendCode value)  sendCode,required TResult Function( _VerifyOtp value)  verifyOtp,}){
final _that = this;
switch (_that) {
case _NavigateToRegister():
return navigateToRegister(_that);case _LoginWithPassword():
return loginWithPassword(_that);case _SendCode():
return sendCode(_that);case _VerifyOtp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NavigateToRegister value)?  navigateToRegister,TResult? Function( _LoginWithPassword value)?  loginWithPassword,TResult? Function( _SendCode value)?  sendCode,TResult? Function( _VerifyOtp value)?  verifyOtp,}){
final _that = this;
switch (_that) {
case _NavigateToRegister() when navigateToRegister != null:
return navigateToRegister(_that);case _LoginWithPassword() when loginWithPassword != null:
return loginWithPassword(_that);case _SendCode() when sendCode != null:
return sendCode(_that);case _VerifyOtp() when verifyOtp != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  navigateToRegister,TResult Function( String phoneNumber,  String password,  bool isWatch)?  loginWithPassword,TResult Function( String phoneNumber,  bool isWatch)?  sendCode,TResult Function( String verificationId,  String otpCode,  String phoneNumber,  bool isWatch)?  verifyOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigateToRegister() when navigateToRegister != null:
return navigateToRegister();case _LoginWithPassword() when loginWithPassword != null:
return loginWithPassword(_that.phoneNumber,_that.password,_that.isWatch);case _SendCode() when sendCode != null:
return sendCode(_that.phoneNumber,_that.isWatch);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.verificationId,_that.otpCode,_that.phoneNumber,_that.isWatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  navigateToRegister,required TResult Function( String phoneNumber,  String password,  bool isWatch)  loginWithPassword,required TResult Function( String phoneNumber,  bool isWatch)  sendCode,required TResult Function( String verificationId,  String otpCode,  String phoneNumber,  bool isWatch)  verifyOtp,}) {final _that = this;
switch (_that) {
case _NavigateToRegister():
return navigateToRegister();case _LoginWithPassword():
return loginWithPassword(_that.phoneNumber,_that.password,_that.isWatch);case _SendCode():
return sendCode(_that.phoneNumber,_that.isWatch);case _VerifyOtp():
return verifyOtp(_that.verificationId,_that.otpCode,_that.phoneNumber,_that.isWatch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  navigateToRegister,TResult? Function( String phoneNumber,  String password,  bool isWatch)?  loginWithPassword,TResult? Function( String phoneNumber,  bool isWatch)?  sendCode,TResult? Function( String verificationId,  String otpCode,  String phoneNumber,  bool isWatch)?  verifyOtp,}) {final _that = this;
switch (_that) {
case _NavigateToRegister() when navigateToRegister != null:
return navigateToRegister();case _LoginWithPassword() when loginWithPassword != null:
return loginWithPassword(_that.phoneNumber,_that.password,_that.isWatch);case _SendCode() when sendCode != null:
return sendCode(_that.phoneNumber,_that.isWatch);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.verificationId,_that.otpCode,_that.phoneNumber,_that.isWatch);case _:
  return null;

}
}

}

/// @nodoc


class _NavigateToRegister implements LoginEvent {
  const _NavigateToRegister();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToRegister);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.navigateToRegister()';
}


}




/// @nodoc


class _LoginWithPassword implements LoginEvent {
  const _LoginWithPassword({required this.phoneNumber, required this.password, required this.isWatch});
  

 final  String phoneNumber;
 final  String password;
 final  bool isWatch;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginWithPasswordCopyWith<_LoginWithPassword> get copyWith => __$LoginWithPasswordCopyWithImpl<_LoginWithPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginWithPassword&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password)&&(identical(other.isWatch, isWatch) || other.isWatch == isWatch));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,password,isWatch);

@override
String toString() {
  return 'LoginEvent.loginWithPassword(phoneNumber: $phoneNumber, password: $password, isWatch: $isWatch)';
}


}

/// @nodoc
abstract mixin class _$LoginWithPasswordCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$LoginWithPasswordCopyWith(_LoginWithPassword value, $Res Function(_LoginWithPassword) _then) = __$LoginWithPasswordCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String password, bool isWatch
});




}
/// @nodoc
class __$LoginWithPasswordCopyWithImpl<$Res>
    implements _$LoginWithPasswordCopyWith<$Res> {
  __$LoginWithPasswordCopyWithImpl(this._self, this._then);

  final _LoginWithPassword _self;
  final $Res Function(_LoginWithPassword) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? password = null,Object? isWatch = null,}) {
  return _then(_LoginWithPassword(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isWatch: null == isWatch ? _self.isWatch : isWatch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SendCode implements LoginEvent {
  const _SendCode({required this.phoneNumber, required this.isWatch});
  

 final  String phoneNumber;
 final  bool isWatch;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendCodeCopyWith<_SendCode> get copyWith => __$SendCodeCopyWithImpl<_SendCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendCode&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isWatch, isWatch) || other.isWatch == isWatch));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,isWatch);

@override
String toString() {
  return 'LoginEvent.sendCode(phoneNumber: $phoneNumber, isWatch: $isWatch)';
}


}

/// @nodoc
abstract mixin class _$SendCodeCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$SendCodeCopyWith(_SendCode value, $Res Function(_SendCode) _then) = __$SendCodeCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, bool isWatch
});




}
/// @nodoc
class __$SendCodeCopyWithImpl<$Res>
    implements _$SendCodeCopyWith<$Res> {
  __$SendCodeCopyWithImpl(this._self, this._then);

  final _SendCode _self;
  final $Res Function(_SendCode) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? isWatch = null,}) {
  return _then(_SendCode(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,isWatch: null == isWatch ? _self.isWatch : isWatch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _VerifyOtp implements LoginEvent {
  const _VerifyOtp({required this.verificationId, required this.otpCode, required this.phoneNumber, required this.isWatch});
  

 final  String verificationId;
 final  String otpCode;
 final  String phoneNumber;
 final  bool isWatch;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpCopyWith<_VerifyOtp> get copyWith => __$VerifyOtpCopyWithImpl<_VerifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtp&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isWatch, isWatch) || other.isWatch == isWatch));
}


@override
int get hashCode => Object.hash(runtimeType,verificationId,otpCode,phoneNumber,isWatch);

@override
String toString() {
  return 'LoginEvent.verifyOtp(verificationId: $verificationId, otpCode: $otpCode, phoneNumber: $phoneNumber, isWatch: $isWatch)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$VerifyOtpCopyWith(_VerifyOtp value, $Res Function(_VerifyOtp) _then) = __$VerifyOtpCopyWithImpl;
@useResult
$Res call({
 String verificationId, String otpCode, String phoneNumber, bool isWatch
});




}
/// @nodoc
class __$VerifyOtpCopyWithImpl<$Res>
    implements _$VerifyOtpCopyWith<$Res> {
  __$VerifyOtpCopyWithImpl(this._self, this._then);

  final _VerifyOtp _self;
  final $Res Function(_VerifyOtp) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? otpCode = null,Object? phoneNumber = null,Object? isWatch = null,}) {
  return _then(_VerifyOtp(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,isWatch: null == isWatch ? _self.isWatch : isWatch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$LoginState {







@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( NavigateToRegister value)?  navigateToRegister,TResult Function( NavigateToOtp value)?  navigateToOtp,TResult Function( NavigateToHome value)?  navigateToHome,TResult Function( NavigateToOnboarding value)?  navigateToOnboarding,TResult Function( NavigateToFirstLogin value)?  navigateToFirstLogin,TResult Function( MessageToWatch value)?  messageToWatch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToRegister() when navigateToRegister != null:
return navigateToRegister(_that);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin(_that);case MessageToWatch() when messageToWatch != null:
return messageToWatch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( NavigateToRegister value)  navigateToRegister,required TResult Function( NavigateToOtp value)  navigateToOtp,required TResult Function( NavigateToHome value)  navigateToHome,required TResult Function( NavigateToOnboarding value)  navigateToOnboarding,required TResult Function( NavigateToFirstLogin value)  navigateToFirstLogin,required TResult Function( MessageToWatch value)  messageToWatch,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case ErrorMessage():
return errorMessage(_that);case NavigateToRegister():
return navigateToRegister(_that);case NavigateToOtp():
return navigateToOtp(_that);case NavigateToHome():
return navigateToHome(_that);case NavigateToOnboarding():
return navigateToOnboarding(_that);case NavigateToFirstLogin():
return navigateToFirstLogin(_that);case MessageToWatch():
return messageToWatch(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( NavigateToRegister value)?  navigateToRegister,TResult? Function( NavigateToOtp value)?  navigateToOtp,TResult? Function( NavigateToHome value)?  navigateToHome,TResult? Function( NavigateToOnboarding value)?  navigateToOnboarding,TResult? Function( NavigateToFirstLogin value)?  navigateToFirstLogin,TResult? Function( MessageToWatch value)?  messageToWatch,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToRegister() when navigateToRegister != null:
return navigateToRegister(_that);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin(_that);case MessageToWatch() when messageToWatch != null:
return messageToWatch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String error)?  errorMessage,TResult Function()?  navigateToRegister,TResult Function( String verificationId)?  navigateToOtp,TResult Function()?  navigateToHome,TResult Function()?  navigateToOnboarding,TResult Function()?  navigateToFirstLogin,TResult Function( String message)?  messageToWatch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case ErrorMessage() when errorMessage != null:
return errorMessage(_that.error);case NavigateToRegister() when navigateToRegister != null:
return navigateToRegister();case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that.verificationId);case NavigateToHome() when navigateToHome != null:
return navigateToHome();case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin();case MessageToWatch() when messageToWatch != null:
return messageToWatch(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String error)  errorMessage,required TResult Function()  navigateToRegister,required TResult Function( String verificationId)  navigateToOtp,required TResult Function()  navigateToHome,required TResult Function()  navigateToOnboarding,required TResult Function()  navigateToFirstLogin,required TResult Function( String message)  messageToWatch,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case ErrorMessage():
return errorMessage(_that.error);case NavigateToRegister():
return navigateToRegister();case NavigateToOtp():
return navigateToOtp(_that.verificationId);case NavigateToHome():
return navigateToHome();case NavigateToOnboarding():
return navigateToOnboarding();case NavigateToFirstLogin():
return navigateToFirstLogin();case MessageToWatch():
return messageToWatch(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String error)?  errorMessage,TResult? Function()?  navigateToRegister,TResult? Function( String verificationId)?  navigateToOtp,TResult? Function()?  navigateToHome,TResult? Function()?  navigateToOnboarding,TResult? Function()?  navigateToFirstLogin,TResult? Function( String message)?  messageToWatch,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case ErrorMessage() when errorMessage != null:
return errorMessage(_that.error);case NavigateToRegister() when navigateToRegister != null:
return navigateToRegister();case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that.verificationId);case NavigateToHome() when navigateToHome != null:
return navigateToHome();case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin();case MessageToWatch() when messageToWatch != null:
return messageToWatch(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements LoginState {
  const Initial();
  








@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class Loading implements LoginState {
  const Loading();
  








@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class ErrorMessage implements LoginState {
  const ErrorMessage(this.error);
  

 final  String error;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'LoginState.errorMessage(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorMessage(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateToRegister implements LoginState {
  const NavigateToRegister();
  








@override
String toString() {
  return 'LoginState.navigateToRegister()';
}


}




/// @nodoc


class NavigateToOtp implements LoginState {
  const NavigateToOtp(this.verificationId);
  

 final  String verificationId;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToOtpCopyWith<NavigateToOtp> get copyWith => _$NavigateToOtpCopyWithImpl<NavigateToOtp>(this, _$identity);





@override
String toString() {
  return 'LoginState.navigateToOtp(verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class $NavigateToOtpCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $NavigateToOtpCopyWith(NavigateToOtp value, $Res Function(NavigateToOtp) _then) = _$NavigateToOtpCopyWithImpl;
@useResult
$Res call({
 String verificationId
});




}
/// @nodoc
class _$NavigateToOtpCopyWithImpl<$Res>
    implements $NavigateToOtpCopyWith<$Res> {
  _$NavigateToOtpCopyWithImpl(this._self, this._then);

  final NavigateToOtp _self;
  final $Res Function(NavigateToOtp) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,}) {
  return _then(NavigateToOtp(
null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateToHome implements LoginState {
  const NavigateToHome();
  








@override
String toString() {
  return 'LoginState.navigateToHome()';
}


}




/// @nodoc


class NavigateToOnboarding implements LoginState {
  const NavigateToOnboarding();
  








@override
String toString() {
  return 'LoginState.navigateToOnboarding()';
}


}




/// @nodoc


class NavigateToFirstLogin implements LoginState {
  const NavigateToFirstLogin();
  








@override
String toString() {
  return 'LoginState.navigateToFirstLogin()';
}


}




/// @nodoc


class MessageToWatch implements LoginState {
  const MessageToWatch(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageToWatchCopyWith<MessageToWatch> get copyWith => _$MessageToWatchCopyWithImpl<MessageToWatch>(this, _$identity);





@override
String toString() {
  return 'LoginState.messageToWatch(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageToWatchCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $MessageToWatchCopyWith(MessageToWatch value, $Res Function(MessageToWatch) _then) = _$MessageToWatchCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MessageToWatchCopyWithImpl<$Res>
    implements $MessageToWatchCopyWith<$Res> {
  _$MessageToWatchCopyWithImpl(this._self, this._then);

  final MessageToWatch _self;
  final $Res Function(MessageToWatch) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageToWatch(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
