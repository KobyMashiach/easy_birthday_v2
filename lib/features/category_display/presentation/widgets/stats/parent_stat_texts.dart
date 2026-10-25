import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/parent_stat.dart';
import 'package:intl/intl.dart';

extension ParentStatTexts on ParentStat {
  /// "Diapers changed" (the total's label).
  String get totalLabel => switch (this) {
    ParentStat.diapers => t.stat_diapers,
    ParentStat.coffee => t.stat_coffee,
    ParentStat.nightWakeups => t.stat_night_wakeups,
    ParentStat.feedings => t.stat_feedings,
    ParentStat.lullabies => t.stat_lullabies,
    ParentStat.laundry => t.stat_laundry,
    ParentStat.kisses => t.stat_kisses,
  };

  /// "Diapers a day" (the editor's label).
  String get dailyLabel => switch (this) {
    ParentStat.diapers => t.stat_daily_diapers,
    ParentStat.coffee => t.stat_daily_coffee,
    ParentStat.nightWakeups => t.stat_daily_night_wakeups,
    ParentStat.feedings => t.stat_daily_feedings,
    ParentStat.lullabies => t.stat_daily_lullabies,
    ParentStat.laundry => t.stat_daily_laundry,
    ParentStat.kisses => t.stat_daily_kisses,
  };

  /// A funny comparison for [total].
  String fact(int total) => switch (this) {
    // A used diaper is about 3cm thick; a floor is about 3m.
    ParentStat.diapers => t.stat_fact_diapers(
      meters: formatStatNumber(total * 0.03),
      floors: formatStatNumber(total * 0.03 / 3),
    ),
    // A cup is 250ml; a bathtub 150 liters.
    ParentStat.coffee => t.stat_fact_coffee(
      liters: formatStatNumber(total * 0.25),
      baths: formatStatNumber(total * 0.25 / 150),
    ),
    // About 20 minutes awake each time; a night is 8 hours.
    ParentStat.nightWakeups => t.stat_fact_night_wakeups(
      hours: formatStatNumber(total * 20 / 60),
      nights: formatStatNumber(total * 20 / 60 / 8),
    ),
    // About 120ml a feeding.
    ParentStat.feedings => t.stat_fact_feedings(
      liters: formatStatNumber(total * 0.12),
    ),
    // About 3 minutes a song.
    ParentStat.lullabies => t.stat_fact_lullabies(
      hours: formatStatNumber(total * 3 / 60),
    ),
    // About 15 minutes of folding tiny clothes a load.
    ParentStat.laundry => t.stat_fact_laundry(
      hours: formatStatNumber(total * 0.25),
    ),
    ParentStat.kisses => t.stat_fact_kisses,
  };
}

/// One decimal below 10, whole numbers with grouping above.
String formatStatNumber(num value) {
  if (value < 10) {
    return NumberFormat(
      '0.#',
      LocaleSettings.currentLocale.languageCode,
    ).format(value);
  }
  return NumberFormat.decimalPattern(
    LocaleSettings.currentLocale.languageCode,
  ).format(value.round());
}

/// The total of a stat whose [daily] value is per child, by [at] (today by
/// default): each child counts from their own birth.
int parentStatTotalFor(
  double daily,
  List<ChildModel> children, [
  DateTime? at,
]) {
  int total = 0;
  for (final child in children) {
    total += parentStatTotal(daily, child.daysAlive(at));
  }
  return total;
}
