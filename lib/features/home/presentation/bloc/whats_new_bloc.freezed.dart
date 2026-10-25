// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'whats_new_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WhatsNewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WhatsNewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WhatsNewEvent()';
}


}

/// @nodoc
class $WhatsNewEventCopyWith<$Res>  {
$WhatsNewEventCopyWith(WhatsNewEvent _, $Res Function(WhatsNewEvent) __);
}


/// Adds pattern-matching-related methods to [WhatsNewEvent].
extension WhatsNewEventPatterns on WhatsNewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Check value)?  check,TResult Function( _Seen value)?  seen,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Check() when check != null:
return check(_that);case _Seen() when seen != null:
return seen(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Check value)  check,required TResult Function( _Seen value)  seen,}){
final _that = this;
switch (_that) {
case _Check():
return check(_that);case _Seen():
return seen(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Check value)?  check,TResult? Function( _Seen value)?  seen,}){
final _that = this;
switch (_that) {
case _Check() when check != null:
return check(_that);case _Seen() when seen != null:
return seen(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  check,TResult Function()?  seen,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Check() when check != null:
return check();case _Seen() when seen != null:
return seen();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  check,required TResult Function()  seen,}) {final _that = this;
switch (_that) {
case _Check():
return check();case _Seen():
return seen();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  check,TResult? Function()?  seen,}) {final _that = this;
switch (_that) {
case _Check() when check != null:
return check();case _Seen() when seen != null:
return seen();case _:
  return null;

}
}

}

/// @nodoc


class _Check implements WhatsNewEvent {
  const _Check();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Check);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WhatsNewEvent.check()';
}


}




/// @nodoc


class _Seen implements WhatsNewEvent {
  const _Seen();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seen);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WhatsNewEvent.seen()';
}


}




/// @nodoc
mixin _$WhatsNewState {







@override
String toString() {
  return 'WhatsNewState()';
}


}

/// @nodoc
class $WhatsNewStateCopyWith<$Res>  {
$WhatsNewStateCopyWith(WhatsNewState _, $Res Function(WhatsNewState) __);
}


/// Adds pattern-matching-related methods to [WhatsNewState].
extension WhatsNewStatePatterns on WhatsNewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle value)?  idle,TResult Function( ShowOwner value)?  showOwner,TResult Function( ShowPartner value)?  showPartner,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case ShowOwner() when showOwner != null:
return showOwner(_that);case ShowPartner() when showPartner != null:
return showPartner(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle value)  idle,required TResult Function( ShowOwner value)  showOwner,required TResult Function( ShowPartner value)  showPartner,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case ShowOwner():
return showOwner(_that);case ShowPartner():
return showPartner(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle value)?  idle,TResult? Function( ShowOwner value)?  showOwner,TResult? Function( ShowPartner value)?  showPartner,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case ShowOwner() when showOwner != null:
return showOwner(_that);case ShowPartner() when showPartner != null:
return showPartner(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( bool hasChildren)?  showOwner,TResult Function( CategoryModel? category)?  showPartner,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case ShowOwner() when showOwner != null:
return showOwner(_that.hasChildren);case ShowPartner() when showPartner != null:
return showPartner(_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( bool hasChildren)  showOwner,required TResult Function( CategoryModel? category)  showPartner,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case ShowOwner():
return showOwner(_that.hasChildren);case ShowPartner():
return showPartner(_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( bool hasChildren)?  showOwner,TResult? Function( CategoryModel? category)?  showPartner,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case ShowOwner() when showOwner != null:
return showOwner(_that.hasChildren);case ShowPartner() when showPartner != null:
return showPartner(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class Idle implements WhatsNewState {
  const Idle();
  








@override
String toString() {
  return 'WhatsNewState.idle()';
}


}




/// @nodoc


class ShowOwner implements WhatsNewState {
  const ShowOwner({required this.hasChildren});
  

 final  bool hasChildren;

/// Create a copy of WhatsNewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowOwnerCopyWith<ShowOwner> get copyWith => _$ShowOwnerCopyWithImpl<ShowOwner>(this, _$identity);





@override
String toString() {
  return 'WhatsNewState.showOwner(hasChildren: $hasChildren)';
}


}

/// @nodoc
abstract mixin class $ShowOwnerCopyWith<$Res> implements $WhatsNewStateCopyWith<$Res> {
  factory $ShowOwnerCopyWith(ShowOwner value, $Res Function(ShowOwner) _then) = _$ShowOwnerCopyWithImpl;
@useResult
$Res call({
 bool hasChildren
});




}
/// @nodoc
class _$ShowOwnerCopyWithImpl<$Res>
    implements $ShowOwnerCopyWith<$Res> {
  _$ShowOwnerCopyWithImpl(this._self, this._then);

  final ShowOwner _self;
  final $Res Function(ShowOwner) _then;

/// Create a copy of WhatsNewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hasChildren = null,}) {
  return _then(ShowOwner(
hasChildren: null == hasChildren ? _self.hasChildren : hasChildren // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ShowPartner implements WhatsNewState {
  const ShowPartner({this.category});
  

 final  CategoryModel? category;

/// Create a copy of WhatsNewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowPartnerCopyWith<ShowPartner> get copyWith => _$ShowPartnerCopyWithImpl<ShowPartner>(this, _$identity);





@override
String toString() {
  return 'WhatsNewState.showPartner(category: $category)';
}


}

/// @nodoc
abstract mixin class $ShowPartnerCopyWith<$Res> implements $WhatsNewStateCopyWith<$Res> {
  factory $ShowPartnerCopyWith(ShowPartner value, $Res Function(ShowPartner) _then) = _$ShowPartnerCopyWithImpl;
@useResult
$Res call({
 CategoryModel? category
});


$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$ShowPartnerCopyWithImpl<$Res>
    implements $ShowPartnerCopyWith<$Res> {
  _$ShowPartnerCopyWithImpl(this._self, this._then);

  final ShowPartner _self;
  final $Res Function(ShowPartner) _then;

/// Create a copy of WhatsNewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = freezed,}) {
  return _then(ShowPartner(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}

/// Create a copy of WhatsNewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
