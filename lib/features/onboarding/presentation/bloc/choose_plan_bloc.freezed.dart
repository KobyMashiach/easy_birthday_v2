// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choose_plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChoosePlanEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChoosePlanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChoosePlanEvent()';
}


}

/// @nodoc
class $ChoosePlanEventCopyWith<$Res>  {
$ChoosePlanEventCopyWith(ChoosePlanEvent _, $Res Function(ChoosePlanEvent) __);
}


/// Adds pattern-matching-related methods to [ChoosePlanEvent].
extension ChoosePlanEventPatterns on ChoosePlanEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Buy value)?  buy,TResult Function( _PurchaseUpdated value)?  purchaseUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Buy() when buy != null:
return buy(_that);case _PurchaseUpdated() when purchaseUpdated != null:
return purchaseUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Buy value)  buy,required TResult Function( _PurchaseUpdated value)  purchaseUpdated,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Buy():
return buy(_that);case _PurchaseUpdated():
return purchaseUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Buy value)?  buy,TResult? Function( _PurchaseUpdated value)?  purchaseUpdated,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Buy() when buy != null:
return buy(_that);case _PurchaseUpdated() when purchaseUpdated != null:
return purchaseUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PlanModel fallbackPlan)?  init,TResult Function( PlanModel plan)?  buy,TResult Function( PurchaseOutcome outcome)?  purchaseUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.fallbackPlan);case _Buy() when buy != null:
return buy(_that.plan);case _PurchaseUpdated() when purchaseUpdated != null:
return purchaseUpdated(_that.outcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PlanModel fallbackPlan)  init,required TResult Function( PlanModel plan)  buy,required TResult Function( PurchaseOutcome outcome)  purchaseUpdated,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.fallbackPlan);case _Buy():
return buy(_that.plan);case _PurchaseUpdated():
return purchaseUpdated(_that.outcome);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PlanModel fallbackPlan)?  init,TResult? Function( PlanModel plan)?  buy,TResult? Function( PurchaseOutcome outcome)?  purchaseUpdated,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.fallbackPlan);case _Buy() when buy != null:
return buy(_that.plan);case _PurchaseUpdated() when purchaseUpdated != null:
return purchaseUpdated(_that.outcome);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ChoosePlanEvent {
  const _Init(this.fallbackPlan);
  

 final  PlanModel fallbackPlan;

/// Create a copy of ChoosePlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.fallbackPlan, fallbackPlan) || other.fallbackPlan == fallbackPlan));
}


@override
int get hashCode => Object.hash(runtimeType,fallbackPlan);

@override
String toString() {
  return 'ChoosePlanEvent.init(fallbackPlan: $fallbackPlan)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $ChoosePlanEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 PlanModel fallbackPlan
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of ChoosePlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fallbackPlan = null,}) {
  return _then(_Init(
null == fallbackPlan ? _self.fallbackPlan : fallbackPlan // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class _Buy implements ChoosePlanEvent {
  const _Buy(this.plan);
  

 final  PlanModel plan;

/// Create a copy of ChoosePlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyCopyWith<_Buy> get copyWith => __$BuyCopyWithImpl<_Buy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Buy&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'ChoosePlanEvent.buy(plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$BuyCopyWith<$Res> implements $ChoosePlanEventCopyWith<$Res> {
  factory _$BuyCopyWith(_Buy value, $Res Function(_Buy) _then) = __$BuyCopyWithImpl;
@useResult
$Res call({
 PlanModel plan
});




}
/// @nodoc
class __$BuyCopyWithImpl<$Res>
    implements _$BuyCopyWith<$Res> {
  __$BuyCopyWithImpl(this._self, this._then);

  final _Buy _self;
  final $Res Function(_Buy) _then;

/// Create a copy of ChoosePlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(_Buy(
null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class _PurchaseUpdated implements ChoosePlanEvent {
  const _PurchaseUpdated(this.outcome);
  

 final  PurchaseOutcome outcome;

/// Create a copy of ChoosePlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseUpdatedCopyWith<_PurchaseUpdated> get copyWith => __$PurchaseUpdatedCopyWithImpl<_PurchaseUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseUpdated&&(identical(other.outcome, outcome) || other.outcome == outcome));
}


@override
int get hashCode => Object.hash(runtimeType,outcome);

@override
String toString() {
  return 'ChoosePlanEvent.purchaseUpdated(outcome: $outcome)';
}


}

/// @nodoc
abstract mixin class _$PurchaseUpdatedCopyWith<$Res> implements $ChoosePlanEventCopyWith<$Res> {
  factory _$PurchaseUpdatedCopyWith(_PurchaseUpdated value, $Res Function(_PurchaseUpdated) _then) = __$PurchaseUpdatedCopyWithImpl;
@useResult
$Res call({
 PurchaseOutcome outcome
});




}
/// @nodoc
class __$PurchaseUpdatedCopyWithImpl<$Res>
    implements _$PurchaseUpdatedCopyWith<$Res> {
  __$PurchaseUpdatedCopyWithImpl(this._self, this._then);

  final _PurchaseUpdated _self;
  final $Res Function(_PurchaseUpdated) _then;

/// Create a copy of ChoosePlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outcome = null,}) {
  return _then(_PurchaseUpdated(
null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as PurchaseOutcome,
  ));
}


}

/// @nodoc
mixin _$ChoosePlanState {

 PlanModel get currentPlan;
/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChoosePlanStateCopyWith<ChoosePlanState> get copyWith => _$ChoosePlanStateCopyWithImpl<ChoosePlanState>(this as ChoosePlanState, _$identity);





@override
String toString() {
  return 'ChoosePlanState(currentPlan: $currentPlan)';
}


}

/// @nodoc
abstract mixin class $ChoosePlanStateCopyWith<$Res>  {
  factory $ChoosePlanStateCopyWith(ChoosePlanState value, $Res Function(ChoosePlanState) _then) = _$ChoosePlanStateCopyWithImpl;
@useResult
$Res call({
 PlanModel currentPlan
});




}
/// @nodoc
class _$ChoosePlanStateCopyWithImpl<$Res>
    implements $ChoosePlanStateCopyWith<$Res> {
  _$ChoosePlanStateCopyWithImpl(this._self, this._then);

  final ChoosePlanState _self;
  final $Res Function(ChoosePlanState) _then;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPlan = null,}) {
  return _then(_self.copyWith(
currentPlan: null == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}

}


/// Adds pattern-matching-related methods to [ChoosePlanState].
extension ChoosePlanStatePatterns on ChoosePlanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Loaded value)?  loaded,TResult Function( PlanPurchased value)?  planPurchased,TResult Function( PurchaseAwaitingApproval value)?  purchaseAwaitingApproval,TResult Function( PurchaseSaved value)?  purchaseSaved,TResult Function( ErrorMessage value)?  errorMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that);case PlanPurchased() when planPurchased != null:
return planPurchased(_that);case PurchaseAwaitingApproval() when purchaseAwaitingApproval != null:
return purchaseAwaitingApproval(_that);case PurchaseSaved() when purchaseSaved != null:
return purchaseSaved(_that);case ErrorMessage() when errorMessage != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Loaded value)  loaded,required TResult Function( PlanPurchased value)  planPurchased,required TResult Function( PurchaseAwaitingApproval value)  purchaseAwaitingApproval,required TResult Function( PurchaseSaved value)  purchaseSaved,required TResult Function( ErrorMessage value)  errorMessage,}){
final _that = this;
switch (_that) {
case Loaded():
return loaded(_that);case PlanPurchased():
return planPurchased(_that);case PurchaseAwaitingApproval():
return purchaseAwaitingApproval(_that);case PurchaseSaved():
return purchaseSaved(_that);case ErrorMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Loaded value)?  loaded,TResult? Function( PlanPurchased value)?  planPurchased,TResult? Function( PurchaseAwaitingApproval value)?  purchaseAwaitingApproval,TResult? Function( PurchaseSaved value)?  purchaseSaved,TResult? Function( ErrorMessage value)?  errorMessage,}){
final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that);case PlanPurchased() when planPurchased != null:
return planPurchased(_that);case PurchaseAwaitingApproval() when purchaseAwaitingApproval != null:
return purchaseAwaitingApproval(_that);case PurchaseSaved() when purchaseSaved != null:
return purchaseSaved(_that);case ErrorMessage() when errorMessage != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PlanModel currentPlan)?  loaded,TResult Function( PlanModel currentPlan,  String productId)?  planPurchased,TResult Function( PlanModel currentPlan)?  purchaseAwaitingApproval,TResult Function( PlanModel currentPlan)?  purchaseSaved,TResult Function( PlanModel currentPlan,  String error)?  errorMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that.currentPlan);case PlanPurchased() when planPurchased != null:
return planPurchased(_that.currentPlan,_that.productId);case PurchaseAwaitingApproval() when purchaseAwaitingApproval != null:
return purchaseAwaitingApproval(_that.currentPlan);case PurchaseSaved() when purchaseSaved != null:
return purchaseSaved(_that.currentPlan);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.currentPlan,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PlanModel currentPlan)  loaded,required TResult Function( PlanModel currentPlan,  String productId)  planPurchased,required TResult Function( PlanModel currentPlan)  purchaseAwaitingApproval,required TResult Function( PlanModel currentPlan)  purchaseSaved,required TResult Function( PlanModel currentPlan,  String error)  errorMessage,}) {final _that = this;
switch (_that) {
case Loaded():
return loaded(_that.currentPlan);case PlanPurchased():
return planPurchased(_that.currentPlan,_that.productId);case PurchaseAwaitingApproval():
return purchaseAwaitingApproval(_that.currentPlan);case PurchaseSaved():
return purchaseSaved(_that.currentPlan);case ErrorMessage():
return errorMessage(_that.currentPlan,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PlanModel currentPlan)?  loaded,TResult? Function( PlanModel currentPlan,  String productId)?  planPurchased,TResult? Function( PlanModel currentPlan)?  purchaseAwaitingApproval,TResult? Function( PlanModel currentPlan)?  purchaseSaved,TResult? Function( PlanModel currentPlan,  String error)?  errorMessage,}) {final _that = this;
switch (_that) {
case Loaded() when loaded != null:
return loaded(_that.currentPlan);case PlanPurchased() when planPurchased != null:
return planPurchased(_that.currentPlan,_that.productId);case PurchaseAwaitingApproval() when purchaseAwaitingApproval != null:
return purchaseAwaitingApproval(_that.currentPlan);case PurchaseSaved() when purchaseSaved != null:
return purchaseSaved(_that.currentPlan);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.currentPlan,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class Loaded implements ChoosePlanState {
  const Loaded(this.currentPlan);
  

@override final  PlanModel currentPlan;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'ChoosePlanState.loaded(currentPlan: $currentPlan)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ChoosePlanStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 PlanModel currentPlan
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPlan = null,}) {
  return _then(Loaded(
null == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class PlanPurchased implements ChoosePlanState {
  const PlanPurchased(this.currentPlan, this.productId);
  

@override final  PlanModel currentPlan;
 final  String productId;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanPurchasedCopyWith<PlanPurchased> get copyWith => _$PlanPurchasedCopyWithImpl<PlanPurchased>(this, _$identity);





@override
String toString() {
  return 'ChoosePlanState.planPurchased(currentPlan: $currentPlan, productId: $productId)';
}


}

/// @nodoc
abstract mixin class $PlanPurchasedCopyWith<$Res> implements $ChoosePlanStateCopyWith<$Res> {
  factory $PlanPurchasedCopyWith(PlanPurchased value, $Res Function(PlanPurchased) _then) = _$PlanPurchasedCopyWithImpl;
@override @useResult
$Res call({
 PlanModel currentPlan, String productId
});




}
/// @nodoc
class _$PlanPurchasedCopyWithImpl<$Res>
    implements $PlanPurchasedCopyWith<$Res> {
  _$PlanPurchasedCopyWithImpl(this._self, this._then);

  final PlanPurchased _self;
  final $Res Function(PlanPurchased) _then;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPlan = null,Object? productId = null,}) {
  return _then(PlanPurchased(
null == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as PlanModel,null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PurchaseAwaitingApproval implements ChoosePlanState {
  const PurchaseAwaitingApproval(this.currentPlan);
  

@override final  PlanModel currentPlan;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseAwaitingApprovalCopyWith<PurchaseAwaitingApproval> get copyWith => _$PurchaseAwaitingApprovalCopyWithImpl<PurchaseAwaitingApproval>(this, _$identity);





@override
String toString() {
  return 'ChoosePlanState.purchaseAwaitingApproval(currentPlan: $currentPlan)';
}


}

/// @nodoc
abstract mixin class $PurchaseAwaitingApprovalCopyWith<$Res> implements $ChoosePlanStateCopyWith<$Res> {
  factory $PurchaseAwaitingApprovalCopyWith(PurchaseAwaitingApproval value, $Res Function(PurchaseAwaitingApproval) _then) = _$PurchaseAwaitingApprovalCopyWithImpl;
@override @useResult
$Res call({
 PlanModel currentPlan
});




}
/// @nodoc
class _$PurchaseAwaitingApprovalCopyWithImpl<$Res>
    implements $PurchaseAwaitingApprovalCopyWith<$Res> {
  _$PurchaseAwaitingApprovalCopyWithImpl(this._self, this._then);

  final PurchaseAwaitingApproval _self;
  final $Res Function(PurchaseAwaitingApproval) _then;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPlan = null,}) {
  return _then(PurchaseAwaitingApproval(
null == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class PurchaseSaved implements ChoosePlanState {
  const PurchaseSaved(this.currentPlan);
  

@override final  PlanModel currentPlan;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseSavedCopyWith<PurchaseSaved> get copyWith => _$PurchaseSavedCopyWithImpl<PurchaseSaved>(this, _$identity);





@override
String toString() {
  return 'ChoosePlanState.purchaseSaved(currentPlan: $currentPlan)';
}


}

/// @nodoc
abstract mixin class $PurchaseSavedCopyWith<$Res> implements $ChoosePlanStateCopyWith<$Res> {
  factory $PurchaseSavedCopyWith(PurchaseSaved value, $Res Function(PurchaseSaved) _then) = _$PurchaseSavedCopyWithImpl;
@override @useResult
$Res call({
 PlanModel currentPlan
});




}
/// @nodoc
class _$PurchaseSavedCopyWithImpl<$Res>
    implements $PurchaseSavedCopyWith<$Res> {
  _$PurchaseSavedCopyWithImpl(this._self, this._then);

  final PurchaseSaved _self;
  final $Res Function(PurchaseSaved) _then;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPlan = null,}) {
  return _then(PurchaseSaved(
null == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class ErrorMessage implements ChoosePlanState {
  const ErrorMessage(this.currentPlan, this.error);
  

@override final  PlanModel currentPlan;
 final  String error;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'ChoosePlanState.errorMessage(currentPlan: $currentPlan, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $ChoosePlanStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 PlanModel currentPlan, String error
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of ChoosePlanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPlan = null,Object? error = null,}) {
  return _then(ErrorMessage(
null == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as PlanModel,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
