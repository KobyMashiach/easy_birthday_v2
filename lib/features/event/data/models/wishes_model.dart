import 'package:freezed_annotation/freezed_annotation.dart';
part 'wishes_model.freezed.dart';
part 'wishes_model.g.dart';

@freezed
sealed class WishesModel with _$WishesModel {
  const factory WishesModel({
    required bool lock,
    String? contract,
    String? first,
    String? second,
    String? third,

    /// Indexes (0-2) of the wishes already used. Parenting coupons are
    /// redeemed by tearing their stub.
    @Default([]) List<int> redeemed,
  }) = _WishesModel;

  factory WishesModel.fromJson(Map<String, dynamic> json) =>
      _$WishesModelFromJson(json);
}
