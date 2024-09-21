// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  @HiveField(0)
  String get eventId => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String> get users => throw _privateConstructorUsedError;
  @HiveField(2)
  @PlanConverter()
  PlanModel get planSubscribe => throw _privateConstructorUsedError;
  @HiveField(3)
  @ColorConverter()
  Color? get appColor => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String>? get imagesUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get greeting => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
  DateTime? get partnerDateOfBirth => throw _privateConstructorUsedError;
  @HiveField(7)
  Map<String, String>? get choosenTexts => throw _privateConstructorUsedError;
  @HiveField(8)
  @CategoryConverter()
  List<CategoryModel>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {@HiveField(0) String eventId,
      @HiveField(1) List<String> users,
      @HiveField(2) @PlanConverter() PlanModel planSubscribe,
      @HiveField(3) @ColorConverter() Color? appColor,
      @HiveField(4) List<String>? imagesUrl,
      @HiveField(5) String? greeting,
      @HiveField(6)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      DateTime? partnerDateOfBirth,
      @HiveField(7) Map<String, String>? choosenTexts,
      @HiveField(8) @CategoryConverter() List<CategoryModel>? categories});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? users = null,
    Object? planSubscribe = null,
    Object? appColor = freezed,
    Object? imagesUrl = freezed,
    Object? greeting = freezed,
    Object? partnerDateOfBirth = freezed,
    Object? choosenTexts = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      planSubscribe: null == planSubscribe
          ? _value.planSubscribe
          : planSubscribe // ignore: cast_nullable_to_non_nullable
              as PlanModel,
      appColor: freezed == appColor
          ? _value.appColor
          : appColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      imagesUrl: freezed == imagesUrl
          ? _value.imagesUrl
          : imagesUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      greeting: freezed == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerDateOfBirth: freezed == partnerDateOfBirth
          ? _value.partnerDateOfBirth
          : partnerDateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      choosenTexts: freezed == choosenTexts
          ? _value.choosenTexts
          : choosenTexts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String eventId,
      @HiveField(1) List<String> users,
      @HiveField(2) @PlanConverter() PlanModel planSubscribe,
      @HiveField(3) @ColorConverter() Color? appColor,
      @HiveField(4) List<String>? imagesUrl,
      @HiveField(5) String? greeting,
      @HiveField(6)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      DateTime? partnerDateOfBirth,
      @HiveField(7) Map<String, String>? choosenTexts,
      @HiveField(8) @CategoryConverter() List<CategoryModel>? categories});
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? users = null,
    Object? planSubscribe = null,
    Object? appColor = freezed,
    Object? imagesUrl = freezed,
    Object? greeting = freezed,
    Object? partnerDateOfBirth = freezed,
    Object? choosenTexts = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$EventModelImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      planSubscribe: null == planSubscribe
          ? _value.planSubscribe
          : planSubscribe // ignore: cast_nullable_to_non_nullable
              as PlanModel,
      appColor: freezed == appColor
          ? _value.appColor
          : appColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      imagesUrl: freezed == imagesUrl
          ? _value._imagesUrl
          : imagesUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      greeting: freezed == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerDateOfBirth: freezed == partnerDateOfBirth
          ? _value.partnerDateOfBirth
          : partnerDateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      choosenTexts: freezed == choosenTexts
          ? _value._choosenTexts
          : choosenTexts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 100, adapterName: 'EventModelAdapter')
class _$EventModelImpl implements _EventModel {
  _$EventModelImpl(
      {@HiveField(0) required this.eventId,
      @HiveField(1) required final List<String> users,
      @HiveField(2) @PlanConverter() required this.planSubscribe,
      @HiveField(3) @ColorConverter() this.appColor,
      @HiveField(4) final List<String>? imagesUrl,
      @HiveField(5) this.greeting,
      @HiveField(6)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      this.partnerDateOfBirth,
      @HiveField(7) final Map<String, String>? choosenTexts,
      @HiveField(8) @CategoryConverter() final List<CategoryModel>? categories})
      : _users = users,
        _imagesUrl = imagesUrl,
        _choosenTexts = choosenTexts,
        _categories = categories;

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  @HiveField(0)
  final String eventId;
  final List<String> _users;
  @override
  @HiveField(1)
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @HiveField(2)
  @PlanConverter()
  final PlanModel planSubscribe;
  @override
  @HiveField(3)
  @ColorConverter()
  final Color? appColor;
  final List<String>? _imagesUrl;
  @override
  @HiveField(4)
  List<String>? get imagesUrl {
    final value = _imagesUrl;
    if (value == null) return null;
    if (_imagesUrl is EqualUnmodifiableListView) return _imagesUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(5)
  final String? greeting;
  @override
  @HiveField(6)
  @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
  final DateTime? partnerDateOfBirth;
  final Map<String, String>? _choosenTexts;
  @override
  @HiveField(7)
  Map<String, String>? get choosenTexts {
    final value = _choosenTexts;
    if (value == null) return null;
    if (_choosenTexts is EqualUnmodifiableMapView) return _choosenTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<CategoryModel>? _categories;
  @override
  @HiveField(8)
  @CategoryConverter()
  List<CategoryModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventModel(eventId: $eventId, users: $users, planSubscribe: $planSubscribe, appColor: $appColor, imagesUrl: $imagesUrl, greeting: $greeting, partnerDateOfBirth: $partnerDateOfBirth, choosenTexts: $choosenTexts, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.planSubscribe, planSubscribe) ||
                other.planSubscribe == planSubscribe) &&
            (identical(other.appColor, appColor) ||
                other.appColor == appColor) &&
            const DeepCollectionEquality()
                .equals(other._imagesUrl, _imagesUrl) &&
            (identical(other.greeting, greeting) ||
                other.greeting == greeting) &&
            (identical(other.partnerDateOfBirth, partnerDateOfBirth) ||
                other.partnerDateOfBirth == partnerDateOfBirth) &&
            const DeepCollectionEquality()
                .equals(other._choosenTexts, _choosenTexts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      const DeepCollectionEquality().hash(_users),
      planSubscribe,
      appColor,
      const DeepCollectionEquality().hash(_imagesUrl),
      greeting,
      partnerDateOfBirth,
      const DeepCollectionEquality().hash(_choosenTexts),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  factory _EventModel(
      {@HiveField(0) required final String eventId,
      @HiveField(1) required final List<String> users,
      @HiveField(2) @PlanConverter() required final PlanModel planSubscribe,
      @HiveField(3) @ColorConverter() final Color? appColor,
      @HiveField(4) final List<String>? imagesUrl,
      @HiveField(5) final String? greeting,
      @HiveField(6)
      @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
      final DateTime? partnerDateOfBirth,
      @HiveField(7) final Map<String, String>? choosenTexts,
      @HiveField(8)
      @CategoryConverter()
      final List<CategoryModel>? categories}) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  @HiveField(0)
  String get eventId;
  @override
  @HiveField(1)
  List<String> get users;
  @override
  @HiveField(2)
  @PlanConverter()
  PlanModel get planSubscribe;
  @override
  @HiveField(3)
  @ColorConverter()
  Color? get appColor;
  @override
  @HiveField(4)
  List<String>? get imagesUrl;
  @override
  @HiveField(5)
  String? get greeting;
  @override
  @HiveField(6)
  @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
  DateTime? get partnerDateOfBirth;
  @override
  @HiveField(7)
  Map<String, String>? get choosenTexts;
  @override
  @HiveField(8)
  @CategoryConverter()
  List<CategoryModel>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
