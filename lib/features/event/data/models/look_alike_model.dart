import 'package:freezed_annotation/freezed_annotation.dart';

part 'look_alike_model.freezed.dart';
part 'look_alike_model.g.dart';

/// "Who does the child look like?": a photo of each child and of each parent
/// (at the same age, or a current one), and each parent's pick per child
/// and feature. Picks are [LookAlikeModel.owner] / [LookAlikeModel.partner],
/// keyed by [lookAlikeKey].
@freezed
sealed class LookAlikeModel with _$LookAlikeModel {
  static const String owner = "owner";
  static const String partner = "partner";

  const factory LookAlikeModel({
    /// By child id.
    @Default({}) Map<String, String> childImageUrls,
    String? ownerImageUrl,
    String? partnerImageUrl,
    @Default({}) Map<String, String> ownerAnswers,
    @Default({}) Map<String, String> partnerAnswers,

    /// The partner finished the game; the owner can reopen it.
    @Default(false) bool lock,
  }) = _LookAlikeModel;

  factory LookAlikeModel.fromJson(Map<String, dynamic> json) =>
      _$LookAlikeModelFromJson(json);
}

/// An odd number of features, so a finished game never ends in a tie.
enum LookAlikeFeature {
  eyes("👀"),
  nose("👃"),
  mouth("👄"),
  ears("👂"),
  hair("💇"),
  smile("😁"),
  hands("✋"),
  laugh("😂"),
  temper("😤")
  ;

  final String emoji;
  const LookAlikeFeature(this.emoji);
}

/// The answers key of [feature] for the child [childId].
String lookAlikeKey(String childId, LookAlikeFeature feature) =>
    "$childId.${feature.name}";

/// The tally of [answers] (of [childId] only, when given): (owner picks,
/// partner picks).
(int owner, int partner) lookAlikeScore(
  Map<String, String> answers, [
  String? childId,
]) {
  int owner = 0;
  int partner = 0;
  for (final MapEntry(:key, value: answer) in answers.entries) {
    if (childId != null && !key.startsWith("$childId.")) continue;
    if (answer == LookAlikeModel.owner) owner++;
    if (answer == LookAlikeModel.partner) partner++;
  }
  return (owner, partner);
}
