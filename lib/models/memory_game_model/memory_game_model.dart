import 'package:freezed_annotation/freezed_annotation.dart';
part 'memory_game_model.freezed.dart';
part 'memory_game_model.g.dart';

@freezed
class MemoryGameModel with _$MemoryGameModel {
  const factory MemoryGameModel({
    required List<String> imagesUrls,
    @Default(0) int score,
    @Default(false) bool lock,
  }) = _MemoryGameModel;

  factory MemoryGameModel.fromJson(Map<String, dynamic> json) =>
      _$MemoryGameModelFromJson(json);
}
