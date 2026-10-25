// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'children_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChildrenEvent {

 ChildModel get child;
/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChildrenEventCopyWith<ChildrenEvent> get copyWith => _$ChildrenEventCopyWithImpl<ChildrenEvent>(this as ChildrenEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChildrenEvent&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,child);

@override
String toString() {
  return 'ChildrenEvent(child: $child)';
}


}

/// @nodoc
abstract mixin class $ChildrenEventCopyWith<$Res>  {
  factory $ChildrenEventCopyWith(ChildrenEvent value, $Res Function(ChildrenEvent) _then) = _$ChildrenEventCopyWithImpl;
@useResult
$Res call({
 ChildModel child
});


$ChildModelCopyWith<$Res> get child;

}
/// @nodoc
class _$ChildrenEventCopyWithImpl<$Res>
    implements $ChildrenEventCopyWith<$Res> {
  _$ChildrenEventCopyWithImpl(this._self, this._then);

  final ChildrenEvent _self;
  final $Res Function(ChildrenEvent) _then;

/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? child = null,}) {
  return _then(_self.copyWith(
child: null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as ChildModel,
  ));
}
/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChildModelCopyWith<$Res> get child {
  
  return $ChildModelCopyWith<$Res>(_self.child, (value) {
    return _then(_self.copyWith(child: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChildrenEvent].
extension ChildrenEventPatterns on ChildrenEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SaveChild value)?  saveChild,TResult Function( _DeleteChild value)?  deleteChild,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveChild() when saveChild != null:
return saveChild(_that);case _DeleteChild() when deleteChild != null:
return deleteChild(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SaveChild value)  saveChild,required TResult Function( _DeleteChild value)  deleteChild,}){
final _that = this;
switch (_that) {
case _SaveChild():
return saveChild(_that);case _DeleteChild():
return deleteChild(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SaveChild value)?  saveChild,TResult? Function( _DeleteChild value)?  deleteChild,}){
final _that = this;
switch (_that) {
case _SaveChild() when saveChild != null:
return saveChild(_that);case _DeleteChild() when deleteChild != null:
return deleteChild(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ChildModel child)?  saveChild,TResult Function( ChildModel child)?  deleteChild,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveChild() when saveChild != null:
return saveChild(_that.child);case _DeleteChild() when deleteChild != null:
return deleteChild(_that.child);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ChildModel child)  saveChild,required TResult Function( ChildModel child)  deleteChild,}) {final _that = this;
switch (_that) {
case _SaveChild():
return saveChild(_that.child);case _DeleteChild():
return deleteChild(_that.child);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ChildModel child)?  saveChild,TResult? Function( ChildModel child)?  deleteChild,}) {final _that = this;
switch (_that) {
case _SaveChild() when saveChild != null:
return saveChild(_that.child);case _DeleteChild() when deleteChild != null:
return deleteChild(_that.child);case _:
  return null;

}
}

}

/// @nodoc


class _SaveChild implements ChildrenEvent {
  const _SaveChild(this.child);
  

@override final  ChildModel child;

/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveChildCopyWith<_SaveChild> get copyWith => __$SaveChildCopyWithImpl<_SaveChild>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveChild&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,child);

@override
String toString() {
  return 'ChildrenEvent.saveChild(child: $child)';
}


}

/// @nodoc
abstract mixin class _$SaveChildCopyWith<$Res> implements $ChildrenEventCopyWith<$Res> {
  factory _$SaveChildCopyWith(_SaveChild value, $Res Function(_SaveChild) _then) = __$SaveChildCopyWithImpl;
@override @useResult
$Res call({
 ChildModel child
});


@override $ChildModelCopyWith<$Res> get child;

}
/// @nodoc
class __$SaveChildCopyWithImpl<$Res>
    implements _$SaveChildCopyWith<$Res> {
  __$SaveChildCopyWithImpl(this._self, this._then);

  final _SaveChild _self;
  final $Res Function(_SaveChild) _then;

/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? child = null,}) {
  return _then(_SaveChild(
null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as ChildModel,
  ));
}

/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChildModelCopyWith<$Res> get child {
  
  return $ChildModelCopyWith<$Res>(_self.child, (value) {
    return _then(_self.copyWith(child: value));
  });
}
}

/// @nodoc


class _DeleteChild implements ChildrenEvent {
  const _DeleteChild(this.child);
  

@override final  ChildModel child;

/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteChildCopyWith<_DeleteChild> get copyWith => __$DeleteChildCopyWithImpl<_DeleteChild>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteChild&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,child);

@override
String toString() {
  return 'ChildrenEvent.deleteChild(child: $child)';
}


}

/// @nodoc
abstract mixin class _$DeleteChildCopyWith<$Res> implements $ChildrenEventCopyWith<$Res> {
  factory _$DeleteChildCopyWith(_DeleteChild value, $Res Function(_DeleteChild) _then) = __$DeleteChildCopyWithImpl;
@override @useResult
$Res call({
 ChildModel child
});


@override $ChildModelCopyWith<$Res> get child;

}
/// @nodoc
class __$DeleteChildCopyWithImpl<$Res>
    implements _$DeleteChildCopyWith<$Res> {
  __$DeleteChildCopyWithImpl(this._self, this._then);

  final _DeleteChild _self;
  final $Res Function(_DeleteChild) _then;

/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? child = null,}) {
  return _then(_DeleteChild(
null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as ChildModel,
  ));
}

/// Create a copy of ChildrenEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChildModelCopyWith<$Res> get child {
  
  return $ChildModelCopyWith<$Res>(_self.child, (value) {
    return _then(_self.copyWith(child: value));
  });
}
}

/// @nodoc
mixin _$ChildrenState {

 List<ChildModel> get children;
/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChildrenStateCopyWith<ChildrenState> get copyWith => _$ChildrenStateCopyWithImpl<ChildrenState>(this as ChildrenState, _$identity);





@override
String toString() {
  return 'ChildrenState(children: $children)';
}


}

/// @nodoc
abstract mixin class $ChildrenStateCopyWith<$Res>  {
  factory $ChildrenStateCopyWith(ChildrenState value, $Res Function(ChildrenState) _then) = _$ChildrenStateCopyWithImpl;
@useResult
$Res call({
 List<ChildModel> children
});




}
/// @nodoc
class _$ChildrenStateCopyWithImpl<$Res>
    implements $ChildrenStateCopyWith<$Res> {
  _$ChildrenStateCopyWithImpl(this._self, this._then);

  final ChildrenState _self;
  final $Res Function(ChildrenState) _then;

/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? children = null,}) {
  return _then(_self.copyWith(
children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<ChildModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChildrenState].
extension ChildrenStatePatterns on ChildrenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Loaded value)?  loaded,TResult Function( Saving value)?  saving,TResult Function( ErrorMessage value)?  errorMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that);case Saving() when saving != null:
return saving(_that);case ErrorMessage() when errorMessage != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Loaded value)  loaded,required TResult Function( Saving value)  saving,required TResult Function( ErrorMessage value)  errorMessage,}){
final _that = this;
switch (_that) {
case Loaded():
return loaded(_that);case Saving():
return saving(_that);case ErrorMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Loaded value)?  loaded,TResult? Function( Saving value)?  saving,TResult? Function( ErrorMessage value)?  errorMessage,}){
final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that);case Saving() when saving != null:
return saving(_that);case ErrorMessage() when errorMessage != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ChildModel> children)?  loaded,TResult Function( List<ChildModel> children)?  saving,TResult Function( List<ChildModel> children)?  errorMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that.children);case Saving() when saving != null:
return saving(_that.children);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ChildModel> children)  loaded,required TResult Function( List<ChildModel> children)  saving,required TResult Function( List<ChildModel> children)  errorMessage,}) {final _that = this;
switch (_that) {
case Loaded():
return loaded(_that.children);case Saving():
return saving(_that.children);case ErrorMessage():
return errorMessage(_that.children);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ChildModel> children)?  loaded,TResult? Function( List<ChildModel> children)?  saving,TResult? Function( List<ChildModel> children)?  errorMessage,}) {final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that.children);case Saving() when saving != null:
return saving(_that.children);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.children);case _:
  return null;

}
}

}

/// @nodoc


class Loaded implements ChildrenState {
  const Loaded(final  List<ChildModel> children): _children = children;
  

 final  List<ChildModel> _children;
@override List<ChildModel> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'ChildrenState.loaded(children: $children)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ChildrenStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 List<ChildModel> children
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? children = null,}) {
  return _then(Loaded(
null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<ChildModel>,
  ));
}


}

/// @nodoc


class Saving implements ChildrenState {
  const Saving(final  List<ChildModel> children): _children = children;
  

 final  List<ChildModel> _children;
@override List<ChildModel> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingCopyWith<Saving> get copyWith => _$SavingCopyWithImpl<Saving>(this, _$identity);





@override
String toString() {
  return 'ChildrenState.saving(children: $children)';
}


}

/// @nodoc
abstract mixin class $SavingCopyWith<$Res> implements $ChildrenStateCopyWith<$Res> {
  factory $SavingCopyWith(Saving value, $Res Function(Saving) _then) = _$SavingCopyWithImpl;
@override @useResult
$Res call({
 List<ChildModel> children
});




}
/// @nodoc
class _$SavingCopyWithImpl<$Res>
    implements $SavingCopyWith<$Res> {
  _$SavingCopyWithImpl(this._self, this._then);

  final Saving _self;
  final $Res Function(Saving) _then;

/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? children = null,}) {
  return _then(Saving(
null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<ChildModel>,
  ));
}


}

/// @nodoc


class ErrorMessage implements ChildrenState {
  const ErrorMessage(final  List<ChildModel> children): _children = children;
  

 final  List<ChildModel> _children;
@override List<ChildModel> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'ChildrenState.errorMessage(children: $children)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $ChildrenStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 List<ChildModel> children
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of ChildrenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? children = null,}) {
  return _then(ErrorMessage(
null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<ChildModel>,
  ));
}


}

// dart format on
