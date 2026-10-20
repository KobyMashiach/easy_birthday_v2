// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {

 CategoryEnum get categoryType; String get name; String get description; String? get id; String? get titleAppear; String? get text; List<String>? get urls; bool get lock;// Stored under the original (misspelled) key in Firestore.
@JsonKey(name: 'supriseMap') Map<int, Map<String, String>>? get surpriseMap;@WishesConverter() WishesModel? get wishesList;@CalendarModelConverter() CalendarModel? get calendarEvents;@QuestionModelListConverter() List<QuestionModel>? get quizGame; int get quizGameScore; String get inPlan;@MemoryConverter() MemoryGameModel? get memoryGame;
/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<CategoryModel> get copyWith => _$CategoryModelCopyWithImpl<CategoryModel>(this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryModel&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAppear, titleAppear) || other.titleAppear == titleAppear)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.urls, urls)&&(identical(other.lock, lock) || other.lock == lock)&&const DeepCollectionEquality().equals(other.surpriseMap, surpriseMap)&&(identical(other.wishesList, wishesList) || other.wishesList == wishesList)&&(identical(other.calendarEvents, calendarEvents) || other.calendarEvents == calendarEvents)&&const DeepCollectionEquality().equals(other.quizGame, quizGame)&&(identical(other.quizGameScore, quizGameScore) || other.quizGameScore == quizGameScore)&&(identical(other.inPlan, inPlan) || other.inPlan == inPlan)&&(identical(other.memoryGame, memoryGame) || other.memoryGame == memoryGame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryType,name,description,id,titleAppear,text,const DeepCollectionEquality().hash(urls),lock,const DeepCollectionEquality().hash(surpriseMap),wishesList,calendarEvents,const DeepCollectionEquality().hash(quizGame),quizGameScore,inPlan,memoryGame);

@override
String toString() {
  return 'CategoryModel(categoryType: $categoryType, name: $name, description: $description, id: $id, titleAppear: $titleAppear, text: $text, urls: $urls, lock: $lock, surpriseMap: $surpriseMap, wishesList: $wishesList, calendarEvents: $calendarEvents, quizGame: $quizGame, quizGameScore: $quizGameScore, inPlan: $inPlan, memoryGame: $memoryGame)';
}


}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res>  {
  factory $CategoryModelCopyWith(CategoryModel value, $Res Function(CategoryModel) _then) = _$CategoryModelCopyWithImpl;
@useResult
$Res call({
 CategoryEnum categoryType, String name, String description, String? id, String? titleAppear, String? text, List<String>? urls, bool lock,@JsonKey(name: 'supriseMap') Map<int, Map<String, String>>? surpriseMap,@WishesConverter() WishesModel? wishesList,@CalendarModelConverter() CalendarModel? calendarEvents,@QuestionModelListConverter() List<QuestionModel>? quizGame, int quizGameScore, String inPlan,@MemoryConverter() MemoryGameModel? memoryGame
});


$WishesModelCopyWith<$Res>? get wishesList;$CalendarModelCopyWith<$Res>? get calendarEvents;$MemoryGameModelCopyWith<$Res>? get memoryGame;

}
/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryType = null,Object? name = null,Object? description = null,Object? id = freezed,Object? titleAppear = freezed,Object? text = freezed,Object? urls = freezed,Object? lock = null,Object? surpriseMap = freezed,Object? wishesList = freezed,Object? calendarEvents = freezed,Object? quizGame = freezed,Object? quizGameScore = null,Object? inPlan = null,Object? memoryGame = freezed,}) {
  return _then(_self.copyWith(
categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryEnum,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titleAppear: freezed == titleAppear ? _self.titleAppear : titleAppear // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,urls: freezed == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>?,lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,surpriseMap: freezed == surpriseMap ? _self.surpriseMap : surpriseMap // ignore: cast_nullable_to_non_nullable
as Map<int, Map<String, String>>?,wishesList: freezed == wishesList ? _self.wishesList : wishesList // ignore: cast_nullable_to_non_nullable
as WishesModel?,calendarEvents: freezed == calendarEvents ? _self.calendarEvents : calendarEvents // ignore: cast_nullable_to_non_nullable
as CalendarModel?,quizGame: freezed == quizGame ? _self.quizGame : quizGame // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>?,quizGameScore: null == quizGameScore ? _self.quizGameScore : quizGameScore // ignore: cast_nullable_to_non_nullable
as int,inPlan: null == inPlan ? _self.inPlan : inPlan // ignore: cast_nullable_to_non_nullable
as String,memoryGame: freezed == memoryGame ? _self.memoryGame : memoryGame // ignore: cast_nullable_to_non_nullable
as MemoryGameModel?,
  ));
}
/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WishesModelCopyWith<$Res>? get wishesList {
    if (_self.wishesList == null) {
    return null;
  }

  return $WishesModelCopyWith<$Res>(_self.wishesList!, (value) {
    return _then(_self.copyWith(wishesList: value));
  });
}/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarModelCopyWith<$Res>? get calendarEvents {
    if (_self.calendarEvents == null) {
    return null;
  }

  return $CalendarModelCopyWith<$Res>(_self.calendarEvents!, (value) {
    return _then(_self.copyWith(calendarEvents: value));
  });
}/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryGameModelCopyWith<$Res>? get memoryGame {
    if (_self.memoryGame == null) {
    return null;
  }

  return $MemoryGameModelCopyWith<$Res>(_self.memoryGame!, (value) {
    return _then(_self.copyWith(memoryGame: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryModel].
extension CategoryModelPatterns on CategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryEnum categoryType,  String name,  String description,  String? id,  String? titleAppear,  String? text,  List<String>? urls,  bool lock, @JsonKey(name: 'supriseMap')  Map<int, Map<String, String>>? surpriseMap, @WishesConverter()  WishesModel? wishesList, @CalendarModelConverter()  CalendarModel? calendarEvents, @QuestionModelListConverter()  List<QuestionModel>? quizGame,  int quizGameScore,  String inPlan, @MemoryConverter()  MemoryGameModel? memoryGame)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.categoryType,_that.name,_that.description,_that.id,_that.titleAppear,_that.text,_that.urls,_that.lock,_that.surpriseMap,_that.wishesList,_that.calendarEvents,_that.quizGame,_that.quizGameScore,_that.inPlan,_that.memoryGame);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryEnum categoryType,  String name,  String description,  String? id,  String? titleAppear,  String? text,  List<String>? urls,  bool lock, @JsonKey(name: 'supriseMap')  Map<int, Map<String, String>>? surpriseMap, @WishesConverter()  WishesModel? wishesList, @CalendarModelConverter()  CalendarModel? calendarEvents, @QuestionModelListConverter()  List<QuestionModel>? quizGame,  int quizGameScore,  String inPlan, @MemoryConverter()  MemoryGameModel? memoryGame)  $default,) {final _that = this;
switch (_that) {
case _CategoryModel():
return $default(_that.categoryType,_that.name,_that.description,_that.id,_that.titleAppear,_that.text,_that.urls,_that.lock,_that.surpriseMap,_that.wishesList,_that.calendarEvents,_that.quizGame,_that.quizGameScore,_that.inPlan,_that.memoryGame);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryEnum categoryType,  String name,  String description,  String? id,  String? titleAppear,  String? text,  List<String>? urls,  bool lock, @JsonKey(name: 'supriseMap')  Map<int, Map<String, String>>? surpriseMap, @WishesConverter()  WishesModel? wishesList, @CalendarModelConverter()  CalendarModel? calendarEvents, @QuestionModelListConverter()  List<QuestionModel>? quizGame,  int quizGameScore,  String inPlan, @MemoryConverter()  MemoryGameModel? memoryGame)?  $default,) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.categoryType,_that.name,_that.description,_that.id,_that.titleAppear,_that.text,_that.urls,_that.lock,_that.surpriseMap,_that.wishesList,_that.calendarEvents,_that.quizGame,_that.quizGameScore,_that.inPlan,_that.memoryGame);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryModel implements CategoryModel {
  const _CategoryModel({required this.categoryType, required this.name, required this.description, this.id, this.titleAppear, this.text, final  List<String>? urls, this.lock = false, @JsonKey(name: 'supriseMap') final  Map<int, Map<String, String>>? surpriseMap, @WishesConverter() this.wishesList, @CalendarModelConverter() this.calendarEvents, @QuestionModelListConverter() final  List<QuestionModel>? quizGame, this.quizGameScore = 0, this.inPlan = "Free", @MemoryConverter() this.memoryGame}): _urls = urls,_surpriseMap = surpriseMap,_quizGame = quizGame;
  factory _CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

@override final  CategoryEnum categoryType;
@override final  String name;
@override final  String description;
@override final  String? id;
@override final  String? titleAppear;
@override final  String? text;
 final  List<String>? _urls;
@override List<String>? get urls {
  final value = _urls;
  if (value == null) return null;
  if (_urls is EqualUnmodifiableListView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool lock;
// Stored under the original (misspelled) key in Firestore.
 final  Map<int, Map<String, String>>? _surpriseMap;
// Stored under the original (misspelled) key in Firestore.
@override@JsonKey(name: 'supriseMap') Map<int, Map<String, String>>? get surpriseMap {
  final value = _surpriseMap;
  if (value == null) return null;
  if (_surpriseMap is EqualUnmodifiableMapView) return _surpriseMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@WishesConverter() final  WishesModel? wishesList;
@override@CalendarModelConverter() final  CalendarModel? calendarEvents;
 final  List<QuestionModel>? _quizGame;
@override@QuestionModelListConverter() List<QuestionModel>? get quizGame {
  final value = _quizGame;
  if (value == null) return null;
  if (_quizGame is EqualUnmodifiableListView) return _quizGame;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  int quizGameScore;
@override@JsonKey() final  String inPlan;
@override@MemoryConverter() final  MemoryGameModel? memoryGame;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryModelCopyWith<_CategoryModel> get copyWith => __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryModel&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.id, id) || other.id == id)&&(identical(other.titleAppear, titleAppear) || other.titleAppear == titleAppear)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._urls, _urls)&&(identical(other.lock, lock) || other.lock == lock)&&const DeepCollectionEquality().equals(other._surpriseMap, _surpriseMap)&&(identical(other.wishesList, wishesList) || other.wishesList == wishesList)&&(identical(other.calendarEvents, calendarEvents) || other.calendarEvents == calendarEvents)&&const DeepCollectionEquality().equals(other._quizGame, _quizGame)&&(identical(other.quizGameScore, quizGameScore) || other.quizGameScore == quizGameScore)&&(identical(other.inPlan, inPlan) || other.inPlan == inPlan)&&(identical(other.memoryGame, memoryGame) || other.memoryGame == memoryGame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryType,name,description,id,titleAppear,text,const DeepCollectionEquality().hash(_urls),lock,const DeepCollectionEquality().hash(_surpriseMap),wishesList,calendarEvents,const DeepCollectionEquality().hash(_quizGame),quizGameScore,inPlan,memoryGame);

@override
String toString() {
  return 'CategoryModel(categoryType: $categoryType, name: $name, description: $description, id: $id, titleAppear: $titleAppear, text: $text, urls: $urls, lock: $lock, surpriseMap: $surpriseMap, wishesList: $wishesList, calendarEvents: $calendarEvents, quizGame: $quizGame, quizGameScore: $quizGameScore, inPlan: $inPlan, memoryGame: $memoryGame)';
}


}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res> implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(_CategoryModel value, $Res Function(_CategoryModel) _then) = __$CategoryModelCopyWithImpl;
@override @useResult
$Res call({
 CategoryEnum categoryType, String name, String description, String? id, String? titleAppear, String? text, List<String>? urls, bool lock,@JsonKey(name: 'supriseMap') Map<int, Map<String, String>>? surpriseMap,@WishesConverter() WishesModel? wishesList,@CalendarModelConverter() CalendarModel? calendarEvents,@QuestionModelListConverter() List<QuestionModel>? quizGame, int quizGameScore, String inPlan,@MemoryConverter() MemoryGameModel? memoryGame
});


@override $WishesModelCopyWith<$Res>? get wishesList;@override $CalendarModelCopyWith<$Res>? get calendarEvents;@override $MemoryGameModelCopyWith<$Res>? get memoryGame;

}
/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryType = null,Object? name = null,Object? description = null,Object? id = freezed,Object? titleAppear = freezed,Object? text = freezed,Object? urls = freezed,Object? lock = null,Object? surpriseMap = freezed,Object? wishesList = freezed,Object? calendarEvents = freezed,Object? quizGame = freezed,Object? quizGameScore = null,Object? inPlan = null,Object? memoryGame = freezed,}) {
  return _then(_CategoryModel(
categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryEnum,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titleAppear: freezed == titleAppear ? _self.titleAppear : titleAppear // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,urls: freezed == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>?,lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,surpriseMap: freezed == surpriseMap ? _self._surpriseMap : surpriseMap // ignore: cast_nullable_to_non_nullable
as Map<int, Map<String, String>>?,wishesList: freezed == wishesList ? _self.wishesList : wishesList // ignore: cast_nullable_to_non_nullable
as WishesModel?,calendarEvents: freezed == calendarEvents ? _self.calendarEvents : calendarEvents // ignore: cast_nullable_to_non_nullable
as CalendarModel?,quizGame: freezed == quizGame ? _self._quizGame : quizGame // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>?,quizGameScore: null == quizGameScore ? _self.quizGameScore : quizGameScore // ignore: cast_nullable_to_non_nullable
as int,inPlan: null == inPlan ? _self.inPlan : inPlan // ignore: cast_nullable_to_non_nullable
as String,memoryGame: freezed == memoryGame ? _self.memoryGame : memoryGame // ignore: cast_nullable_to_non_nullable
as MemoryGameModel?,
  ));
}

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WishesModelCopyWith<$Res>? get wishesList {
    if (_self.wishesList == null) {
    return null;
  }

  return $WishesModelCopyWith<$Res>(_self.wishesList!, (value) {
    return _then(_self.copyWith(wishesList: value));
  });
}/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarModelCopyWith<$Res>? get calendarEvents {
    if (_self.calendarEvents == null) {
    return null;
  }

  return $CalendarModelCopyWith<$Res>(_self.calendarEvents!, (value) {
    return _then(_self.copyWith(calendarEvents: value));
  });
}/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemoryGameModelCopyWith<$Res>? get memoryGame {
    if (_self.memoryGame == null) {
    return null;
  }

  return $MemoryGameModelCopyWith<$Res>(_self.memoryGame!, (value) {
    return _then(_self.copyWith(memoryGame: value));
  });
}
}

// dart format on
