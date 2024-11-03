// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemoryGameModel _$MemoryGameModelFromJson(Map<String, dynamic> json) {
  return _MemoryGameModel.fromJson(json);
}

/// @nodoc
mixin _$MemoryGameModel {
  List<String> get imagesUrls => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  bool get lock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoryGameModelCopyWith<MemoryGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryGameModelCopyWith<$Res> {
  factory $MemoryGameModelCopyWith(
          MemoryGameModel value, $Res Function(MemoryGameModel) then) =
      _$MemoryGameModelCopyWithImpl<$Res, MemoryGameModel>;
  @useResult
  $Res call({List<String> imagesUrls, int score, bool lock});
}

/// @nodoc
class _$MemoryGameModelCopyWithImpl<$Res, $Val extends MemoryGameModel>
    implements $MemoryGameModelCopyWith<$Res> {
  _$MemoryGameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesUrls = null,
    Object? score = null,
    Object? lock = null,
  }) {
    return _then(_value.copyWith(
      imagesUrls: null == imagesUrls
          ? _value.imagesUrls
          : imagesUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoryGameModelImplCopyWith<$Res>
    implements $MemoryGameModelCopyWith<$Res> {
  factory _$$MemoryGameModelImplCopyWith(_$MemoryGameModelImpl value,
          $Res Function(_$MemoryGameModelImpl) then) =
      __$$MemoryGameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> imagesUrls, int score, bool lock});
}

/// @nodoc
class __$$MemoryGameModelImplCopyWithImpl<$Res>
    extends _$MemoryGameModelCopyWithImpl<$Res, _$MemoryGameModelImpl>
    implements _$$MemoryGameModelImplCopyWith<$Res> {
  __$$MemoryGameModelImplCopyWithImpl(
      _$MemoryGameModelImpl _value, $Res Function(_$MemoryGameModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesUrls = null,
    Object? score = null,
    Object? lock = null,
  }) {
    return _then(_$MemoryGameModelImpl(
      imagesUrls: null == imagesUrls
          ? _value._imagesUrls
          : imagesUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoryGameModelImpl implements _MemoryGameModel {
  const _$MemoryGameModelImpl(
      {required final List<String> imagesUrls,
      this.score = 0,
      this.lock = false})
      : _imagesUrls = imagesUrls;

  factory _$MemoryGameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoryGameModelImplFromJson(json);

  final List<String> _imagesUrls;
  @override
  List<String> get imagesUrls {
    if (_imagesUrls is EqualUnmodifiableListView) return _imagesUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesUrls);
  }

  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final bool lock;

  @override
  String toString() {
    return 'MemoryGameModel(imagesUrls: $imagesUrls, score: $score, lock: $lock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoryGameModelImpl &&
            const DeepCollectionEquality()
                .equals(other._imagesUrls, _imagesUrls) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.lock, lock) || other.lock == lock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_imagesUrls), score, lock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoryGameModelImplCopyWith<_$MemoryGameModelImpl> get copyWith =>
      __$$MemoryGameModelImplCopyWithImpl<_$MemoryGameModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoryGameModelImplToJson(
      this,
    );
  }
}

abstract class _MemoryGameModel implements MemoryGameModel {
  const factory _MemoryGameModel(
      {required final List<String> imagesUrls,
      final int score,
      final bool lock}) = _$MemoryGameModelImpl;

  factory _MemoryGameModel.fromJson(Map<String, dynamic> json) =
      _$MemoryGameModelImpl.fromJson;

  @override
  List<String> get imagesUrls;
  @override
  int get score;
  @override
  bool get lock;
  @override
  @JsonKey(ignore: true)
  _$$MemoryGameModelImplCopyWith<_$MemoryGameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
