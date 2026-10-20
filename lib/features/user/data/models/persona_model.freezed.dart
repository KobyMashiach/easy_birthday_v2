// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persona_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonaModel {

@HiveField(0) String get name;@HiveField(1) String get phoneNumber;@HiveField(2) String get password;@HiveField(3)@RoleModelConverter() RoleModel get role;@HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) DateTime? get dateOfBirth;@HiveField(5) String? get profileImage;@HiveField(6) String get gender;@HiveField(7) bool get registerComplete;@HiveField(8) String? get email;@HiveField(9) String? get eventId;
/// Create a copy of PersonaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonaModelCopyWith<PersonaModel> get copyWith => _$PersonaModelCopyWithImpl<PersonaModel>(this as PersonaModel, _$identity);

  /// Serializes this PersonaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonaModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.registerComplete, registerComplete) || other.registerComplete == registerComplete)&&(identical(other.email, email) || other.email == email)&&(identical(other.eventId, eventId) || other.eventId == eventId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber,password,role,dateOfBirth,profileImage,gender,registerComplete,email,eventId);

@override
String toString() {
  return 'PersonaModel(name: $name, phoneNumber: $phoneNumber, password: $password, role: $role, dateOfBirth: $dateOfBirth, profileImage: $profileImage, gender: $gender, registerComplete: $registerComplete, email: $email, eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class $PersonaModelCopyWith<$Res>  {
  factory $PersonaModelCopyWith(PersonaModel value, $Res Function(PersonaModel) _then) = _$PersonaModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String name,@HiveField(1) String phoneNumber,@HiveField(2) String password,@HiveField(3)@RoleModelConverter() RoleModel role,@HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) DateTime? dateOfBirth,@HiveField(5) String? profileImage,@HiveField(6) String gender,@HiveField(7) bool registerComplete,@HiveField(8) String? email,@HiveField(9) String? eventId
});




}
/// @nodoc
class _$PersonaModelCopyWithImpl<$Res>
    implements $PersonaModelCopyWith<$Res> {
  _$PersonaModelCopyWithImpl(this._self, this._then);

  final PersonaModel _self;
  final $Res Function(PersonaModel) _then;

/// Create a copy of PersonaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phoneNumber = null,Object? password = null,Object? role = null,Object? dateOfBirth = freezed,Object? profileImage = freezed,Object? gender = null,Object? registerComplete = null,Object? email = freezed,Object? eventId = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RoleModel,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,registerComplete: null == registerComplete ? _self.registerComplete : registerComplete // ignore: cast_nullable_to_non_nullable
as bool,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonaModel].
extension PersonaModelPatterns on PersonaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonaModel value)  $default,){
final _that = this;
switch (_that) {
case _PersonaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonaModel value)?  $default,){
final _that = this;
switch (_that) {
case _PersonaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String name, @HiveField(1)  String phoneNumber, @HiveField(2)  String password, @HiveField(3)@RoleModelConverter()  RoleModel role, @HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)  DateTime? dateOfBirth, @HiveField(5)  String? profileImage, @HiveField(6)  String gender, @HiveField(7)  bool registerComplete, @HiveField(8)  String? email, @HiveField(9)  String? eventId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonaModel() when $default != null:
return $default(_that.name,_that.phoneNumber,_that.password,_that.role,_that.dateOfBirth,_that.profileImage,_that.gender,_that.registerComplete,_that.email,_that.eventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String name, @HiveField(1)  String phoneNumber, @HiveField(2)  String password, @HiveField(3)@RoleModelConverter()  RoleModel role, @HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)  DateTime? dateOfBirth, @HiveField(5)  String? profileImage, @HiveField(6)  String gender, @HiveField(7)  bool registerComplete, @HiveField(8)  String? email, @HiveField(9)  String? eventId)  $default,) {final _that = this;
switch (_that) {
case _PersonaModel():
return $default(_that.name,_that.phoneNumber,_that.password,_that.role,_that.dateOfBirth,_that.profileImage,_that.gender,_that.registerComplete,_that.email,_that.eventId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String name, @HiveField(1)  String phoneNumber, @HiveField(2)  String password, @HiveField(3)@RoleModelConverter()  RoleModel role, @HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)  DateTime? dateOfBirth, @HiveField(5)  String? profileImage, @HiveField(6)  String gender, @HiveField(7)  bool registerComplete, @HiveField(8)  String? email, @HiveField(9)  String? eventId)?  $default,) {final _that = this;
switch (_that) {
case _PersonaModel() when $default != null:
return $default(_that.name,_that.phoneNumber,_that.password,_that.role,_that.dateOfBirth,_that.profileImage,_that.gender,_that.registerComplete,_that.email,_that.eventId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonaModel implements PersonaModel {
   _PersonaModel({@HiveField(0) required this.name, @HiveField(1) required this.phoneNumber, @HiveField(2) required this.password, @HiveField(3)@RoleModelConverter() required this.role, @HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) this.dateOfBirth, @HiveField(5) this.profileImage, @HiveField(6) this.gender = "male", @HiveField(7) required this.registerComplete, @HiveField(8) this.email, @HiveField(9) this.eventId});
  factory _PersonaModel.fromJson(Map<String, dynamic> json) => _$PersonaModelFromJson(json);

@override@HiveField(0) final  String name;
@override@HiveField(1) final  String phoneNumber;
@override@HiveField(2) final  String password;
@override@HiveField(3)@RoleModelConverter() final  RoleModel role;
@override@HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) final  DateTime? dateOfBirth;
@override@HiveField(5) final  String? profileImage;
@override@JsonKey()@HiveField(6) final  String gender;
@override@HiveField(7) final  bool registerComplete;
@override@HiveField(8) final  String? email;
@override@HiveField(9) final  String? eventId;

/// Create a copy of PersonaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonaModelCopyWith<_PersonaModel> get copyWith => __$PersonaModelCopyWithImpl<_PersonaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonaModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.registerComplete, registerComplete) || other.registerComplete == registerComplete)&&(identical(other.email, email) || other.email == email)&&(identical(other.eventId, eventId) || other.eventId == eventId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber,password,role,dateOfBirth,profileImage,gender,registerComplete,email,eventId);

@override
String toString() {
  return 'PersonaModel(name: $name, phoneNumber: $phoneNumber, password: $password, role: $role, dateOfBirth: $dateOfBirth, profileImage: $profileImage, gender: $gender, registerComplete: $registerComplete, email: $email, eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$PersonaModelCopyWith<$Res> implements $PersonaModelCopyWith<$Res> {
  factory _$PersonaModelCopyWith(_PersonaModel value, $Res Function(_PersonaModel) _then) = __$PersonaModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String name,@HiveField(1) String phoneNumber,@HiveField(2) String password,@HiveField(3)@RoleModelConverter() RoleModel role,@HiveField(4)@JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp) DateTime? dateOfBirth,@HiveField(5) String? profileImage,@HiveField(6) String gender,@HiveField(7) bool registerComplete,@HiveField(8) String? email,@HiveField(9) String? eventId
});




}
/// @nodoc
class __$PersonaModelCopyWithImpl<$Res>
    implements _$PersonaModelCopyWith<$Res> {
  __$PersonaModelCopyWithImpl(this._self, this._then);

  final _PersonaModel _self;
  final $Res Function(_PersonaModel) _then;

/// Create a copy of PersonaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phoneNumber = null,Object? password = null,Object? role = null,Object? dateOfBirth = freezed,Object? profileImage = freezed,Object? gender = null,Object? registerComplete = null,Object? email = freezed,Object? eventId = freezed,}) {
  return _then(_PersonaModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RoleModel,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,registerComplete: null == registerComplete ? _self.registerComplete : registerComplete // ignore: cast_nullable_to_non_nullable
as bool,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
