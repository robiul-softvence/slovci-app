/// Pure Dart domain models for the MILON Workout feature.
class WorkoutExercise {
  const WorkoutExercise({
    required this.indexLabel,
    required this.name,
    required this.setsRepsLabel,
    required this.imagePath,
    required this.primaryMuscles,
    required this.equipmentLabel,
    required this.shortTarget,
    required this.recommendedKg,
    required this.proTip,
    required this.steps,
  });

  final String indexLabel;
  final String name;

  // The label fields below (and [primaryMuscles], [proTip], [steps]) hold
  // translation keys; the UI resolves them with `.tr`.
  final String setsRepsLabel;
  final String imagePath;
  final List<String> primaryMuscles;
  final String equipmentLabel;
  final String shortTarget;
  final int recommendedKg;
  final String proTip;
  final List<String> steps;
}

class SetLogEntry {
  const SetLogEntry({
    required this.setNumber,
    required this.previousLabel,
    required this.kg,
    required this.reps,
    required this.completed,
    this.restSeconds = 90,
  });

  final int setNumber;
  final String previousLabel;
  final int kg;
  final int reps;
  final bool completed;
  final int restSeconds;

  SetLogEntry copyWith({
    int? kg,
    int? reps,
    bool? completed,
    int? restSeconds,
  }) {
    return SetLogEntry(
      setNumber: setNumber,
      previousLabel: previousLabel,
      kg: kg ?? this.kg,
      reps: reps ?? this.reps,
      completed: completed ?? this.completed,
      restSeconds: restSeconds ?? this.restSeconds,
    );
  }
}

class CoachAnalysisItem {
  const CoachAnalysisItem({required this.title, required this.body});

  /// Translation keys.

  final String title;
  final String body;
}
