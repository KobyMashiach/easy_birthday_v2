// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) {
  return _AppSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsModel {
  @HiveField(0)
  @ColorConverter()
  Color get appColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsModelCopyWith<AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsModelCopyWith<$Res> {
  factory $AppSettingsModelCopyWith(
          AppSettingsModel value, $Res Function(AppSettingsModel) then) =
      _$AppSettingsModelCopyWithImpl<$Res, AppSettingsModel>;
  @useResult
  $Res call({@HiveField(0) @ColorConverter() Color appColor});
}

/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res, $Val extends AppSettingsModel>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appColor = null,
  }) {
    return _then(_value.copyWith(
      appColor: null == appColor
          ? _value.appColor
          : appColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsModelImplCopyWith<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  factory _$$AppSettingsModelImplCopyWith(_$AppSettingsModelImpl value,
          $Res Function(_$AppSettingsModelImpl) then) =
      __$$AppSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) @ColorConverter() Color appColor});
}

/// @nodoc
class __$$AppSettingsModelImplCopyWithImpl<$Res>
    extends _$AppSettingsModelCopyWithImpl<$Res, _$AppSettingsModelImpl>
    implements _$$AppSettingsModelImplCopyWith<$Res> {
  __$$AppSettingsModelImplCopyWithImpl(_$AppSettingsModelImpl _value,
      $Res Function(_$AppSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appColor = null,
  }) {
    return _then(_$AppSettingsModelImpl(
      appColor: null == appColor
          ? _value.appColor
          : appColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 101, adapterName: 'AppSettingsModelAdapter')
class _$AppSettingsModelImpl implements _AppSettingsModel {
  _$AppSettingsModelImpl(
      {@HiveField(0) @ColorConverter() required this.appColor});

  factory _$AppSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsModelImplFromJson(json);

  @override
  @HiveField(0)
  @ColorConverter()
  final Color appColor;

  @override
  String toString() {
    return 'AppSettingsModel(appColor: $appColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsModelImpl &&
            (identical(other.appColor, appColor) ||
                other.appColor == appColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      __$$AppSettingsModelImplCopyWithImpl<_$AppSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _AppSettingsModel implements AppSettingsModel {
  factory _AppSettingsModel(
          {@HiveField(0) @ColorConverter() required final Color appColor}) =
      _$AppSettingsModelImpl;

  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) =
      _$AppSettingsModelImpl.fromJson;

  @override
  @HiveField(0)
  @ColorConverter()
  Color get appColor;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
