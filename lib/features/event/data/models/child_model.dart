import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/calendar_converters_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_model.freezed.dart';
part 'child_model.g.dart';

/// A child of the couple. Kept on the shared event, so both see the same
/// children; the family categories unlock by the children's ages.
@freezed
sealed class ChildModel with _$ChildModel {
  const factory ChildModel({
    required String id,
    required String name,
    @DateConverter() required DateTime dateOfBirth,
    @Default("female") String gender,
  }) = _ChildModel;

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);
}

extension ChildModelX on ChildModel {
  bool get isGirl => gender == "female";

  String get emoji => isGirl ? "👧" : "👦";

  /// Whole days lived until [now] (today by default); never negative.
  int daysAlive([DateTime? now]) {
    final DateTime today = _day(now ?? DateTime.now());
    final int days = today.difference(_day(dateOfBirth)).inDays;
    return days < 0 ? 0 : days;
  }

  /// Age in whole years at [now].
  int yearsOld([DateTime? now]) =>
      AgeCalculator.age(dateOfBirth, today: now ?? DateTime.now()).years;

  /// "3 months", "1 year and 2 months"... in the app language.
  String ageText([DateTime? now]) => ageBetween(dateOfBirth, now);

  static DateTime _day(DateTime date) =>
      DateTime.utc(date.year, date.month, date.day);
}

/// The age from [from] to [to] (today by default) as text, e.g. "5 days",
/// "3 months", "1 year and 2 months".
String ageBetween(DateTime from, [DateTime? to]) {
  final DateTime end = to ?? DateTime.now();
  if (end.isBefore(from)) return t.age_days(n: 0);
  final DateDuration age = AgeCalculator.age(from, today: end);
  if (age.years == 0 && age.months == 0) return _days(age.days);
  if (age.years == 0) return _months(age.months);
  if (age.months == 0) return _years(age.years);
  return t.age_and(first: _years(age.years), second: _months(age.months));
}

String _years(int n) => switch (n) {
  1 => t.age_year_one,
  2 => t.age_year_two,
  _ => t.age_years(n: n),
};

String _months(int n) => switch (n) {
  1 => t.age_month_one,
  2 => t.age_month_two,
  _ => t.age_months(n: n),
};

String _days(int n) => switch (n) {
  1 => t.age_day_one,
  2 => t.age_day_two,
  _ => t.age_days(n: n),
};

/// "Noa", "Noa and Ido", "Noa, Ido and Tom".
String joinNames(List<ChildModel> children) {
  final List<String> names = [for (final child in children) child.name];
  if (names.length < 2) return names.firstOrNull ?? '';
  return t.names_and(
    first: names.sublist(0, names.length - 1).join(', '),
    last: names.last,
  );
}
