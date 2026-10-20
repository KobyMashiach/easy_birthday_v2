// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FirstLoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirstLoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FirstLoginEvent()';
}


}

/// @nodoc
class $FirstLoginEventCopyWith<$Res>  {
$FirstLoginEventCopyWith(FirstLoginEvent _, $Res Function(FirstLoginEvent) __);
}


/// Adds pattern-matching-related methods to [FirstLoginEvent].
extension FirstLoginEventPatterns on FirstLoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ContinuePressed value)?  continuePressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContinuePressed() when continuePressed != null:
return continuePressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ContinuePressed value)  continuePressed,}){
final _that = this;
switch (_that) {
case _ContinuePressed():
return continuePressed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ContinuePressed value)?  continuePressed,}){
final _that = this;
switch (_that) {
case _ContinuePressed() when continuePressed != null:
return continuePressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  continuePressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContinuePressed() when continuePressed != null:
return continuePressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  continuePressed,}) {final _that = this;
switch (_that) {
case _ContinuePressed():
return continuePressed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  continuePressed,}) {final _that = this;
switch (_that) {
case _ContinuePressed() when continuePressed != null:
return continuePressed();case _:
  return null;

}
}

}

/// @nodoc


class _ContinuePressed implements FirstLoginEvent {
  const _ContinuePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContinuePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FirstLoginEvent.continuePressed()';
}


}




/// @nodoc
mixin _$FirstLoginState {







@override
String toString() {
  return 'FirstLoginState()';
}


}

/// @nodoc
class $FirstLoginStateCopyWith<$Res>  {
$FirstLoginStateCopyWith(FirstLoginState _, $Res Function(FirstLoginState) __);
}


/// Adds pattern-matching-related methods to [FirstLoginState].
extension FirstLoginStatePatterns on FirstLoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( NavigateToHome value)?  navigateToHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( NavigateToHome value)  navigateToHome,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case NavigateToHome():
return navigateToHome(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( NavigateToHome value)?  navigateToHome,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  navigateToHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case NavigateToHome() when navigateToHome != null:
return navigateToHome();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  navigateToHome,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case NavigateToHome():
return navigateToHome();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  navigateToHome,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case NavigateToHome() when navigateToHome != null:
return navigateToHome();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements FirstLoginState {
  const Initial();
  








@override
String toString() {
  return 'FirstLoginState.initial()';
}


}




/// @nodoc


class NavigateToHome implements FirstLoginState {
  const NavigateToHome();
  








@override
String toString() {
  return 'FirstLoginState.navigateToHome()';
}


}




// dart format on
