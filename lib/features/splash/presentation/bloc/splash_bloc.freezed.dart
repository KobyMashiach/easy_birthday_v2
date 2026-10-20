// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent()';
}


}

/// @nodoc
class $SplashEventCopyWith<$Res>  {
$SplashEventCopyWith(SplashEvent _, $Res Function(SplashEvent) __);
}


/// Adds pattern-matching-related methods to [SplashEvent].
extension SplashEventPatterns on SplashEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,}) {final _that = this;
switch (_that) {
case _Init():
return init();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements SplashEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent.init()';
}


}




/// @nodoc
mixin _$SplashState {







@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( NavigateToHome value)?  navigateToHome,TResult Function( NavigateToLogin value)?  navigateToLogin,TResult Function( NavigateToOnboarding value)?  navigateToOnboarding,TResult Function( NavigateToFirstLogin value)?  navigateToFirstLogin,TResult Function( NavigateToWearOsLogin value)?  navigateToWearOsLogin,TResult Function( NavigateToWearOsCategories value)?  navigateToWearOsCategories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin(_that);case NavigateToWearOsLogin() when navigateToWearOsLogin != null:
return navigateToWearOsLogin(_that);case NavigateToWearOsCategories() when navigateToWearOsCategories != null:
return navigateToWearOsCategories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( NavigateToHome value)  navigateToHome,required TResult Function( NavigateToLogin value)  navigateToLogin,required TResult Function( NavigateToOnboarding value)  navigateToOnboarding,required TResult Function( NavigateToFirstLogin value)  navigateToFirstLogin,required TResult Function( NavigateToWearOsLogin value)  navigateToWearOsLogin,required TResult Function( NavigateToWearOsCategories value)  navigateToWearOsCategories,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case NavigateToHome():
return navigateToHome(_that);case NavigateToLogin():
return navigateToLogin(_that);case NavigateToOnboarding():
return navigateToOnboarding(_that);case NavigateToFirstLogin():
return navigateToFirstLogin(_that);case NavigateToWearOsLogin():
return navigateToWearOsLogin(_that);case NavigateToWearOsCategories():
return navigateToWearOsCategories(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( NavigateToHome value)?  navigateToHome,TResult? Function( NavigateToLogin value)?  navigateToLogin,TResult? Function( NavigateToOnboarding value)?  navigateToOnboarding,TResult? Function( NavigateToFirstLogin value)?  navigateToFirstLogin,TResult? Function( NavigateToWearOsLogin value)?  navigateToWearOsLogin,TResult? Function( NavigateToWearOsCategories value)?  navigateToWearOsCategories,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin(_that);case NavigateToWearOsLogin() when navigateToWearOsLogin != null:
return navigateToWearOsLogin(_that);case NavigateToWearOsCategories() when navigateToWearOsCategories != null:
return navigateToWearOsCategories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  navigateToHome,TResult Function()?  navigateToLogin,TResult Function()?  navigateToOnboarding,TResult Function()?  navigateToFirstLogin,TResult Function()?  navigateToWearOsLogin,TResult Function( String eventId)?  navigateToWearOsCategories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case NavigateToHome() when navigateToHome != null:
return navigateToHome();case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin();case NavigateToWearOsLogin() when navigateToWearOsLogin != null:
return navigateToWearOsLogin();case NavigateToWearOsCategories() when navigateToWearOsCategories != null:
return navigateToWearOsCategories(_that.eventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  navigateToHome,required TResult Function()  navigateToLogin,required TResult Function()  navigateToOnboarding,required TResult Function()  navigateToFirstLogin,required TResult Function()  navigateToWearOsLogin,required TResult Function( String eventId)  navigateToWearOsCategories,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case NavigateToHome():
return navigateToHome();case NavigateToLogin():
return navigateToLogin();case NavigateToOnboarding():
return navigateToOnboarding();case NavigateToFirstLogin():
return navigateToFirstLogin();case NavigateToWearOsLogin():
return navigateToWearOsLogin();case NavigateToWearOsCategories():
return navigateToWearOsCategories(_that.eventId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  navigateToHome,TResult? Function()?  navigateToLogin,TResult? Function()?  navigateToOnboarding,TResult? Function()?  navigateToFirstLogin,TResult? Function()?  navigateToWearOsLogin,TResult? Function( String eventId)?  navigateToWearOsCategories,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case NavigateToHome() when navigateToHome != null:
return navigateToHome();case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case NavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case NavigateToFirstLogin() when navigateToFirstLogin != null:
return navigateToFirstLogin();case NavigateToWearOsLogin() when navigateToWearOsLogin != null:
return navigateToWearOsLogin();case NavigateToWearOsCategories() when navigateToWearOsCategories != null:
return navigateToWearOsCategories(_that.eventId);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements SplashState {
  const Initial();
  








@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class Loading implements SplashState {
  const Loading();
  








@override
String toString() {
  return 'SplashState.loading()';
}


}




/// @nodoc


class NavigateToHome implements SplashState {
  const NavigateToHome();
  








@override
String toString() {
  return 'SplashState.navigateToHome()';
}


}




/// @nodoc


class NavigateToLogin implements SplashState {
  const NavigateToLogin();
  








@override
String toString() {
  return 'SplashState.navigateToLogin()';
}


}




/// @nodoc


class NavigateToOnboarding implements SplashState {
  const NavigateToOnboarding();
  








@override
String toString() {
  return 'SplashState.navigateToOnboarding()';
}


}




/// @nodoc


class NavigateToFirstLogin implements SplashState {
  const NavigateToFirstLogin();
  








@override
String toString() {
  return 'SplashState.navigateToFirstLogin()';
}


}




/// @nodoc


class NavigateToWearOsLogin implements SplashState {
  const NavigateToWearOsLogin();
  








@override
String toString() {
  return 'SplashState.navigateToWearOsLogin()';
}


}




/// @nodoc


class NavigateToWearOsCategories implements SplashState {
  const NavigateToWearOsCategories(this.eventId);
  

 final  String eventId;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToWearOsCategoriesCopyWith<NavigateToWearOsCategories> get copyWith => _$NavigateToWearOsCategoriesCopyWithImpl<NavigateToWearOsCategories>(this, _$identity);





@override
String toString() {
  return 'SplashState.navigateToWearOsCategories(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class $NavigateToWearOsCategoriesCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory $NavigateToWearOsCategoriesCopyWith(NavigateToWearOsCategories value, $Res Function(NavigateToWearOsCategories) _then) = _$NavigateToWearOsCategoriesCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class _$NavigateToWearOsCategoriesCopyWithImpl<$Res>
    implements $NavigateToWearOsCategoriesCopyWith<$Res> {
  _$NavigateToWearOsCategoriesCopyWithImpl(this._self, this._then);

  final NavigateToWearOsCategories _self;
  final $Res Function(NavigateToWearOsCategories) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(NavigateToWearOsCategories(
null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
