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
  String get role => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get age => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get profileImage => throw _privateConstructorUsedError;
  @HiveField(6)
  String get gender => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get partnerGender => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get phoneValidation => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get registerComplete => throw _privateConstructorUsedError;

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
      @HiveField(3) String role,
      @HiveField(4) int? age,
      @HiveField(5) String? profileImage,
      @HiveField(6) String gender,
      @HiveField(7) String? partnerGender,
      @HiveField(8) bool phoneValidation,
      @HiveField(9) bool registerComplete});
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
    Object? age = freezed,
    Object? profileImage = freezed,
    Object? gender = null,
    Object? partnerGender = freezed,
    Object? phoneValidation = null,
    Object? registerComplete = null,
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
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      partnerGender: freezed == partnerGender
          ? _value.partnerGender
          : partnerGender // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneValidation: null == phoneValidation
          ? _value.phoneValidation
          : phoneValidation // ignore: cast_nullable_to_non_nullable
              as bool,
      registerComplete: null == registerComplete
          ? _value.registerComplete
          : registerComplete // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @HiveField(3) String role,
      @HiveField(4) int? age,
      @HiveField(5) String? profileImage,
      @HiveField(6) String gender,
      @HiveField(7) String? partnerGender,
      @HiveField(8) bool phoneValidation,
      @HiveField(9) bool registerComplete});
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
    Object? age = freezed,
    Object? profileImage = freezed,
    Object? gender = null,
    Object? partnerGender = freezed,
    Object? phoneValidation = null,
    Object? registerComplete = null,
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
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      partnerGender: freezed == partnerGender
          ? _value.partnerGender
          : partnerGender // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneValidation: null == phoneValidation
          ? _value.phoneValidation
          : phoneValidation // ignore: cast_nullable_to_non_nullable
              as bool,
      registerComplete: null == registerComplete
          ? _value.registerComplete
          : registerComplete // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @HiveField(3) required this.role,
      @HiveField(4) this.age,
      @HiveField(5) this.profileImage,
      @HiveField(6) this.gender = "male",
      @HiveField(7) this.partnerGender,
      @HiveField(8) required this.phoneValidation,
      @HiveField(9) required this.registerComplete});

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
  final String role;
  @override
  @HiveField(4)
  final int? age;
  @override
  @HiveField(5)
  final String? profileImage;
  @override
  @JsonKey()
  @HiveField(6)
  final String gender;
  @override
  @HiveField(7)
  final String? partnerGender;
  @override
  @HiveField(8)
  final bool phoneValidation;
  @override
  @HiveField(9)
  final bool registerComplete;

  @override
  String toString() {
    return 'PersonaModel(name: $name, phoneNumber: $phoneNumber, password: $password, role: $role, age: $age, profileImage: $profileImage, gender: $gender, partnerGender: $partnerGender, phoneValidation: $phoneValidation, registerComplete: $registerComplete)';
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
            (identical(other.age, age) || other.age == age) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.partnerGender, partnerGender) ||
                other.partnerGender == partnerGender) &&
            (identical(other.phoneValidation, phoneValidation) ||
                other.phoneValidation == phoneValidation) &&
            (identical(other.registerComplete, registerComplete) ||
                other.registerComplete == registerComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      phoneNumber,
      password,
      role,
      age,
      profileImage,
      gender,
      partnerGender,
      phoneValidation,
      registerComplete);

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
      @HiveField(3) required final String role,
      @HiveField(4) final int? age,
      @HiveField(5) final String? profileImage,
      @HiveField(6) final String gender,
      @HiveField(7) final String? partnerGender,
      @HiveField(8) required final bool phoneValidation,
      @HiveField(9) required final bool registerComplete}) = _$PersonaModelImpl;

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
  String get role;
  @override
  @HiveField(4)
  int? get age;
  @override
  @HiveField(5)
  String? get profileImage;
  @override
  @HiveField(6)
  String get gender;
  @override
  @HiveField(7)
  String? get partnerGender;
  @override
  @HiveField(8)
  bool get phoneValidation;
  @override
  @HiveField(9)
  bool get registerComplete;
  @override
  @JsonKey(ignore: true)
  _$$PersonaModelImplCopyWith<_$PersonaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
