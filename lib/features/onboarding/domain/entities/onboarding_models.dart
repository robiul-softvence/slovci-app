/// Pure Dart domain models for the MILON Onboarding flow.
enum GenderOption { female, male, other }

enum DemoModelOption { woman, man }

enum PrimaryGoalOption { loseWeight, buildMuscle, stayFit }

enum ActivityLevelOption { sedentary, active, veryActive }

enum TrainingEnvironmentOption { gym, home, hybrid }

enum PreferredTimeOption { morning, lunchBreak, evening }

enum InjurySeverity { mild, moderate, severe }

enum MotivationFrequency { daily, threePerWeek, weekly, off }

enum FoodPreferenceState { neutral, love, dislike }

class InjuryDetail {
  const InjuryDetail({
    required this.zone,
    required this.viewLabel,
    required this.condition,
    required this.severity,
    this.notes = '',
  });

  final String zone;
  final String viewLabel;
  final String condition;
  final InjurySeverity severity;
  final String notes;

  InjuryDetail copyWith({
    String? condition,
    InjurySeverity? severity,
    String? notes,
  }) {
    return InjuryDetail(
      zone: zone,
      viewLabel: viewLabel,
      condition: condition ?? this.condition,
      severity: severity ?? this.severity,
      notes: notes ?? this.notes,
    );
  }
}

class WeekDayPlan {
  const WeekDayPlan({
    required this.dayShort,
    required this.title,
    required this.durationLabel,
    required this.type,
  });

  final String dayShort;
  final String title;
  final String durationLabel;
  final DayPlanType type;
}

enum DayPlanType { workout, activeRecovery, rest }
