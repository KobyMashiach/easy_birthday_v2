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
  @HiveField(0)
  CategoryEnum get categoryType => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get titleAppear => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get text => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String>? get urls => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get lock => throw _privateConstructorUsedError;
  @HiveField(8)
  Map<int, Map<String, String>>? get supriseMap =>
      throw _privateConstructorUsedError;
  @HiveField(9)
  @WishesConverter()
  WishesModel? get wishesList => throw _privateConstructorUsedError;
  @HiveField(10)
  @CalendarModelConverter()
  CalendarModel? get calendarEvents => throw _privateConstructorUsedError;
  @HiveField(11)
  @QuestionModelListConverter()
  List<QuestionModel>? get quizGame => throw _privateConstructorUsedError;
  @HiveField(12)
  int get quizGameScore => throw _privateConstructorUsedError;

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
      {@HiveField(0) CategoryEnum categoryType,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String? id,
      @HiveField(4) String? titleAppear,
      @HiveField(5) String? text,
      @HiveField(6) List<String>? urls,
      @HiveField(7) bool lock,
      @HiveField(8) Map<int, Map<String, String>>? supriseMap,
      @HiveField(9) @WishesConverter() WishesModel? wishesList,
      @HiveField(10) @CalendarModelConverter() CalendarModel? calendarEvents,
      @HiveField(11)
      @QuestionModelListConverter()
      List<QuestionModel>? quizGame,
      @HiveField(12) int quizGameScore});

  $WishesModelCopyWith<$Res>? get wishesList;
  $CalendarModelCopyWith<$Res>? get calendarEvents;
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
    Object? id = freezed,
    Object? titleAppear = freezed,
    Object? text = freezed,
    Object? urls = freezed,
    Object? lock = null,
    Object? supriseMap = freezed,
    Object? wishesList = freezed,
    Object? calendarEvents = freezed,
    Object? quizGame = freezed,
    Object? quizGameScore = null,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
      supriseMap: freezed == supriseMap
          ? _value.supriseMap
          : supriseMap // ignore: cast_nullable_to_non_nullable
              as Map<int, Map<String, String>>?,
      wishesList: freezed == wishesList
          ? _value.wishesList
          : wishesList // ignore: cast_nullable_to_non_nullable
              as WishesModel?,
      calendarEvents: freezed == calendarEvents
          ? _value.calendarEvents
          : calendarEvents // ignore: cast_nullable_to_non_nullable
              as CalendarModel?,
      quizGame: freezed == quizGame
          ? _value.quizGame
          : quizGame // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      quizGameScore: null == quizGameScore
          ? _value.quizGameScore
          : quizGameScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WishesModelCopyWith<$Res>? get wishesList {
    if (_value.wishesList == null) {
      return null;
    }

    return $WishesModelCopyWith<$Res>(_value.wishesList!, (value) {
      return _then(_value.copyWith(wishesList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarModelCopyWith<$Res>? get calendarEvents {
    if (_value.calendarEvents == null) {
      return null;
    }

    return $CalendarModelCopyWith<$Res>(_value.calendarEvents!, (value) {
      return _then(_value.copyWith(calendarEvents: value) as $Val);
    });
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
      {@HiveField(0) CategoryEnum categoryType,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String? id,
      @HiveField(4) String? titleAppear,
      @HiveField(5) String? text,
      @HiveField(6) List<String>? urls,
      @HiveField(7) bool lock,
      @HiveField(8) Map<int, Map<String, String>>? supriseMap,
      @HiveField(9) @WishesConverter() WishesModel? wishesList,
      @HiveField(10) @CalendarModelConverter() CalendarModel? calendarEvents,
      @HiveField(11)
      @QuestionModelListConverter()
      List<QuestionModel>? quizGame,
      @HiveField(12) int quizGameScore});

  @override
  $WishesModelCopyWith<$Res>? get wishesList;
  @override
  $CalendarModelCopyWith<$Res>? get calendarEvents;
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
    Object? id = freezed,
    Object? titleAppear = freezed,
    Object? text = freezed,
    Object? urls = freezed,
    Object? lock = null,
    Object? supriseMap = freezed,
    Object? wishesList = freezed,
    Object? calendarEvents = freezed,
    Object? quizGame = freezed,
    Object? quizGameScore = null,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
      supriseMap: freezed == supriseMap
          ? _value._supriseMap
          : supriseMap // ignore: cast_nullable_to_non_nullable
              as Map<int, Map<String, String>>?,
      wishesList: freezed == wishesList
          ? _value.wishesList
          : wishesList // ignore: cast_nullable_to_non_nullable
              as WishesModel?,
      calendarEvents: freezed == calendarEvents
          ? _value.calendarEvents
          : calendarEvents // ignore: cast_nullable_to_non_nullable
              as CalendarModel?,
      quizGame: freezed == quizGame
          ? _value._quizGame
          : quizGame // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      quizGameScore: null == quizGameScore
          ? _value.quizGameScore
          : quizGameScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 104, adapterName: 'CategoryModelAdapter')
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {@HiveField(0) required this.categoryType,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) this.id,
      @HiveField(4) this.titleAppear,
      @HiveField(5) this.text,
      @HiveField(6) final List<String>? urls,
      @HiveField(7) this.lock = false,
      @HiveField(8) final Map<int, Map<String, String>>? supriseMap,
      @HiveField(9) @WishesConverter() this.wishesList,
      @HiveField(10) @CalendarModelConverter() this.calendarEvents,
      @HiveField(11)
      @QuestionModelListConverter()
      final List<QuestionModel>? quizGame,
      @HiveField(12) this.quizGameScore = 0})
      : _urls = urls,
        _supriseMap = supriseMap,
        _quizGame = quizGame;

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  @HiveField(0)
  final CategoryEnum categoryType;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final String? id;
  @override
  @HiveField(4)
  final String? titleAppear;
  @override
  @HiveField(5)
  final String? text;
  final List<String>? _urls;
  @override
  @HiveField(6)
  List<String>? get urls {
    final value = _urls;
    if (value == null) return null;
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  @HiveField(7)
  final bool lock;
  final Map<int, Map<String, String>>? _supriseMap;
  @override
  @HiveField(8)
  Map<int, Map<String, String>>? get supriseMap {
    final value = _supriseMap;
    if (value == null) return null;
    if (_supriseMap is EqualUnmodifiableMapView) return _supriseMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @HiveField(9)
  @WishesConverter()
  final WishesModel? wishesList;
  @override
  @HiveField(10)
  @CalendarModelConverter()
  final CalendarModel? calendarEvents;
  final List<QuestionModel>? _quizGame;
  @override
  @HiveField(11)
  @QuestionModelListConverter()
  List<QuestionModel>? get quizGame {
    final value = _quizGame;
    if (value == null) return null;
    if (_quizGame is EqualUnmodifiableListView) return _quizGame;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  @HiveField(12)
  final int quizGameScore;

  @override
  String toString() {
    return 'CategoryModel(categoryType: $categoryType, name: $name, description: $description, id: $id, titleAppear: $titleAppear, text: $text, urls: $urls, lock: $lock, supriseMap: $supriseMap, wishesList: $wishesList, calendarEvents: $calendarEvents, quizGame: $quizGame, quizGameScore: $quizGameScore)';
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleAppear, titleAppear) ||
                other.titleAppear == titleAppear) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.lock, lock) || other.lock == lock) &&
            const DeepCollectionEquality()
                .equals(other._supriseMap, _supriseMap) &&
            (identical(other.wishesList, wishesList) ||
                other.wishesList == wishesList) &&
            (identical(other.calendarEvents, calendarEvents) ||
                other.calendarEvents == calendarEvents) &&
            const DeepCollectionEquality().equals(other._quizGame, _quizGame) &&
            (identical(other.quizGameScore, quizGameScore) ||
                other.quizGameScore == quizGameScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryType,
      name,
      description,
      id,
      titleAppear,
      text,
      const DeepCollectionEquality().hash(_urls),
      lock,
      const DeepCollectionEquality().hash(_supriseMap),
      wishesList,
      calendarEvents,
      const DeepCollectionEquality().hash(_quizGame),
      quizGameScore);

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
      {@HiveField(0) required final CategoryEnum categoryType,
      @HiveField(1) required final String name,
      @HiveField(2) required final String description,
      @HiveField(3) final String? id,
      @HiveField(4) final String? titleAppear,
      @HiveField(5) final String? text,
      @HiveField(6) final List<String>? urls,
      @HiveField(7) final bool lock,
      @HiveField(8) final Map<int, Map<String, String>>? supriseMap,
      @HiveField(9) @WishesConverter() final WishesModel? wishesList,
      @HiveField(10)
      @CalendarModelConverter()
      final CalendarModel? calendarEvents,
      @HiveField(11)
      @QuestionModelListConverter()
      final List<QuestionModel>? quizGame,
      @HiveField(12) final int quizGameScore}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  @HiveField(0)
  CategoryEnum get categoryType;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  String? get id;
  @override
  @HiveField(4)
  String? get titleAppear;
  @override
  @HiveField(5)
  String? get text;
  @override
  @HiveField(6)
  List<String>? get urls;
  @override
  @HiveField(7)
  bool get lock;
  @override
  @HiveField(8)
  Map<int, Map<String, String>>? get supriseMap;
  @override
  @HiveField(9)
  @WishesConverter()
  WishesModel? get wishesList;
  @override
  @HiveField(10)
  @CalendarModelConverter()
  CalendarModel? get calendarEvents;
  @override
  @HiveField(11)
  @QuestionModelListConverter()
  List<QuestionModel>? get quizGame;
  @override
  @HiveField(12)
  int get quizGameScore;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
