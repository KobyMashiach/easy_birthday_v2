/// The "parenting stats" the owner fills in as daily averages. Stored in
/// `CategoryModel.parentStats` keyed by [ParentStat.name]; the totals are
/// the daily value times the days the child has lived.
enum ParentStat {
  diapers("🧷", 6),
  coffee("☕", 3),
  nightWakeups("🌙", 2),
  feedings("🍼", 7),
  lullabies("🎶", 3),
  laundry("🧺", 1),
  kisses("😘", 30)
  ;

  final String emoji;

  /// Suggested daily value for a new stats category.
  final double defaultDaily;

  const ParentStat(this.emoji, this.defaultDaily);

  /// The stats with a daily value above zero, in enum order.
  static List<(ParentStat stat, double daily)> active(
    Map<String, double>? daily,
  ) => [
    for (final stat in values)
      if ((daily?[stat.name] ?? 0) > 0) (stat, daily![stat.name]!),
  ];

  static Map<String, double> get defaults => {
    for (final stat in values) stat.name: stat.defaultDaily,
  };
}

/// [daily] times [days], rounded.
int parentStatTotal(double daily, int days) => (daily * days).round();
