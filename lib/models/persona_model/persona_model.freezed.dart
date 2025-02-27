// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persona_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonaModel _$PersonaModelFromJson(Map<String, dynamic> json) {
  return _PersonaModel.fromJson(json);
}

/// @nodoc
mixin _$PersonaModel {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(2)
  String get password => throw _privateConstructorUsedError;
  @HiveField(3)
  @RoleModelConverter()
  RoleModel get role => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get profileImage => throw _privateConstructorUsedError;
  @HiveField(6)
  String get gender => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get registerComplete => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get eventId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonaModelCopyWith<PersonaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonaModelCopyWith<$Res> {
  factory $PersonaModelCopyWith(
          PersonaModel value, $Res Function(PersonaModel) then) =
      _$PersonaModelCopyWithImpl<$Res, PersonaModel>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String password,
      @HiveField(3) @RoleModelConverter() RoleModel role,
      @HiveField(4)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      DateTime? dateOfBirth,
      @HiveField(5) String? profileImage,
      @HiveField(6) String gender,
      @HiveField(7) bool registerComplete,
      @HiveField(8) String? email,
      @HiveField(9) String? eventId});
}

/// @nodoc
class _$PersonaModelCopyWithImpl<$Res, $Val extends PersonaModel>
    implements $PersonaModelCopyWith<$Res> {
  _$PersonaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? role = null,
    Object? dateOfBirth = freezed,
    Object? profileImage = freezed,
    Object? gender = null,
    Object? registerComplete = null,
    Object? email = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleModel,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      registerComplete: null == registerComplete
          ? _value.registerComplete
          : registerComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonaModelImplCopyWith<$Res>
    implements $PersonaModelCopyWith<$Res> {
  factory _$$PersonaModelImplCopyWith(
          _$PersonaModelImpl value, $Res Function(_$PersonaModelImpl) then) =
      __$$PersonaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String password,
      @HiveField(3) @RoleModelConverter() RoleModel role,
      @HiveField(4)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      DateTime? dateOfBirth,
      @HiveField(5) String? profileImage,
      @HiveField(6) String gender,
      @HiveField(7) bool registerComplete,
      @HiveField(8) String? email,
      @HiveField(9) String? eventId});
}

/// @nodoc
class __$$PersonaModelImplCopyWithImpl<$Res>
    extends _$PersonaModelCopyWithImpl<$Res, _$PersonaModelImpl>
    implements _$$PersonaModelImplCopyWith<$Res> {
  __$$PersonaModelImplCopyWithImpl(
      _$PersonaModelImpl _value, $Res Function(_$PersonaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? role = null,
    Object? dateOfBirth = freezed,
    Object? profileImage = freezed,
    Object? gender = null,
    Object? registerComplete = null,
    Object? email = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_$PersonaModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleModel,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      registerComplete: null == registerComplete
          ? _value.registerComplete
          : registerComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 100, adapterName: 'PersonaModelAdapter')
class _$PersonaModelImpl implements _PersonaModel {
  _$PersonaModelImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.phoneNumber,
      @HiveField(2) required this.password,
      @HiveField(3) @RoleModelConverter() required this.role,
      @HiveField(4)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      this.dateOfBirth,
      @HiveField(5) this.profileImage,
      @HiveField(6) this.gender = "male",
      @HiveField(7) required this.registerComplete,
      @HiveField(8) this.email,
      @HiveField(9) this.eventId});

  factory _$PersonaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonaModelImplFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String phoneNumber;
  @override
  @HiveField(2)
  final String password;
  @override
  @HiveField(3)
  @RoleModelConverter()
  final RoleModel role;
  @override
  @HiveField(4)
  @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
  final DateTime? dateOfBirth;
  @override
  @HiveField(5)
  final String? profileImage;
  @override
  @JsonKey()
  @HiveField(6)
  final String gender;
  @override
  @HiveField(7)
  final bool registerComplete;
  @override
  @HiveField(8)
  final String? email;
  @override
  @HiveField(9)
  final String? eventId;

  @override
  String toString() {
    return 'PersonaModel(name: $name, phoneNumber: $phoneNumber, password: $password, role: $role, dateOfBirth: $dateOfBirth, profileImage: $profileImage, gender: $gender, registerComplete: $registerComplete, email: $email, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonaModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.registerComplete, registerComplete) ||
                other.registerComplete == registerComplete) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      phoneNumber,
      password,
      role,
      dateOfBirth,
      profileImage,
      gender,
      registerComplete,
      email,
      eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonaModelImplCopyWith<_$PersonaModelImpl> get copyWith =>
      __$$PersonaModelImplCopyWithImpl<_$PersonaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonaModelImplToJson(
      this,
    );
  }
}

abstract class _PersonaModel implements PersonaModel {
  factory _PersonaModel(
      {@HiveField(0) required final String name,
      @HiveField(1) required final String phoneNumber,
      @HiveField(2) required final String password,
      @HiveField(3) @RoleModelConverter() required final RoleModel role,
      @HiveField(4)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      final DateTime? dateOfBirth,
      @HiveField(5) final String? profileImage,
      @HiveField(6) final String gender,
      @HiveField(7) required final bool registerComplete,
      @HiveField(8) final String? email,
      @HiveField(9) final String? eventId}) = _$PersonaModelImpl;

  factory _PersonaModel.fromJson(Map<String, dynamic> json) =
      _$PersonaModelImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get phoneNumber;
  @override
  @HiveField(2)
  String get password;
  @override
  @HiveField(3)
  @RoleModelConverter()
  RoleModel get role;
  @override
  @HiveField(4)
  @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
  DateTime? get dateOfBirth;
  @override
  @HiveField(5)
  String? get profileImage;
  @override
  @HiveField(6)
  String get gender;
  @override
  @HiveField(7)
  bool get registerComplete;
  @override
  @HiveField(8)
  String? get email;
  @override
  @HiveField(9)
  String? get eventId;
  @override
  @JsonKey(ignore: true)
  _$$PersonaModelImplCopyWith<_$PersonaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
