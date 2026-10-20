// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wear_os_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WearOsCategoriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WearOsCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WearOsCategoriesEvent()';
}


}

/// @nodoc
class $WearOsCategoriesEventCopyWith<$Res>  {
$WearOsCategoriesEventCopyWith(WearOsCategoriesEvent _, $Res Function(WearOsCategoriesEvent) __);
}


/// Adds pattern-matching-related methods to [WearOsCategoriesEvent].
extension WearOsCategoriesEventPatterns on WearOsCategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SetLock value)?  setLock,TResult Function( _Logout value)?  logout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SetLock() when setLock != null:
return setLock(_that);case _Logout() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SetLock value)  setLock,required TResult Function( _Logout value)  logout,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SetLock():
return setLock(_that);case _Logout():
return logout(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SetLock value)?  setLock,TResult? Function( _Logout value)?  logout,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SetLock() when setLock != null:
return setLock(_that);case _Logout() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String eventId)?  init,TResult Function( CategoryModel category,  bool lock)?  setLock,TResult Function()?  logout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.eventId);case _SetLock() when setLock != null:
return setLock(_that.category,_that.lock);case _Logout() when logout != null:
return logout();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String eventId)  init,required TResult Function( CategoryModel category,  bool lock)  setLock,required TResult Function()  logout,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.eventId);case _SetLock():
return setLock(_that.category,_that.lock);case _Logout():
return logout();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String eventId)?  init,TResult? Function( CategoryModel category,  bool lock)?  setLock,TResult? Function()?  logout,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.eventId);case _SetLock() when setLock != null:
return setLock(_that.category,_that.lock);case _Logout() when logout != null:
return logout();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements WearOsCategoriesEvent {
  const _Init(this.eventId);
  

 final  String eventId;

/// Create a copy of WearOsCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId);

@override
String toString() {
  return 'WearOsCategoriesEvent.init(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $WearOsCategoriesEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of WearOsCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(_Init(
null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetLock implements WearOsCategoriesEvent {
  const _SetLock(this.category, {required this.lock});
  

 final  CategoryModel category;
 final  bool lock;

/// Create a copy of WearOsCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLockCopyWith<_SetLock> get copyWith => __$SetLockCopyWithImpl<_SetLock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLock&&(identical(other.category, category) || other.category == category)&&(identical(other.lock, lock) || other.lock == lock));
}


@override
int get hashCode => Object.hash(runtimeType,category,lock);

@override
String toString() {
  return 'WearOsCategoriesEvent.setLock(category: $category, lock: $lock)';
}


}

/// @nodoc
abstract mixin class _$SetLockCopyWith<$Res> implements $WearOsCategoriesEventCopyWith<$Res> {
  factory _$SetLockCopyWith(_SetLock value, $Res Function(_SetLock) _then) = __$SetLockCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, bool lock
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$SetLockCopyWithImpl<$Res>
    implements _$SetLockCopyWith<$Res> {
  __$SetLockCopyWithImpl(this._self, this._then);

  final _SetLock _self;
  final $Res Function(_SetLock) _then;

/// Create a copy of WearOsCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,Object? lock = null,}) {
  return _then(_SetLock(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WearOsCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _Logout implements WearOsCategoriesEvent {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WearOsCategoriesEvent.logout()';
}


}




/// @nodoc
mixin _$WearOsCategoriesState {

 EventModel? get event;
/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WearOsCategoriesStateCopyWith<WearOsCategoriesState> get copyWith => _$WearOsCategoriesStateCopyWithImpl<WearOsCategoriesState>(this as WearOsCategoriesState, _$identity);





@override
String toString() {
  return 'WearOsCategoriesState(event: $event)';
}


}

/// @nodoc
abstract mixin class $WearOsCategoriesStateCopyWith<$Res>  {
  factory $WearOsCategoriesStateCopyWith(WearOsCategoriesState value, $Res Function(WearOsCategoriesState) _then) = _$WearOsCategoriesStateCopyWithImpl;
@useResult
$Res call({
 EventModel? event
});


$EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$WearOsCategoriesStateCopyWithImpl<$Res>
    implements $WearOsCategoriesStateCopyWith<$Res> {
  _$WearOsCategoriesStateCopyWithImpl(this._self, this._then);

  final WearOsCategoriesState _self;
  final $Res Function(WearOsCategoriesState) _then;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? event = freezed,}) {
  return _then(_self.copyWith(
event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}
/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// Adds pattern-matching-related methods to [WearOsCategoriesState].
extension WearOsCategoriesStatePatterns on WearOsCategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( LoadFailed value)?  loadFailed,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( NavigateToLogin value)?  navigateToLogin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case LoadFailed() when loadFailed != null:
return loadFailed(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( LoadFailed value)  loadFailed,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( NavigateToLogin value)  navigateToLogin,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case LoadFailed():
return loadFailed(_that);case ErrorMessage():
return errorMessage(_that);case NavigateToLogin():
return navigateToLogin(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( LoadFailed value)?  loadFailed,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( NavigateToLogin value)?  navigateToLogin,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case LoadFailed() when loadFailed != null:
return loadFailed(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EventModel? event)?  initial,TResult Function( EventModel? event)?  loading,TResult Function( EventModel? event)?  loaded,TResult Function( EventModel? event)?  loadFailed,TResult Function( EventModel? event,  String error)?  errorMessage,TResult Function( EventModel? event)?  navigateToLogin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.event);case Loading() when loading != null:
return loading(_that.event);case Loaded() when loaded != null:
return loaded(_that.event);case LoadFailed() when loadFailed != null:
return loadFailed(_that.event);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.event,_that.error);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EventModel? event)  initial,required TResult Function( EventModel? event)  loading,required TResult Function( EventModel? event)  loaded,required TResult Function( EventModel? event)  loadFailed,required TResult Function( EventModel? event,  String error)  errorMessage,required TResult Function( EventModel? event)  navigateToLogin,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.event);case Loading():
return loading(_that.event);case Loaded():
return loaded(_that.event);case LoadFailed():
return loadFailed(_that.event);case ErrorMessage():
return errorMessage(_that.event,_that.error);case NavigateToLogin():
return navigateToLogin(_that.event);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EventModel? event)?  initial,TResult? Function( EventModel? event)?  loading,TResult? Function( EventModel? event)?  loaded,TResult? Function( EventModel? event)?  loadFailed,TResult? Function( EventModel? event,  String error)?  errorMessage,TResult? Function( EventModel? event)?  navigateToLogin,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.event);case Loading() when loading != null:
return loading(_that.event);case Loaded() when loaded != null:
return loaded(_that.event);case LoadFailed() when loadFailed != null:
return loadFailed(_that.event);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.event,_that.error);case NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that.event);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements WearOsCategoriesState {
  const Initial(this.event);
  

@override final  EventModel? event;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);





@override
String toString() {
  return 'WearOsCategoriesState.initial(event: $event)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $WearOsCategoriesStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(Initial(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class Loading implements WearOsCategoriesState {
  const Loading(this.event);
  

@override final  EventModel? event;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<Loading> get copyWith => _$LoadingCopyWithImpl<Loading>(this, _$identity);





@override
String toString() {
  return 'WearOsCategoriesState.loading(event: $event)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res> implements $WearOsCategoriesStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(Loading(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class Loaded implements WearOsCategoriesState {
  const Loaded(this.event);
  

@override final  EventModel? event;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'WearOsCategoriesState.loaded(event: $event)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $WearOsCategoriesStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(Loaded(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class LoadFailed implements WearOsCategoriesState {
  const LoadFailed(this.event);
  

@override final  EventModel? event;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadFailedCopyWith<LoadFailed> get copyWith => _$LoadFailedCopyWithImpl<LoadFailed>(this, _$identity);





@override
String toString() {
  return 'WearOsCategoriesState.loadFailed(event: $event)';
}


}

/// @nodoc
abstract mixin class $LoadFailedCopyWith<$Res> implements $WearOsCategoriesStateCopyWith<$Res> {
  factory $LoadFailedCopyWith(LoadFailed value, $Res Function(LoadFailed) _then) = _$LoadFailedCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$LoadFailedCopyWithImpl<$Res>
    implements $LoadFailedCopyWith<$Res> {
  _$LoadFailedCopyWithImpl(this._self, this._then);

  final LoadFailed _self;
  final $Res Function(LoadFailed) _then;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(LoadFailed(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class ErrorMessage implements WearOsCategoriesState {
  const ErrorMessage(this.event, this.error);
  

@override final  EventModel? event;
 final  String error;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'WearOsCategoriesState.errorMessage(event: $event, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $WearOsCategoriesStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event, String error
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? error = null,}) {
  return _then(ErrorMessage(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class NavigateToLogin implements WearOsCategoriesState {
  const NavigateToLogin(this.event);
  

@override final  EventModel? event;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToLoginCopyWith<NavigateToLogin> get copyWith => _$NavigateToLoginCopyWithImpl<NavigateToLogin>(this, _$identity);





@override
String toString() {
  return 'WearOsCategoriesState.navigateToLogin(event: $event)';
}


}

/// @nodoc
abstract mixin class $NavigateToLoginCopyWith<$Res> implements $WearOsCategoriesStateCopyWith<$Res> {
  factory $NavigateToLoginCopyWith(NavigateToLogin value, $Res Function(NavigateToLogin) _then) = _$NavigateToLoginCopyWithImpl;
@override @useResult
$Res call({
 EventModel? event
});


@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$NavigateToLoginCopyWithImpl<$Res>
    implements $NavigateToLoginCopyWith<$Res> {
  _$NavigateToLoginCopyWithImpl(this._self, this._then);

  final NavigateToLogin _self;
  final $Res Function(NavigateToLogin) _then;

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,}) {
  return _then(NavigateToLogin(
freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,
  ));
}

/// Create a copy of WearOsCategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
