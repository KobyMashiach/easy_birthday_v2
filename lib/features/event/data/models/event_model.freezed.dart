// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventModel {

 String get eventId; List<String> get users;@PlanConverter() PlanModel get planSubscribe;@ColorConverter() Color? get appColor; List<String>? get imagesUrl; String? get greeting;@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) DateTime? get partnerDateOfBirth;// Stored under the original (misspelled) key in Firestore.
@JsonKey(name: 'choosenTexts') Map<String, String>? get chosenTexts;@CategoryConverter() List<CategoryModel> get categories; String? get profileImageUrl;
/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventModelCopyWith<EventModel> get copyWith => _$EventModelCopyWithImpl<EventModel>(this as EventModel, _$identity);

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventModel&&(identical(other.eventId, eventId) || other.eventId == eventId)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.planSubscribe, planSubscribe) || other.planSubscribe == planSubscribe)&&(identical(other.appColor, appColor) || other.appColor == appColor)&&const DeepCollectionEquality().equals(other.imagesUrl, imagesUrl)&&(identical(other.greeting, greeting) || other.greeting == greeting)&&(identical(other.partnerDateOfBirth, partnerDateOfBirth) || other.partnerDateOfBirth == partnerDateOfBirth)&&const DeepCollectionEquality().equals(other.chosenTexts, chosenTexts)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eventId,const DeepCollectionEquality().hash(users),planSubscribe,appColor,const DeepCollectionEquality().hash(imagesUrl),greeting,partnerDateOfBirth,const DeepCollectionEquality().hash(chosenTexts),const DeepCollectionEquality().hash(categories),profileImageUrl);

@override
String toString() {
  return 'EventModel(eventId: $eventId, users: $users, planSubscribe: $planSubscribe, appColor: $appColor, imagesUrl: $imagesUrl, greeting: $greeting, partnerDateOfBirth: $partnerDateOfBirth, chosenTexts: $chosenTexts, categories: $categories, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class $EventModelCopyWith<$Res>  {
  factory $EventModelCopyWith(EventModel value, $Res Function(EventModel) _then) = _$EventModelCopyWithImpl;
@useResult
$Res call({
 String eventId, List<String> users,@PlanConverter() PlanModel planSubscribe,@ColorConverter() Color? appColor, List<String>? imagesUrl, String? greeting,@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) DateTime? partnerDateOfBirth,@JsonKey(name: 'choosenTexts') Map<String, String>? chosenTexts,@CategoryConverter() List<CategoryModel> categories, String? profileImageUrl
});




}
/// @nodoc
class _$EventModelCopyWithImpl<$Res>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._self, this._then);

  final EventModel _self;
  final $Res Function(EventModel) _then;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eventId = null,Object? users = null,Object? planSubscribe = null,Object? appColor = freezed,Object? imagesUrl = freezed,Object? greeting = freezed,Object? partnerDateOfBirth = freezed,Object? chosenTexts = freezed,Object? categories = null,Object? profileImageUrl = freezed,}) {
  return _then(_self.copyWith(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<String>,planSubscribe: null == planSubscribe ? _self.planSubscribe : planSubscribe // ignore: cast_nullable_to_non_nullable
as PlanModel,appColor: freezed == appColor ? _self.appColor : appColor // ignore: cast_nullable_to_non_nullable
as Color?,imagesUrl: freezed == imagesUrl ? _self.imagesUrl : imagesUrl // ignore: cast_nullable_to_non_nullable
as List<String>?,greeting: freezed == greeting ? _self.greeting : greeting // ignore: cast_nullable_to_non_nullable
as String?,partnerDateOfBirth: freezed == partnerDateOfBirth ? _self.partnerDateOfBirth : partnerDateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,chosenTexts: freezed == chosenTexts ? _self.chosenTexts : chosenTexts // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventModel].
extension EventModelPatterns on EventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventModel value)  $default,){
final _that = this;
switch (_that) {
case _EventModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventModel value)?  $default,){
final _that = this;
switch (_that) {
case _EventModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String eventId,  List<String> users, @PlanConverter()  PlanModel planSubscribe, @ColorConverter()  Color? appColor,  List<String>? imagesUrl,  String? greeting, @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)  DateTime? partnerDateOfBirth, @JsonKey(name: 'choosenTexts')  Map<String, String>? chosenTexts, @CategoryConverter()  List<CategoryModel> categories,  String? profileImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventModel() when $default != null:
return $default(_that.eventId,_that.users,_that.planSubscribe,_that.appColor,_that.imagesUrl,_that.greeting,_that.partnerDateOfBirth,_that.chosenTexts,_that.categories,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String eventId,  List<String> users, @PlanConverter()  PlanModel planSubscribe, @ColorConverter()  Color? appColor,  List<String>? imagesUrl,  String? greeting, @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)  DateTime? partnerDateOfBirth, @JsonKey(name: 'choosenTexts')  Map<String, String>? chosenTexts, @CategoryConverter()  List<CategoryModel> categories,  String? profileImageUrl)  $default,) {final _that = this;
switch (_that) {
case _EventModel():
return $default(_that.eventId,_that.users,_that.planSubscribe,_that.appColor,_that.imagesUrl,_that.greeting,_that.partnerDateOfBirth,_that.chosenTexts,_that.categories,_that.profileImageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String eventId,  List<String> users, @PlanConverter()  PlanModel planSubscribe, @ColorConverter()  Color? appColor,  List<String>? imagesUrl,  String? greeting, @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)  DateTime? partnerDateOfBirth, @JsonKey(name: 'choosenTexts')  Map<String, String>? chosenTexts, @CategoryConverter()  List<CategoryModel> categories,  String? profileImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _EventModel() when $default != null:
return $default(_that.eventId,_that.users,_that.planSubscribe,_that.appColor,_that.imagesUrl,_that.greeting,_that.partnerDateOfBirth,_that.chosenTexts,_that.categories,_that.profileImageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventModel implements EventModel {
   _EventModel({required this.eventId, required final  List<String> users, @PlanConverter() required this.planSubscribe, @ColorConverter() this.appColor, final  List<String>? imagesUrl, this.greeting, @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) this.partnerDateOfBirth, @JsonKey(name: 'choosenTexts') final  Map<String, String>? chosenTexts, @CategoryConverter() final  List<CategoryModel> categories = const [], this.profileImageUrl}): _users = users,_imagesUrl = imagesUrl,_chosenTexts = chosenTexts,_categories = categories;
  factory _EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);

@override final  String eventId;
 final  List<String> _users;
@override List<String> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@PlanConverter() final  PlanModel planSubscribe;
@override@ColorConverter() final  Color? appColor;
 final  List<String>? _imagesUrl;
@override List<String>? get imagesUrl {
  final value = _imagesUrl;
  if (value == null) return null;
  if (_imagesUrl is EqualUnmodifiableListView) return _imagesUrl;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? greeting;
@override@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) final  DateTime? partnerDateOfBirth;
// Stored under the original (misspelled) key in Firestore.
 final  Map<String, String>? _chosenTexts;
// Stored under the original (misspelled) key in Firestore.
@override@JsonKey(name: 'choosenTexts') Map<String, String>? get chosenTexts {
  final value = _chosenTexts;
  if (value == null) return null;
  if (_chosenTexts is EqualUnmodifiableMapView) return _chosenTexts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<CategoryModel> _categories;
@override@JsonKey()@CategoryConverter() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  String? profileImageUrl;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventModelCopyWith<_EventModel> get copyWith => __$EventModelCopyWithImpl<_EventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventModel&&(identical(other.eventId, eventId) || other.eventId == eventId)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.planSubscribe, planSubscribe) || other.planSubscribe == planSubscribe)&&(identical(other.appColor, appColor) || other.appColor == appColor)&&const DeepCollectionEquality().equals(other._imagesUrl, _imagesUrl)&&(identical(other.greeting, greeting) || other.greeting == greeting)&&(identical(other.partnerDateOfBirth, partnerDateOfBirth) || other.partnerDateOfBirth == partnerDateOfBirth)&&const DeepCollectionEquality().equals(other._chosenTexts, _chosenTexts)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eventId,const DeepCollectionEquality().hash(_users),planSubscribe,appColor,const DeepCollectionEquality().hash(_imagesUrl),greeting,partnerDateOfBirth,const DeepCollectionEquality().hash(_chosenTexts),const DeepCollectionEquality().hash(_categories),profileImageUrl);

@override
String toString() {
  return 'EventModel(eventId: $eventId, users: $users, planSubscribe: $planSubscribe, appColor: $appColor, imagesUrl: $imagesUrl, greeting: $greeting, partnerDateOfBirth: $partnerDateOfBirth, chosenTexts: $chosenTexts, categories: $categories, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class _$EventModelCopyWith<$Res> implements $EventModelCopyWith<$Res> {
  factory _$EventModelCopyWith(_EventModel value, $Res Function(_EventModel) _then) = __$EventModelCopyWithImpl;
@override @useResult
$Res call({
 String eventId, List<String> users,@PlanConverter() PlanModel planSubscribe,@ColorConverter() Color? appColor, List<String>? imagesUrl, String? greeting,@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) DateTime? partnerDateOfBirth,@JsonKey(name: 'choosenTexts') Map<String, String>? chosenTexts,@CategoryConverter() List<CategoryModel> categories, String? profileImageUrl
});




}
/// @nodoc
class __$EventModelCopyWithImpl<$Res>
    implements _$EventModelCopyWith<$Res> {
  __$EventModelCopyWithImpl(this._self, this._then);

  final _EventModel _self;
  final $Res Function(_EventModel) _then;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? users = null,Object? planSubscribe = null,Object? appColor = freezed,Object? imagesUrl = freezed,Object? greeting = freezed,Object? partnerDateOfBirth = freezed,Object? chosenTexts = freezed,Object? categories = null,Object? profileImageUrl = freezed,}) {
  return _then(_EventModel(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<String>,planSubscribe: null == planSubscribe ? _self.planSubscribe : planSubscribe // ignore: cast_nullable_to_non_nullable
as PlanModel,appColor: freezed == appColor ? _self.appColor : appColor // ignore: cast_nullable_to_non_nullable
as Color?,imagesUrl: freezed == imagesUrl ? _self._imagesUrl : imagesUrl // ignore: cast_nullable_to_non_nullable
as List<String>?,greeting: freezed == greeting ? _self.greeting : greeting // ignore: cast_nullable_to_non_nullable
as String?,partnerDateOfBirth: freezed == partnerDateOfBirth ? _self.partnerDateOfBirth : partnerDateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,chosenTexts: freezed == chosenTexts ? _self._chosenTexts : chosenTexts // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
