// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishesModel {

 bool get lock; String? get contract; String? get first; String? get second; String? get third;/// Indexes (0-2) of the wishes already used. Parenting coupons are
/// redeemed by tearing their stub.
 List<int> get redeemed;
/// Create a copy of WishesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishesModelCopyWith<WishesModel> get copyWith => _$WishesModelCopyWithImpl<WishesModel>(this as WishesModel, _$identity);

  /// Serializes this WishesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishesModel&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.contract, contract) || other.contract == contract)&&(identical(other.first, first) || other.first == first)&&(identical(other.second, second) || other.second == second)&&(identical(other.third, third) || other.third == third)&&const DeepCollectionEquality().equals(other.redeemed, redeemed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lock,contract,first,second,third,const DeepCollectionEquality().hash(redeemed));

@override
String toString() {
  return 'WishesModel(lock: $lock, contract: $contract, first: $first, second: $second, third: $third, redeemed: $redeemed)';
}


}

/// @nodoc
abstract mixin class $WishesModelCopyWith<$Res>  {
  factory $WishesModelCopyWith(WishesModel value, $Res Function(WishesModel) _then) = _$WishesModelCopyWithImpl;
@useResult
$Res call({
 bool lock, String? contract, String? first, String? second, String? third, List<int> redeemed
});




}
/// @nodoc
class _$WishesModelCopyWithImpl<$Res>
    implements $WishesModelCopyWith<$Res> {
  _$WishesModelCopyWithImpl(this._self, this._then);

  final WishesModel _self;
  final $Res Function(WishesModel) _then;

/// Create a copy of WishesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lock = null,Object? contract = freezed,Object? first = freezed,Object? second = freezed,Object? third = freezed,Object? redeemed = null,}) {
  return _then(_self.copyWith(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as String?,first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String?,second: freezed == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as String?,third: freezed == third ? _self.third : third // ignore: cast_nullable_to_non_nullable
as String?,redeemed: null == redeemed ? _self.redeemed : redeemed // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [WishesModel].
extension WishesModelPatterns on WishesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishesModel value)  $default,){
final _that = this;
switch (_that) {
case _WishesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishesModel value)?  $default,){
final _that = this;
switch (_that) {
case _WishesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool lock,  String? contract,  String? first,  String? second,  String? third,  List<int> redeemed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishesModel() when $default != null:
return $default(_that.lock,_that.contract,_that.first,_that.second,_that.third,_that.redeemed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool lock,  String? contract,  String? first,  String? second,  String? third,  List<int> redeemed)  $default,) {final _that = this;
switch (_that) {
case _WishesModel():
return $default(_that.lock,_that.contract,_that.first,_that.second,_that.third,_that.redeemed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool lock,  String? contract,  String? first,  String? second,  String? third,  List<int> redeemed)?  $default,) {final _that = this;
switch (_that) {
case _WishesModel() when $default != null:
return $default(_that.lock,_that.contract,_that.first,_that.second,_that.third,_that.redeemed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishesModel implements WishesModel {
  const _WishesModel({required this.lock, this.contract, this.first, this.second, this.third, final  List<int> redeemed = const []}): _redeemed = redeemed;
  factory _WishesModel.fromJson(Map<String, dynamic> json) => _$WishesModelFromJson(json);

@override final  bool lock;
@override final  String? contract;
@override final  String? first;
@override final  String? second;
@override final  String? third;
/// Indexes (0-2) of the wishes already used. Parenting coupons are
/// redeemed by tearing their stub.
 final  List<int> _redeemed;
/// Indexes (0-2) of the wishes already used. Parenting coupons are
/// redeemed by tearing their stub.
@override@JsonKey() List<int> get redeemed {
  if (_redeemed is EqualUnmodifiableListView) return _redeemed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_redeemed);
}


/// Create a copy of WishesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishesModelCopyWith<_WishesModel> get copyWith => __$WishesModelCopyWithImpl<_WishesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishesModel&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.contract, contract) || other.contract == contract)&&(identical(other.first, first) || other.first == first)&&(identical(other.second, second) || other.second == second)&&(identical(other.third, third) || other.third == third)&&const DeepCollectionEquality().equals(other._redeemed, _redeemed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lock,contract,first,second,third,const DeepCollectionEquality().hash(_redeemed));

@override
String toString() {
  return 'WishesModel(lock: $lock, contract: $contract, first: $first, second: $second, third: $third, redeemed: $redeemed)';
}


}

/// @nodoc
abstract mixin class _$WishesModelCopyWith<$Res> implements $WishesModelCopyWith<$Res> {
  factory _$WishesModelCopyWith(_WishesModel value, $Res Function(_WishesModel) _then) = __$WishesModelCopyWithImpl;
@override @useResult
$Res call({
 bool lock, String? contract, String? first, String? second, String? third, List<int> redeemed
});




}
/// @nodoc
class __$WishesModelCopyWithImpl<$Res>
    implements _$WishesModelCopyWith<$Res> {
  __$WishesModelCopyWithImpl(this._self, this._then);

  final _WishesModel _self;
  final $Res Function(_WishesModel) _then;

/// Create a copy of WishesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lock = null,Object? contract = freezed,Object? first = freezed,Object? second = freezed,Object? third = freezed,Object? redeemed = null,}) {
  return _then(_WishesModel(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as bool,contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as String?,first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String?,second: freezed == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as String?,third: freezed == third ? _self.third : third // ignore: cast_nullable_to_non_nullable
as String?,redeemed: null == redeemed ? _self._redeemed : redeemed // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
