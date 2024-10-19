// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WishesModel _$WishesModelFromJson(Map<String, dynamic> json) {
  return _WishesModel.fromJson(json);
}

/// @nodoc
mixin _$WishesModel {
  bool get lock => throw _privateConstructorUsedError;
  String? get contract => throw _privateConstructorUsedError;
  String? get first => throw _privateConstructorUsedError;
  String? get second => throw _privateConstructorUsedError;
  String? get third => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishesModelCopyWith<WishesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishesModelCopyWith<$Res> {
  factory $WishesModelCopyWith(
          WishesModel value, $Res Function(WishesModel) then) =
      _$WishesModelCopyWithImpl<$Res, WishesModel>;
  @useResult
  $Res call(
      {bool lock,
      String? contract,
      String? first,
      String? second,
      String? third});
}

/// @nodoc
class _$WishesModelCopyWithImpl<$Res, $Val extends WishesModel>
    implements $WishesModelCopyWith<$Res> {
  _$WishesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lock = null,
    Object? contract = freezed,
    Object? first = freezed,
    Object? second = freezed,
    Object? third = freezed,
  }) {
    return _then(_value.copyWith(
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String?,
      third: freezed == third
          ? _value.third
          : third // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WishesModelImplCopyWith<$Res>
    implements $WishesModelCopyWith<$Res> {
  factory _$$WishesModelImplCopyWith(
          _$WishesModelImpl value, $Res Function(_$WishesModelImpl) then) =
      __$$WishesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool lock,
      String? contract,
      String? first,
      String? second,
      String? third});
}

/// @nodoc
class __$$WishesModelImplCopyWithImpl<$Res>
    extends _$WishesModelCopyWithImpl<$Res, _$WishesModelImpl>
    implements _$$WishesModelImplCopyWith<$Res> {
  __$$WishesModelImplCopyWithImpl(
      _$WishesModelImpl _value, $Res Function(_$WishesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lock = null,
    Object? contract = freezed,
    Object? first = freezed,
    Object? second = freezed,
    Object? third = freezed,
  }) {
    return _then(_$WishesModelImpl(
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as String?,
      third: freezed == third
          ? _value.third
          : third // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WishesModelImpl implements _WishesModel {
  const _$WishesModelImpl(
      {required this.lock, this.contract, this.first, this.second, this.third});

  factory _$WishesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WishesModelImplFromJson(json);

  @override
  final bool lock;
  @override
  final String? contract;
  @override
  final String? first;
  @override
  final String? second;
  @override
  final String? third;

  @override
  String toString() {
    return 'WishesModel(lock: $lock, contract: $contract, first: $first, second: $second, third: $third)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishesModelImpl &&
            (identical(other.lock, lock) || other.lock == lock) &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.second, second) || other.second == second) &&
            (identical(other.third, third) || other.third == third));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lock, contract, first, second, third);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WishesModelImplCopyWith<_$WishesModelImpl> get copyWith =>
      __$$WishesModelImplCopyWithImpl<_$WishesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WishesModelImplToJson(
      this,
    );
  }
}

abstract class _WishesModel implements WishesModel {
  const factory _WishesModel(
      {required final bool lock,
      final String? contract,
      final String? first,
      final String? second,
      final String? third}) = _$WishesModelImpl;

  factory _WishesModel.fromJson(Map<String, dynamic> json) =
      _$WishesModelImpl.fromJson;

  @override
  bool get lock;
  @override
  String? get contract;
  @override
  String? get first;
  @override
  String? get second;
  @override
  String? get third;
  @override
  @JsonKey(ignore: true)
  _$$WishesModelImplCopyWith<_$WishesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
