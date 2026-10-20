// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FirstRegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirstRegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FirstRegisterEvent()';
}


}

/// @nodoc
class $FirstRegisterEventCopyWith<$Res>  {
$FirstRegisterEventCopyWith(FirstRegisterEvent _, $Res Function(FirstRegisterEvent) __);
}


/// Adds pattern-matching-related methods to [FirstRegisterEvent].
extension FirstRegisterEventPatterns on FirstRegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SaveOwnDetails value)?  saveOwnDetails,TResult Function( _SavePartnerDetails value)?  savePartnerDetails,TResult Function( _ChooseColor value)?  chooseColor,TResult Function( _ChooseTexts value)?  chooseTexts,TResult Function( _AddProfileImage value)?  addProfileImage,TResult Function( _PurchasePlan value)?  purchasePlan,TResult Function( _FinishRegister value)?  finishRegister,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SaveOwnDetails() when saveOwnDetails != null:
return saveOwnDetails(_that);case _SavePartnerDetails() when savePartnerDetails != null:
return savePartnerDetails(_that);case _ChooseColor() when chooseColor != null:
return chooseColor(_that);case _ChooseTexts() when chooseTexts != null:
return chooseTexts(_that);case _AddProfileImage() when addProfileImage != null:
return addProfileImage(_that);case _PurchasePlan() when purchasePlan != null:
return purchasePlan(_that);case _FinishRegister() when finishRegister != null:
return finishRegister(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SaveOwnDetails value)  saveOwnDetails,required TResult Function( _SavePartnerDetails value)  savePartnerDetails,required TResult Function( _ChooseColor value)  chooseColor,required TResult Function( _ChooseTexts value)  chooseTexts,required TResult Function( _AddProfileImage value)  addProfileImage,required TResult Function( _PurchasePlan value)  purchasePlan,required TResult Function( _FinishRegister value)  finishRegister,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SaveOwnDetails():
return saveOwnDetails(_that);case _SavePartnerDetails():
return savePartnerDetails(_that);case _ChooseColor():
return chooseColor(_that);case _ChooseTexts():
return chooseTexts(_that);case _AddProfileImage():
return addProfileImage(_that);case _PurchasePlan():
return purchasePlan(_that);case _FinishRegister():
return finishRegister(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SaveOwnDetails value)?  saveOwnDetails,TResult? Function( _SavePartnerDetails value)?  savePartnerDetails,TResult? Function( _ChooseColor value)?  chooseColor,TResult? Function( _ChooseTexts value)?  chooseTexts,TResult? Function( _AddProfileImage value)?  addProfileImage,TResult? Function( _PurchasePlan value)?  purchasePlan,TResult? Function( _FinishRegister value)?  finishRegister,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SaveOwnDetails() when saveOwnDetails != null:
return saveOwnDetails(_that);case _SavePartnerDetails() when savePartnerDetails != null:
return savePartnerDetails(_that);case _ChooseColor() when chooseColor != null:
return chooseColor(_that);case _ChooseTexts() when chooseTexts != null:
return chooseTexts(_that);case _AddProfileImage() when addProfileImage != null:
return addProfileImage(_that);case _PurchasePlan() when purchasePlan != null:
return purchasePlan(_that);case _FinishRegister() when finishRegister != null:
return finishRegister(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( PersonaModel persona)?  saveOwnDetails,TResult Function( PersonaModel persona)?  savePartnerDetails,TResult Function( Color color)?  chooseColor,TResult Function( Map<String, String> chosenTexts)?  chooseTexts,TResult Function( File imageFile)?  addProfileImage,TResult Function( String? planTitle)?  purchasePlan,TResult Function()?  finishRegister,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SaveOwnDetails() when saveOwnDetails != null:
return saveOwnDetails(_that.persona);case _SavePartnerDetails() when savePartnerDetails != null:
return savePartnerDetails(_that.persona);case _ChooseColor() when chooseColor != null:
return chooseColor(_that.color);case _ChooseTexts() when chooseTexts != null:
return chooseTexts(_that.chosenTexts);case _AddProfileImage() when addProfileImage != null:
return addProfileImage(_that.imageFile);case _PurchasePlan() when purchasePlan != null:
return purchasePlan(_that.planTitle);case _FinishRegister() when finishRegister != null:
return finishRegister();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( PersonaModel persona)  saveOwnDetails,required TResult Function( PersonaModel persona)  savePartnerDetails,required TResult Function( Color color)  chooseColor,required TResult Function( Map<String, String> chosenTexts)  chooseTexts,required TResult Function( File imageFile)  addProfileImage,required TResult Function( String? planTitle)  purchasePlan,required TResult Function()  finishRegister,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _SaveOwnDetails():
return saveOwnDetails(_that.persona);case _SavePartnerDetails():
return savePartnerDetails(_that.persona);case _ChooseColor():
return chooseColor(_that.color);case _ChooseTexts():
return chooseTexts(_that.chosenTexts);case _AddProfileImage():
return addProfileImage(_that.imageFile);case _PurchasePlan():
return purchasePlan(_that.planTitle);case _FinishRegister():
return finishRegister();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( PersonaModel persona)?  saveOwnDetails,TResult? Function( PersonaModel persona)?  savePartnerDetails,TResult? Function( Color color)?  chooseColor,TResult? Function( Map<String, String> chosenTexts)?  chooseTexts,TResult? Function( File imageFile)?  addProfileImage,TResult? Function( String? planTitle)?  purchasePlan,TResult? Function()?  finishRegister,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SaveOwnDetails() when saveOwnDetails != null:
return saveOwnDetails(_that.persona);case _SavePartnerDetails() when savePartnerDetails != null:
return savePartnerDetails(_that.persona);case _ChooseColor() when chooseColor != null:
return chooseColor(_that.color);case _ChooseTexts() when chooseTexts != null:
return chooseTexts(_that.chosenTexts);case _AddProfileImage() when addProfileImage != null:
return addProfileImage(_that.imageFile);case _PurchasePlan() when purchasePlan != null:
return purchasePlan(_that.planTitle);case _FinishRegister() when finishRegister != null:
return finishRegister();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements FirstRegisterEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FirstRegisterEvent.init()';
}


}




/// @nodoc


class _SaveOwnDetails implements FirstRegisterEvent {
  const _SaveOwnDetails(this.persona);
  

 final  PersonaModel persona;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveOwnDetailsCopyWith<_SaveOwnDetails> get copyWith => __$SaveOwnDetailsCopyWithImpl<_SaveOwnDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveOwnDetails&&(identical(other.persona, persona) || other.persona == persona));
}


@override
int get hashCode => Object.hash(runtimeType,persona);

@override
String toString() {
  return 'FirstRegisterEvent.saveOwnDetails(persona: $persona)';
}


}

/// @nodoc
abstract mixin class _$SaveOwnDetailsCopyWith<$Res> implements $FirstRegisterEventCopyWith<$Res> {
  factory _$SaveOwnDetailsCopyWith(_SaveOwnDetails value, $Res Function(_SaveOwnDetails) _then) = __$SaveOwnDetailsCopyWithImpl;
@useResult
$Res call({
 PersonaModel persona
});


$PersonaModelCopyWith<$Res> get persona;

}
/// @nodoc
class __$SaveOwnDetailsCopyWithImpl<$Res>
    implements _$SaveOwnDetailsCopyWith<$Res> {
  __$SaveOwnDetailsCopyWithImpl(this._self, this._then);

  final _SaveOwnDetails _self;
  final $Res Function(_SaveOwnDetails) _then;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? persona = null,}) {
  return _then(_SaveOwnDetails(
null == persona ? _self.persona : persona // ignore: cast_nullable_to_non_nullable
as PersonaModel,
  ));
}

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonaModelCopyWith<$Res> get persona {
  
  return $PersonaModelCopyWith<$Res>(_self.persona, (value) {
    return _then(_self.copyWith(persona: value));
  });
}
}

/// @nodoc


class _SavePartnerDetails implements FirstRegisterEvent {
  const _SavePartnerDetails(this.persona);
  

 final  PersonaModel persona;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavePartnerDetailsCopyWith<_SavePartnerDetails> get copyWith => __$SavePartnerDetailsCopyWithImpl<_SavePartnerDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavePartnerDetails&&(identical(other.persona, persona) || other.persona == persona));
}


@override
int get hashCode => Object.hash(runtimeType,persona);

@override
String toString() {
  return 'FirstRegisterEvent.savePartnerDetails(persona: $persona)';
}


}

/// @nodoc
abstract mixin class _$SavePartnerDetailsCopyWith<$Res> implements $FirstRegisterEventCopyWith<$Res> {
  factory _$SavePartnerDetailsCopyWith(_SavePartnerDetails value, $Res Function(_SavePartnerDetails) _then) = __$SavePartnerDetailsCopyWithImpl;
@useResult
$Res call({
 PersonaModel persona
});


$PersonaModelCopyWith<$Res> get persona;

}
/// @nodoc
class __$SavePartnerDetailsCopyWithImpl<$Res>
    implements _$SavePartnerDetailsCopyWith<$Res> {
  __$SavePartnerDetailsCopyWithImpl(this._self, this._then);

  final _SavePartnerDetails _self;
  final $Res Function(_SavePartnerDetails) _then;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? persona = null,}) {
  return _then(_SavePartnerDetails(
null == persona ? _self.persona : persona // ignore: cast_nullable_to_non_nullable
as PersonaModel,
  ));
}

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonaModelCopyWith<$Res> get persona {
  
  return $PersonaModelCopyWith<$Res>(_self.persona, (value) {
    return _then(_self.copyWith(persona: value));
  });
}
}

/// @nodoc


class _ChooseColor implements FirstRegisterEvent {
  const _ChooseColor(this.color);
  

 final  Color color;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChooseColorCopyWith<_ChooseColor> get copyWith => __$ChooseColorCopyWithImpl<_ChooseColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChooseColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'FirstRegisterEvent.chooseColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$ChooseColorCopyWith<$Res> implements $FirstRegisterEventCopyWith<$Res> {
  factory _$ChooseColorCopyWith(_ChooseColor value, $Res Function(_ChooseColor) _then) = __$ChooseColorCopyWithImpl;
@useResult
$Res call({
 Color color
});




}
/// @nodoc
class __$ChooseColorCopyWithImpl<$Res>
    implements _$ChooseColorCopyWith<$Res> {
  __$ChooseColorCopyWithImpl(this._self, this._then);

  final _ChooseColor _self;
  final $Res Function(_ChooseColor) _then;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_ChooseColor(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class _ChooseTexts implements FirstRegisterEvent {
  const _ChooseTexts(final  Map<String, String> chosenTexts): _chosenTexts = chosenTexts;
  

 final  Map<String, String> _chosenTexts;
 Map<String, String> get chosenTexts {
  if (_chosenTexts is EqualUnmodifiableMapView) return _chosenTexts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_chosenTexts);
}


/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChooseTextsCopyWith<_ChooseTexts> get copyWith => __$ChooseTextsCopyWithImpl<_ChooseTexts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChooseTexts&&const DeepCollectionEquality().equals(other._chosenTexts, _chosenTexts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chosenTexts));

@override
String toString() {
  return 'FirstRegisterEvent.chooseTexts(chosenTexts: $chosenTexts)';
}


}

/// @nodoc
abstract mixin class _$ChooseTextsCopyWith<$Res> implements $FirstRegisterEventCopyWith<$Res> {
  factory _$ChooseTextsCopyWith(_ChooseTexts value, $Res Function(_ChooseTexts) _then) = __$ChooseTextsCopyWithImpl;
@useResult
$Res call({
 Map<String, String> chosenTexts
});




}
/// @nodoc
class __$ChooseTextsCopyWithImpl<$Res>
    implements _$ChooseTextsCopyWith<$Res> {
  __$ChooseTextsCopyWithImpl(this._self, this._then);

  final _ChooseTexts _self;
  final $Res Function(_ChooseTexts) _then;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chosenTexts = null,}) {
  return _then(_ChooseTexts(
null == chosenTexts ? _self._chosenTexts : chosenTexts // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc


class _AddProfileImage implements FirstRegisterEvent {
  const _AddProfileImage(this.imageFile);
  

 final  File imageFile;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddProfileImageCopyWith<_AddProfileImage> get copyWith => __$AddProfileImageCopyWithImpl<_AddProfileImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddProfileImage&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile);

@override
String toString() {
  return 'FirstRegisterEvent.addProfileImage(imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class _$AddProfileImageCopyWith<$Res> implements $FirstRegisterEventCopyWith<$Res> {
  factory _$AddProfileImageCopyWith(_AddProfileImage value, $Res Function(_AddProfileImage) _then) = __$AddProfileImageCopyWithImpl;
@useResult
$Res call({
 File imageFile
});




}
/// @nodoc
class __$AddProfileImageCopyWithImpl<$Res>
    implements _$AddProfileImageCopyWith<$Res> {
  __$AddProfileImageCopyWithImpl(this._self, this._then);

  final _AddProfileImage _self;
  final $Res Function(_AddProfileImage) _then;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageFile = null,}) {
  return _then(_AddProfileImage(
null == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class _PurchasePlan implements FirstRegisterEvent {
  const _PurchasePlan(this.planTitle);
  

 final  String? planTitle;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchasePlanCopyWith<_PurchasePlan> get copyWith => __$PurchasePlanCopyWithImpl<_PurchasePlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchasePlan&&(identical(other.planTitle, planTitle) || other.planTitle == planTitle));
}


@override
int get hashCode => Object.hash(runtimeType,planTitle);

@override
String toString() {
  return 'FirstRegisterEvent.purchasePlan(planTitle: $planTitle)';
}


}

/// @nodoc
abstract mixin class _$PurchasePlanCopyWith<$Res> implements $FirstRegisterEventCopyWith<$Res> {
  factory _$PurchasePlanCopyWith(_PurchasePlan value, $Res Function(_PurchasePlan) _then) = __$PurchasePlanCopyWithImpl;
@useResult
$Res call({
 String? planTitle
});




}
/// @nodoc
class __$PurchasePlanCopyWithImpl<$Res>
    implements _$PurchasePlanCopyWith<$Res> {
  __$PurchasePlanCopyWithImpl(this._self, this._then);

  final _PurchasePlan _self;
  final $Res Function(_PurchasePlan) _then;

/// Create a copy of FirstRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? planTitle = freezed,}) {
  return _then(_PurchasePlan(
freezed == planTitle ? _self.planTitle : planTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _FinishRegister implements FirstRegisterEvent {
  const _FinishRegister();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishRegister);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FirstRegisterEvent.finishRegister()';
}


}




/// @nodoc
mixin _$FirstRegisterState {

 PlanModel get planModel;
/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirstRegisterStateCopyWith<FirstRegisterState> get copyWith => _$FirstRegisterStateCopyWithImpl<FirstRegisterState>(this as FirstRegisterState, _$identity);





@override
String toString() {
  return 'FirstRegisterState(planModel: $planModel)';
}


}

/// @nodoc
abstract mixin class $FirstRegisterStateCopyWith<$Res>  {
  factory $FirstRegisterStateCopyWith(FirstRegisterState value, $Res Function(FirstRegisterState) _then) = _$FirstRegisterStateCopyWithImpl;
@useResult
$Res call({
 PlanModel planModel
});




}
/// @nodoc
class _$FirstRegisterStateCopyWithImpl<$Res>
    implements $FirstRegisterStateCopyWith<$Res> {
  _$FirstRegisterStateCopyWithImpl(this._self, this._then);

  final FirstRegisterState _self;
  final $Res Function(FirstRegisterState) _then;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planModel = null,}) {
  return _then(_self.copyWith(
planModel: null == planModel ? _self.planModel : planModel // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}

}


/// Adds pattern-matching-related methods to [FirstRegisterState].
extension FirstRegisterStatePatterns on FirstRegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loaded value)?  loaded,TResult Function( NavigateToHome value)?  navigateToHome,TResult Function( ErrorMessage value)?  errorMessage,TResult Function( PartnerPhoneTaken value)?  partnerPhoneTaken,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loaded() when loaded != null:
return loaded(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case PartnerPhoneTaken() when partnerPhoneTaken != null:
return partnerPhoneTaken(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loaded value)  loaded,required TResult Function( NavigateToHome value)  navigateToHome,required TResult Function( ErrorMessage value)  errorMessage,required TResult Function( PartnerPhoneTaken value)  partnerPhoneTaken,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loaded():
return loaded(_that);case NavigateToHome():
return navigateToHome(_that);case ErrorMessage():
return errorMessage(_that);case PartnerPhoneTaken():
return partnerPhoneTaken(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loaded value)?  loaded,TResult? Function( NavigateToHome value)?  navigateToHome,TResult? Function( ErrorMessage value)?  errorMessage,TResult? Function( PartnerPhoneTaken value)?  partnerPhoneTaken,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loaded() when loaded != null:
return loaded(_that);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case ErrorMessage() when errorMessage != null:
return errorMessage(_that);case PartnerPhoneTaken() when partnerPhoneTaken != null:
return partnerPhoneTaken(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PlanModel planModel)?  initial,TResult Function( PlanModel planModel)?  loaded,TResult Function( PlanModel planModel)?  navigateToHome,TResult Function( PlanModel planModel,  String error)?  errorMessage,TResult Function( PlanModel planModel)?  partnerPhoneTaken,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.planModel);case Loaded() when loaded != null:
return loaded(_that.planModel);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that.planModel);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.planModel,_that.error);case PartnerPhoneTaken() when partnerPhoneTaken != null:
return partnerPhoneTaken(_that.planModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PlanModel planModel)  initial,required TResult Function( PlanModel planModel)  loaded,required TResult Function( PlanModel planModel)  navigateToHome,required TResult Function( PlanModel planModel,  String error)  errorMessage,required TResult Function( PlanModel planModel)  partnerPhoneTaken,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.planModel);case Loaded():
return loaded(_that.planModel);case NavigateToHome():
return navigateToHome(_that.planModel);case ErrorMessage():
return errorMessage(_that.planModel,_that.error);case PartnerPhoneTaken():
return partnerPhoneTaken(_that.planModel);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PlanModel planModel)?  initial,TResult? Function( PlanModel planModel)?  loaded,TResult? Function( PlanModel planModel)?  navigateToHome,TResult? Function( PlanModel planModel,  String error)?  errorMessage,TResult? Function( PlanModel planModel)?  partnerPhoneTaken,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.planModel);case Loaded() when loaded != null:
return loaded(_that.planModel);case NavigateToHome() when navigateToHome != null:
return navigateToHome(_that.planModel);case ErrorMessage() when errorMessage != null:
return errorMessage(_that.planModel,_that.error);case PartnerPhoneTaken() when partnerPhoneTaken != null:
return partnerPhoneTaken(_that.planModel);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements FirstRegisterState {
  const Initial(this.planModel);
  

@override final  PlanModel planModel;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);





@override
String toString() {
  return 'FirstRegisterState.initial(planModel: $planModel)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $FirstRegisterStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@override @useResult
$Res call({
 PlanModel planModel
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planModel = null,}) {
  return _then(Initial(
null == planModel ? _self.planModel : planModel // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class Loaded implements FirstRegisterState {
  const Loaded(this.planModel);
  

@override final  PlanModel planModel;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);





@override
String toString() {
  return 'FirstRegisterState.loaded(planModel: $planModel)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $FirstRegisterStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@override @useResult
$Res call({
 PlanModel planModel
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planModel = null,}) {
  return _then(Loaded(
null == planModel ? _self.planModel : planModel // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class NavigateToHome implements FirstRegisterState {
  const NavigateToHome(this.planModel);
  

@override final  PlanModel planModel;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigateToHomeCopyWith<NavigateToHome> get copyWith => _$NavigateToHomeCopyWithImpl<NavigateToHome>(this, _$identity);





@override
String toString() {
  return 'FirstRegisterState.navigateToHome(planModel: $planModel)';
}


}

/// @nodoc
abstract mixin class $NavigateToHomeCopyWith<$Res> implements $FirstRegisterStateCopyWith<$Res> {
  factory $NavigateToHomeCopyWith(NavigateToHome value, $Res Function(NavigateToHome) _then) = _$NavigateToHomeCopyWithImpl;
@override @useResult
$Res call({
 PlanModel planModel
});




}
/// @nodoc
class _$NavigateToHomeCopyWithImpl<$Res>
    implements $NavigateToHomeCopyWith<$Res> {
  _$NavigateToHomeCopyWithImpl(this._self, this._then);

  final NavigateToHome _self;
  final $Res Function(NavigateToHome) _then;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planModel = null,}) {
  return _then(NavigateToHome(
null == planModel ? _self.planModel : planModel // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

/// @nodoc


class ErrorMessage implements FirstRegisterState {
  const ErrorMessage(this.planModel, this.error);
  

@override final  PlanModel planModel;
 final  String error;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorMessageCopyWith<ErrorMessage> get copyWith => _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);





@override
String toString() {
  return 'FirstRegisterState.errorMessage(planModel: $planModel, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res> implements $FirstRegisterStateCopyWith<$Res> {
  factory $ErrorMessageCopyWith(ErrorMessage value, $Res Function(ErrorMessage) _then) = _$ErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 PlanModel planModel, String error
});




}
/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planModel = null,Object? error = null,}) {
  return _then(ErrorMessage(
null == planModel ? _self.planModel : planModel // ignore: cast_nullable_to_non_nullable
as PlanModel,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PartnerPhoneTaken implements FirstRegisterState {
  const PartnerPhoneTaken(this.planModel);
  

@override final  PlanModel planModel;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerPhoneTakenCopyWith<PartnerPhoneTaken> get copyWith => _$PartnerPhoneTakenCopyWithImpl<PartnerPhoneTaken>(this, _$identity);





@override
String toString() {
  return 'FirstRegisterState.partnerPhoneTaken(planModel: $planModel)';
}


}

/// @nodoc
abstract mixin class $PartnerPhoneTakenCopyWith<$Res> implements $FirstRegisterStateCopyWith<$Res> {
  factory $PartnerPhoneTakenCopyWith(PartnerPhoneTaken value, $Res Function(PartnerPhoneTaken) _then) = _$PartnerPhoneTakenCopyWithImpl;
@override @useResult
$Res call({
 PlanModel planModel
});




}
/// @nodoc
class _$PartnerPhoneTakenCopyWithImpl<$Res>
    implements $PartnerPhoneTakenCopyWith<$Res> {
  _$PartnerPhoneTakenCopyWithImpl(this._self, this._then);

  final PartnerPhoneTaken _self;
  final $Res Function(PartnerPhoneTaken) _then;

/// Create a copy of FirstRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planModel = null,}) {
  return _then(PartnerPhoneTaken(
null == planModel ? _self.planModel : planModel // ignore: cast_nullable_to_non_nullable
as PlanModel,
  ));
}


}

// dart format on
