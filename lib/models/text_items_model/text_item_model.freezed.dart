// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextItemModel _$TextItemModelFromJson(Map<String, dynamic> json) {
  return _TextItemModel.fromJson(json);
}

/// @nodoc
mixin _$TextItemModel {
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<String> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextItemModelCopyWith<TextItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextItemModelCopyWith<$Res> {
  factory $TextItemModelCopyWith(
          TextItemModel value, $Res Function(TextItemModel) then) =
      _$TextItemModelCopyWithImpl<$Res, TextItemModel>;
  @useResult
  $Res call({String title, String text, List<String> items});
}

/// @nodoc
class _$TextItemModelCopyWithImpl<$Res, $Val extends TextItemModel>
    implements $TextItemModelCopyWith<$Res> {
  _$TextItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? text = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextItemModelImplCopyWith<$Res>
    implements $TextItemModelCopyWith<$Res> {
  factory _$$TextItemModelImplCopyWith(
          _$TextItemModelImpl value, $Res Function(_$TextItemModelImpl) then) =
      __$$TextItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String text, List<String> items});
}

/// @nodoc
class __$$TextItemModelImplCopyWithImpl<$Res>
    extends _$TextItemModelCopyWithImpl<$Res, _$TextItemModelImpl>
    implements _$$TextItemModelImplCopyWith<$Res> {
  __$$TextItemModelImplCopyWithImpl(
      _$TextItemModelImpl _value, $Res Function(_$TextItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? text = null,
    Object? items = null,
  }) {
    return _then(_$TextItemModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextItemModelImpl implements _TextItemModel {
  const _$TextItemModelImpl(
      {required this.title,
      required this.text,
      required final List<String> items})
      : _items = items;

  factory _$TextItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextItemModelImplFromJson(json);

  @override
  final String title;
  @override
  final String text;
  final List<String> _items;
  @override
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TextItemModel(title: $title, text: $text, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextItemModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, text, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextItemModelImplCopyWith<_$TextItemModelImpl> get copyWith =>
      __$$TextItemModelImplCopyWithImpl<_$TextItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextItemModelImplToJson(
      this,
    );
  }
}

abstract class _TextItemModel implements TextItemModel {
  const factory _TextItemModel(
      {required final String title,
      required final String text,
      required final List<String> items}) = _$TextItemModelImpl;

  factory _TextItemModel.fromJson(Map<String, dynamic> json) =
      _$TextItemModelImpl.fromJson;

  @override
  String get title;
  @override
  String get text;
  @override
  List<String> get items;
  @override
  @JsonKey(ignore: true)
  _$$TextItemModelImplCopyWith<_$TextItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
