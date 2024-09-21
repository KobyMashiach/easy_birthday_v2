// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  CategoryEnum get categoryType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get titleAppear => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<String>? get urls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {CategoryEnum categoryType,
      String name,
      String description,
      String? titleAppear,
      String? text,
      List<String>? urls});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? name = null,
    Object? description = null,
    Object? titleAppear = freezed,
    Object? text = freezed,
    Object? urls = freezed,
  }) {
    return _then(_value.copyWith(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryEnum,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      titleAppear: freezed == titleAppear
          ? _value.titleAppear
          : titleAppear // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CategoryEnum categoryType,
      String name,
      String description,
      String? titleAppear,
      String? text,
      List<String>? urls});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? name = null,
    Object? description = null,
    Object? titleAppear = freezed,
    Object? text = freezed,
    Object? urls = freezed,
  }) {
    return _then(_$CategoryModelImpl(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryEnum,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      titleAppear: freezed == titleAppear
          ? _value.titleAppear
          : titleAppear // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: freezed == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.categoryType,
      required this.name,
      required this.description,
      this.titleAppear,
      this.text,
      final List<String>? urls})
      : _urls = urls;

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final CategoryEnum categoryType;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? titleAppear;
  @override
  final String? text;
  final List<String>? _urls;
  @override
  List<String>? get urls {
    final value = _urls;
    if (value == null) return null;
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryModel(categoryType: $categoryType, name: $name, description: $description, titleAppear: $titleAppear, text: $text, urls: $urls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.titleAppear, titleAppear) ||
                other.titleAppear == titleAppear) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._urls, _urls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryType, name, description,
      titleAppear, text, const DeepCollectionEquality().hash(_urls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required final CategoryEnum categoryType,
      required final String name,
      required final String description,
      final String? titleAppear,
      final String? text,
      final List<String>? urls}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  CategoryEnum get categoryType;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get titleAppear;
  @override
  String? get text;
  @override
  List<String>? get urls;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
