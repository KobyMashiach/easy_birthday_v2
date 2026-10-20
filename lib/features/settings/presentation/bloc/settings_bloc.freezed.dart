// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangeColor value)?  changeColor,TResult Function( _ChangeLanguage value)?  changeLanguage,TResult Function( _ChangeGender value)?  changeGender,TResult Function( _Logout value)?  logout,TResult Function( _DeleteAccount value)?  deleteAccount,TResult Function( _ChangePassword value)?  changePassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeColor() when changeColor != null:
return changeColor(_that);case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that);case _ChangeGender() when changeGender != null:
return changeGender(_that);case _Logout() when logout != null:
return logout(_that);case _DeleteAccount() when deleteAccount != null:
return deleteAccount(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangeColor value)  changeColor,required TResult Function( _ChangeLanguage value)  changeLanguage,required TResult Function( _ChangeGender value)  changeGender,required TResult Function( _Logout value)  logout,required TResult Function( _DeleteAccount value)  deleteAccount,required TResult Function( _ChangePassword value)  changePassword,}){
final _that = this;
switch (_that) {
case _ChangeColor():
return changeColor(_that);case _ChangeLanguage():
return changeLanguage(_that);case _ChangeGender():
return changeGender(_that);case _Logout():
return logout(_that);case _DeleteAccount():
return deleteAccount(_that);case _ChangePassword():
return changePassword(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangeColor value)?  changeColor,TResult? Function( _ChangeLanguage value)?  changeLanguage,TResult? Function( _ChangeGender value)?  changeGender,TResult? Function( _Logout value)?  logout,TResult? Function( _DeleteAccount value)?  deleteAccount,TResult? Function( _ChangePassword value)?  changePassword,}){
final _that = this;
switch (_that) {
case _ChangeColor() when changeColor != null:
return changeColor(_that);case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that);case _ChangeGender() when changeGender != null:
return changeGender(_that);case _Logout() when logout != null:
return logout(_that);case _DeleteAccount() when deleteAccount != null:
return deleteAccount(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Color color)?  changeColor,TResult Function( String languageCode)?  changeLanguage,TResult Function( String ownerGender,  String partnerGender)?  changeGender,TResult Function()?  logout,TResult Function()?  deleteAccount,TResult Function( String password)?  changePassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeColor() when changeColor != null:
return changeColor(_that.color);case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that.languageCode);case _ChangeGender() when changeGender != null:
return changeGender(_that.ownerGender,_that.partnerGender);case _Logout() when logout != null:
return logout();case _DeleteAccount() when deleteAccount != null:
return deleteAccount();case _ChangePassword() when changePassword != null:
return changePassword(_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Color color)  changeColor,required TResult Function( String languageCode)  changeLanguage,required TResult Function( String ownerGender,  String partnerGender)  changeGender,required TResult Function()  logout,required TResult Function()  deleteAccount,required TResult Function( String password)  changePassword,}) {final _that = this;
switch (_that) {
case _ChangeColor():
return changeColor(_that.color);case _ChangeLanguage():
return changeLanguage(_that.languageCode);case _ChangeGender():
return changeGender(_that.ownerGender,_that.partnerGender);case _Logout():
return logout();case _DeleteAccount():
return deleteAccount();case _ChangePassword():
return changePassword(_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Color color)?  changeColor,TResult? Function( String languageCode)?  changeLanguage,TResult? Function( String ownerGender,  String partnerGender)?  changeGender,TResult? Function()?  logout,TResult? Function()?  deleteAccount,TResult? Function( String password)?  changePassword,}) {final _that = this;
switch (_that) {
case _ChangeColor() when changeColor != null:
return changeColor(_that.color);case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that.languageCode);case _ChangeGender() when changeGender != null:
return changeGender(_that.ownerGender,_that.partnerGender);case _Logout() when logout != null:
return logout();case _DeleteAccount() when deleteAccount != null:
return deleteAccount();case _ChangePassword() when changePassword != null:
return changePassword(_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeColor implements SettingsEvent {
  const _ChangeColor(this.color);
  

 final  Color color;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeColorCopyWith<_ChangeColor> get copyWith => __$ChangeColorCopyWithImpl<_ChangeColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'SettingsEvent.changeColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$ChangeColorCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$ChangeColorCopyWith(_ChangeColor value, $Res Function(_ChangeColor) _then) = __$ChangeColorCopyWithImpl;
@useResult
$Res call({
 Color color
});




}
/// @nodoc
class __$ChangeColorCopyWithImpl<$Res>
    implements _$ChangeColorCopyWith<$Res> {
  __$ChangeColorCopyWithImpl(this._self, this._then);

  final _ChangeColor _self;
  final $Res Function(_ChangeColor) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_ChangeColor(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class _ChangeLanguage implements SettingsEvent {
  const _ChangeLanguage(this.languageCode);
  

 final  String languageCode;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeLanguageCopyWith<_ChangeLanguage> get copyWith => __$ChangeLanguageCopyWithImpl<_ChangeLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeLanguage&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}


@override
int get hashCode => Object.hash(runtimeType,languageCode);

@override
String toString() {
  return 'SettingsEvent.changeLanguage(languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class _$ChangeLanguageCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$ChangeLanguageCopyWith(_ChangeLanguage value, $Res Function(_ChangeLanguage) _then) = __$ChangeLanguageCopyWithImpl;
@useResult
$Res call({
 String languageCode
});




}
/// @nodoc
class __$ChangeLanguageCopyWithImpl<$Res>
    implements _$ChangeLanguageCopyWith<$Res> {
  __$ChangeLanguageCopyWithImpl(this._self, this._then);

  final _ChangeLanguage _self;
  final $Res Function(_ChangeLanguage) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? languageCode = null,}) {
  return _then(_ChangeLanguage(
null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangeGender implements SettingsEvent {
  const _ChangeGender({required this.ownerGender, required this.partnerGender});
  

 final  String ownerGender;
 final  String partnerGender;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeGenderCopyWith<_ChangeGender> get copyWith => __$ChangeGenderCopyWithImpl<_ChangeGender>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeGender&&(identical(other.ownerGender, ownerGender) || other.ownerGender == ownerGender)&&(identical(other.partnerGender, partnerGender) || other.partnerGender == partnerGender));
}


@override
int get hashCode => Object.hash(runtimeType,ownerGender,partnerGender);

@override
String toString() {
  return 'SettingsEvent.changeGender(ownerGender: $ownerGender, partnerGender: $partnerGender)';
}


}

/// @nodoc
abstract mixin class _$ChangeGenderCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$ChangeGenderCopyWith(_ChangeGender value, $Res Function(_ChangeGender) _then) = __$ChangeGenderCopyWithImpl;
@useResult
$Res call({
 String ownerGender, String partnerGender
});




}
/// @nodoc
class __$ChangeGenderCopyWithImpl<$Res>
    implements _$ChangeGenderCopyWith<$Res> {
  __$ChangeGenderCopyWithImpl(this._self, this._then);

  final _ChangeGender _self;
  final $Res Function(_ChangeGender) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ownerGender = null,Object? partnerGender = null,}) {
  return _then(_ChangeGender(
ownerGender: null == ownerGender ? _self.ownerGender : ownerGender // ignore: cast_nullable_to_non_nullable
as String,partnerGender: null == partnerGender ? _self.partnerGender : partnerGender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Logout implements SettingsEvent {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.logout()';
}


}




/// @nodoc


class _DeleteAccount implements SettingsEvent {
  const _DeleteAccount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.deleteAccount()';
}


}




/// @nodoc


class _ChangePassword implements SettingsEvent {
  const _ChangePassword(this.password);
  

 final  String password;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordCopyWith<_ChangePassword> get copyWith => __$ChangePasswordCopyWithImpl<_ChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePassword&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'SettingsEvent.changePassword(password: $password)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$ChangePasswordCopyWith(_ChangePassword value, $Res Function(_ChangePassword) _then) = __$ChangePasswordCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class __$ChangePasswordCopyWithImpl<$Res>
    implements _$ChangePasswordCopyWith<$Res> {
  __$ChangePasswordCopyWithImpl(this._self, this._then);

  final _ChangePassword _self;
  final $Res Function(_ChangePassword) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_ChangePassword(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SettingsState {







@override
String toString() {
  return 'SettingsState()';
}


}

/// @nodoc
class $SettingsStateCopyWith<$Res>  {
$SettingsStateCopyWith(SettingsState _, $Res Function(SettingsState) __);
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( NavigateToBuildApp value)?  navigateToBuildApp,TResult Function( NavigateToLogin value)?  navigateToLogin,TResult Function( DeleteAccountFailed value)?  deleteAccountFailed,TResult Function( PasswordChangeFailed value)?  passwordChangeFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToBuildApp() when navigateToBuildApp != null:
return navigateToBuildApp(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case DeleteAccountFailed() when deleteAccountFailed != null:
return deleteAccountFailed(_that);case PasswordChangeFailed() when passwordChangeFailed != null:
return passwordChangeFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( NavigateToBuildApp value)  navigateToBuildApp,required TResult Function( NavigateToLogin value)  navigateToLogin,required TResult Function( DeleteAccountFailed value)  deleteAccountFailed,required TResult Function( PasswordChangeFailed value)  passwordChangeFailed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case ErrorMessage():
return errorMessage(_that);case NavigateToBuildApp():
return navigateToBuildApp(_that);case NavigateToLogin():
return navigateToLogin(_that);case DeleteAccountFailed():
return deleteAccountFailed(_that);case PasswordChangeFailed():
return passwordChangeFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( NavigateToBuildApp value)?  navigateToBuildApp,TResult? Function( NavigateToLogin value)?  navigateToLogin,TResult? Function( DeleteAccountFailed value)?  deleteAccountFailed,TResult? Function( PasswordChangeFailed value)?  passwordChangeFailed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToBuildApp() when navigateToBuildApp != null:
return navigateToBuildApp(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case DeleteAccountFailed() when deleteAccountFailed != null:
return deleteAccountFailed(_that);case PasswordChangeFailed() when passwordChangeFailed != null:
return passwordChangeFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String error)?  errorMessage,TResult Function( int seconds,  String description)?  navigateToBuildApp,TResult Function()?  navigateToLogin,TResult Function()?  deleteAccountFailed,TResult Function()?  passwordChangeFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ErrorMessage() when errorMessage != null:
return errorMessage(_that.error);case NavigateToBuildApp() when navigateToBuildApp != null:
return navigateToBuildApp(_that.seconds,_that.description);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case DeleteAccountFailed() when deleteAccountFailed != null:
return deleteAccountFailed();case PasswordChangeFailed() when passwordChangeFailed != null:
return passwordChangeFailed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String error)  errorMessage,required TResult Function( int seconds,  String description)  navigateToBuildApp,required TResult Function()  navigateToLogin,required TResult Function()  deleteAccountFailed,required TResult Function()  passwordChangeFailed,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case ErrorMessage():
return errorMessage(_that.error);case NavigateToBuildApp():
return navigateToBuildApp(_that.seconds,_that.description);case NavigateToLogin():
return navigateToLogin();case DeleteAccountFailed():
return deleteAccountFailed();case PasswordChangeFailed():
return passwordChangeFailed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String error)?  errorMessage,TResult? Function( int seconds,  String description)?  navigateToBuildApp,TResult? Function()?  navigateToLogin,TResult? Function()?  deleteAccountFailed,TResult? Function()?  passwordChangeFailed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ErrorMessage() when errorMessage != null:
return errorMessage(_that.error);case NavigateToBuildApp() when navigateToBuildApp != null:
return navigateToBuildApp(_that.seconds,_that.description);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case DeleteAccountFailed() when deleteAccountFailed != null:
return deleteAccountFailed();case PasswordChangeFailed() when passwordChangeFailed != null:
return passwordChangeFailed();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements SettingsState {
  const Initial();
  








@override
String toString() {
  return 'SettingsState.initial()';
}


}




/// @nodoc


class ErrorMessage implements SettingsState {
  const ErrorMessage(this.error);
  

 final  String error;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'SettingsState.errorMessage(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
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

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorMessage(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateToBuildApp implements SettingsState {
  const NavigateToBuildApp({required this.seconds, required this.description});
  

 final  int seconds;
 final  String description;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToBuildAppCopyWith<NavigateToBuildApp> get copyWith => _$NavigateToBuildAppCopyWithImpl<NavigateToBuildApp>(this, _$identity);





@override
String toString() {
  return 'SettingsState.navigateToBuildApp(seconds: $seconds, description: $description)';
}


}

/// @nodoc
abstract mixin class $NavigateToBuildAppCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory $NavigateToBuildAppCopyWith(NavigateToBuildApp value, $Res Function(NavigateToBuildApp) _then) = _$NavigateToBuildAppCopyWithImpl;
@useResult
$Res call({
 int seconds, String description
});




}
/// @nodoc
class _$NavigateToBuildAppCopyWithImpl<$Res>
    implements $NavigateToBuildAppCopyWith<$Res> {
  _$NavigateToBuildAppCopyWithImpl(this._self, this._then);

  final NavigateToBuildApp _self;
  final $Res Function(NavigateToBuildApp) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seconds = null,Object? description = null,}) {
  return _then(NavigateToBuildApp(
seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NavigateToLogin implements SettingsState {
  const NavigateToLogin();
  








@override
String toString() {
  return 'SettingsState.navigateToLogin()';
}


}




/// @nodoc


class DeleteAccountFailed implements SettingsState {
  const DeleteAccountFailed();
  








@override
String toString() {
  return 'SettingsState.deleteAccountFailed()';
}


}




/// @nodoc


class PasswordChangeFailed implements SettingsState {
  const PasswordChangeFailed();
  








@override
String toString() {
  return 'SettingsState.passwordChangeFailed()';
}


}




// dart format on
