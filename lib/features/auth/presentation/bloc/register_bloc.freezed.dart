// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterEvent].
extension RegisterEventPatterns on RegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NavigateToLogin value)?  navigateToLogin,TResult Function( _SendCode value)?  sendCode,TResult Function( _VerifyOtp value)?  verifyOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case _SendCode() when sendCode != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NavigateToLogin value)  navigateToLogin,required TResult Function( _SendCode value)  sendCode,required TResult Function( _VerifyOtp value)  verifyOtp,}){
final _that = this;
switch (_that) {
case _NavigateToLogin():
return navigateToLogin(_that);case _SendCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NavigateToLogin value)?  navigateToLogin,TResult? Function( _SendCode value)?  sendCode,TResult? Function( _VerifyOtp value)?  verifyOtp,}){
final _that = this;
switch (_that) {
case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case _SendCode() when sendCode != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  navigateToLogin,TResult Function( String phoneNumber,  String password)?  sendCode,TResult Function( String verificationId,  String otpCode,  String phoneNumber,  String password)?  verifyOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case _SendCode() when sendCode != null:
return sendCode(_that.phoneNumber,_that.password);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.verificationId,_that.otpCode,_that.phoneNumber,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  navigateToLogin,required TResult Function( String phoneNumber,  String password)  sendCode,required TResult Function( String verificationId,  String otpCode,  String phoneNumber,  String password)  verifyOtp,}) {final _that = this;
switch (_that) {
case _NavigateToLogin():
return navigateToLogin();case _SendCode():
return sendCode(_that.phoneNumber,_that.password);case _VerifyOtp():
return verifyOtp(_that.verificationId,_that.otpCode,_that.phoneNumber,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  navigateToLogin,TResult? Function( String phoneNumber,  String password)?  sendCode,TResult? Function( String verificationId,  String otpCode,  String phoneNumber,  String password)?  verifyOtp,}) {final _that = this;
switch (_that) {
case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case _SendCode() when sendCode != null:
return sendCode(_that.phoneNumber,_that.password);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.verificationId,_that.otpCode,_that.phoneNumber,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _NavigateToLogin implements RegisterEvent {
  const _NavigateToLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.navigateToLogin()';
}


}




/// @nodoc


class _SendCode implements RegisterEvent {
  const _SendCode({required this.phoneNumber, required this.password});
  

 final  String phoneNumber;
 final  String password;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendCodeCopyWith<_SendCode> get copyWith => __$SendCodeCopyWithImpl<_SendCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendCode&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber,password);

@override
String toString() {
  return 'RegisterEvent.sendCode(phoneNumber: $phoneNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SendCodeCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory _$SendCodeCopyWith(_SendCode value, $Res Function(_SendCode) _then) = __$SendCodeCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String password
});




}
/// @nodoc
class __$SendCodeCopyWithImpl<$Res>
    implements _$SendCodeCopyWith<$Res> {
  __$SendCodeCopyWithImpl(this._self, this._then);

  final _SendCode _self;
  final $Res Function(_SendCode) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? password = null,}) {
  return _then(_SendCode(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VerifyOtp implements RegisterEvent {
  const _VerifyOtp({required this.verificationId, required this.otpCode, required this.phoneNumber, required this.password});
  

 final  String verificationId;
 final  String otpCode;
 final  String phoneNumber;
 final  String password;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpCopyWith<_VerifyOtp> get copyWith => __$VerifyOtpCopyWithImpl<_VerifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtp&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,verificationId,otpCode,phoneNumber,password);

@override
String toString() {
  return 'RegisterEvent.verifyOtp(verificationId: $verificationId, otpCode: $otpCode, phoneNumber: $phoneNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory _$VerifyOtpCopyWith(_VerifyOtp value, $Res Function(_VerifyOtp) _then) = __$VerifyOtpCopyWithImpl;
@useResult
$Res call({
 String verificationId, String otpCode, String phoneNumber, String password
});




}
/// @nodoc
class __$VerifyOtpCopyWithImpl<$Res>
    implements _$VerifyOtpCopyWith<$Res> {
  __$VerifyOtpCopyWithImpl(this._self, this._then);

  final _VerifyOtp _self;
  final $Res Function(_VerifyOtp) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? otpCode = null,Object? phoneNumber = null,Object? password = null,}) {
  return _then(_VerifyOtp(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RegisterState {







@override
String toString() {
  return 'RegisterState()';
}


}

/// @nodoc
class $RegisterStateCopyWith<$Res>  {
$RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( PhoneExists value)?  phoneExists,TResult Function( NavigateToLogin value)?  navigateToLogin,TResult Function( NavigateToOtp value)?  navigateToOtp,TResult Function( NavigateToOnboarding value)?  navigateToOnboarding,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case PhoneExists() when phoneExists != null:
return phoneExists(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( PhoneExists value)  phoneExists,required TResult Function( NavigateToLogin value)  navigateToLogin,required TResult Function( NavigateToOtp value)  navigateToOtp,required TResult Function( NavigateToOnboarding value)  navigateToOnboarding,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case ErrorMessage():
return errorMessage(_that);case PhoneExists():
return phoneExists(_that);case NavigateToLogin():
return navigateToLogin(_that);case NavigateToOtp():
return navigateToOtp(_that);case NavigateToOnboarding():
return navigateToOnboarding(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( PhoneExists value)?  phoneExists,TResult? Function( NavigateToLogin value)?  navigateToLogin,TResult? Function( NavigateToOtp value)?  navigateToOtp,TResult? Function( NavigateToOnboarding value)?  navigateToOnboarding,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case PhoneExists() when phoneExists != null:
return phoneExists(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String error)?  errorMessage,TResult Function()?  phoneExists,TResult Function()?  navigateToLogin,TResult Function( String verificationId)?  navigateToOtp,TResult Function()?  navigateToOnboarding,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case ErrorMessage() when errorMessage != null:
return errorMessage(_that.error);case PhoneExists() when phoneExists != null:
return phoneExists();case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that.verificationId);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String error)  errorMessage,required TResult Function()  phoneExists,required TResult Function()  navigateToLogin,required TResult Function( String verificationId)  navigateToOtp,required TResult Function()  navigateToOnboarding,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case ErrorMessage():
return errorMessage(_that.error);case PhoneExists():
return phoneExists();case NavigateToLogin():
return navigateToLogin();case NavigateToOtp():
return navigateToOtp(_that.verificationId);case NavigateToOnboarding():
return navigateToOnboarding();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String error)?  errorMessage,TResult? Function()?  phoneExists,TResult? Function()?  navigateToLogin,TResult? Function( String verificationId)?  navigateToOtp,TResult? Function()?  navigateToOnboarding,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case ErrorMessage() when errorMessage != null:
return errorMessage(_that.error);case PhoneExists() when phoneExists != null:
return phoneExists();case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case NavigateToOtp() when navigateToOtp != null:
return navigateToOtp(_that.verificationId);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements RegisterState {
  const Initial();
  








@override
String toString() {
  return 'RegisterState.initial()';
}


}




/// @nodoc


class Loading implements RegisterState {
  const Loading();
  








@override
String toString() {
  return 'RegisterState.loading()';
}


}




/// @nodoc


class ErrorMessage implements RegisterState {
  const ErrorMessage(this.error);
  

 final  String error;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'RegisterState.errorMessage(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
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

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorMessage(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PhoneExists implements RegisterState {
  const PhoneExists();
  








@override
String toString() {
  return 'RegisterState.phoneExists()';
}


}




/// @nodoc


class NavigateToLogin implements RegisterState {
  const NavigateToLogin();
  








@override
String toString() {
  return 'RegisterState.navigateToLogin()';
}


}




/// @nodoc


class NavigateToOtp implements RegisterState {
  const NavigateToOtp(this.verificationId);
  

 final  String verificationId;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToOtpCopyWith<NavigateToOtp> get copyWith => _$NavigateToOtpCopyWithImpl<NavigateToOtp>(this, _$identity);





@override
String toString() {
  return 'RegisterState.navigateToOtp(verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class $NavigateToOtpCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
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

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,}) {
  return _then(NavigateToOtp(
null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateToOnboarding implements RegisterState {
  const NavigateToOnboarding();
  








@override
String toString() {
  return 'RegisterState.navigateToOnboarding()';
}


}




// dart format on
