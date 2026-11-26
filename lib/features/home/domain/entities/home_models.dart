/// Pure Dart domain models for the MILON Home feature.
enum DayStatusDot { completed, active, upcoming }

class HomeWeekDay {
  const HomeWeekDay({
    required this.weekday,
    required this.dayNumber,
    required this.status,
  });

  /// Short English identifier (`Mon`…`Sun`), not display text.
  final String weekday;
  final int dayNumber;
  final DayStatusDot status;
}

class HomeMealItem {
  const HomeMealItem({
    required this.id,
    required this.tag,
    required this.title,
    required this.prepLabel,
    required this.kcal,
    required this.proteinGrams,
    required this.isPlanned,
    this.logged = false,
  });

  final String id;

  /// Translation keys for the display labels.
  final String tag;
  final String title;
  final String prepLabel;
  final int kcal;
  final int proteinGrams;
  final bool isPlanned;
  final bool logged;

  HomeMealItem copyWith({bool? logged}) {
    return HomeMealItem(
      id: id,
      tag: tag,
      title: title,
      prepLabel: prepLabel,
      kcal: kcal,
      proteinGrams: proteinGrams,
      isPlanned: isPlanned,
      logged: logged ?? this.logged,
    );
  }
}
