import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/domain/entities/workout_models.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class WorkoutController extends GetxController {
  // ─── Exercises (06 · Session Overview & 07 · Exercise Detail) ───
  // Display fields hold translation keys (resolved with `.tr` in the UI);
  // exercise names are backend content and stay in English.
  final List<WorkoutExercise> exercises = const [
    WorkoutExercise(
      indexLabel: '01',
      name: 'Goblet Squat',
      setsRepsLabel: 'home_workout.exercises.goblet_squat.sets_reps',
      imagePath: ImagePath.exGobletSquat,
      primaryMuscles: [
        'home_workout.muscles.quadriceps',
        'home_workout.muscles.glutes',
      ],
      equipmentLabel: 'home_workout.exercises.goblet_squat.equipment',
      shortTarget: 'home_workout.exercises.goblet_squat.target',
      recommendedKg: 15,
      proTip: 'home_workout.exercises.goblet_squat.pro_tip',
      steps: [
        'home_workout.exercises.goblet_squat.step_1',
        'home_workout.exercises.goblet_squat.step_2',
        'home_workout.exercises.goblet_squat.step_3',
        'home_workout.exercises.goblet_squat.step_4',
        'home_workout.exercises.goblet_squat.step_5',
        'home_workout.exercises.goblet_squat.step_6',
      ],
    ),
    WorkoutExercise(
      indexLabel: '02',
      name: 'Romanian Deadlift',
      setsRepsLabel: 'home_workout.exercises.romanian_deadlift.sets_reps',
      imagePath: ImagePath.exRdl,
      primaryMuscles: [
        'home_workout.muscles.hamstrings',
        'home_workout.muscles.glutes',
      ],
      equipmentLabel: 'home_workout.exercises.romanian_deadlift.equipment',
      shortTarget: 'home_workout.exercises.romanian_deadlift.target',
      recommendedKg: 20,
      proTip: 'home_workout.exercises.romanian_deadlift.pro_tip',
      steps: [
        'home_workout.exercises.romanian_deadlift.step_1',
        'home_workout.exercises.romanian_deadlift.step_2',
        'home_workout.exercises.romanian_deadlift.step_3',
        'home_workout.exercises.romanian_deadlift.step_4',
        'home_workout.exercises.romanian_deadlift.step_5',
      ],
    ),
    WorkoutExercise(
      indexLabel: '03',
      name: 'Incline DB Press · Neutral Grip',
      setsRepsLabel: 'home_workout.exercises.incline_db_press.sets_reps',
      imagePath: ImagePath.exInclinePress,
      primaryMuscles: [
        'home_workout.muscles.chest',
        'home_workout.muscles.triceps',
      ],
      equipmentLabel: 'home_workout.exercises.incline_db_press.equipment',
      shortTarget: 'home_workout.exercises.incline_db_press.target',
      recommendedKg: 10,
      proTip: 'home_workout.exercises.incline_db_press.pro_tip',
      steps: [
        'home_workout.exercises.incline_db_press.step_1',
        'home_workout.exercises.incline_db_press.step_2',
        'home_workout.exercises.incline_db_press.step_3',
        'home_workout.exercises.incline_db_press.step_4',
      ],
    ),
    WorkoutExercise(
      indexLabel: '04',
      name: 'Reverse Lunge',
      setsRepsLabel: 'home_workout.exercises.reverse_lunge.sets_reps',
      imagePath: ImagePath.exReverseLunge,
      primaryMuscles: [
        'home_workout.muscles.quadriceps',
        'home_workout.muscles.glutes',
      ],
      equipmentLabel: 'home_workout.exercises.reverse_lunge.equipment',
      shortTarget: 'home_workout.exercises.reverse_lunge.target',
      recommendedKg: 8,
      proTip: 'home_workout.exercises.reverse_lunge.pro_tip',
      steps: [
        'home_workout.exercises.reverse_lunge.step_1',
        'home_workout.exercises.reverse_lunge.step_2',
        'home_workout.exercises.reverse_lunge.step_3',
        'home_workout.exercises.reverse_lunge.step_4',
      ],
    ),
    WorkoutExercise(
      indexLabel: '05',
      name: 'Forearm Plank',
      setsRepsLabel: 'home_workout.exercises.forearm_plank.sets_reps',
      imagePath: ImagePath.exForearmPlank,
      primaryMuscles: [
        'home_workout.muscles.core',
        'home_workout.muscles.shoulders',
      ],
      equipmentLabel: 'home_workout.exercises.forearm_plank.equipment',
      shortTarget: 'home_workout.exercises.forearm_plank.target',
      recommendedKg: 0,
      proTip: 'home_workout.exercises.forearm_plank.pro_tip',
      steps: [
        'home_workout.exercises.forearm_plank.step_1',
        'home_workout.exercises.forearm_plank.step_2',
        'home_workout.exercises.forearm_plank.step_3',
      ],
    ),
    WorkoutExercise(
      indexLabel: '06',
      name: 'Glute Bridge',
      setsRepsLabel: 'home_workout.exercises.glute_bridge.sets_reps',
      imagePath: ImagePath.exGluteBridge,
      primaryMuscles: [
        'home_workout.muscles.glutes',
        'home_workout.muscles.core',
      ],
      equipmentLabel: 'home_workout.exercises.glute_bridge.equipment',
      shortTarget: 'home_workout.exercises.glute_bridge.target',
      recommendedKg: 15,
      proTip: 'home_workout.exercises.glute_bridge.pro_tip',
      steps: [
        'home_workout.exercises.glute_bridge.step_1',
        'home_workout.exercises.glute_bridge.step_2',
        'home_workout.exercises.glute_bridge.step_3',
        'home_workout.exercises.glute_bridge.step_4',
      ],
    ),
  ];

  final RxInt selectedExerciseIndex = 0.obs;
  final RxDouble playbackSpeed = 1.0.obs;

  WorkoutExercise get currentExercise => exercises[selectedExerciseIndex.value];

  // ─── 08 · Active Set Logging & Rest Timer ───
  final RxInt activeExerciseIdx = 0.obs;
  final RxInt restSecondsLeft = 90.obs;
  final RxInt restTotalSeconds = 90.obs;
  final RxList<SetLogEntry> activeSets = <SetLogEntry>[
    const SetLogEntry(
      setNumber: 1,
      previousLabel: '15 kg × 12',
      kg: 15,
      reps: 12,
      completed: true,
      restSeconds: 90,
    ),
    const SetLogEntry(
      setNumber: 2,
      previousLabel: '15 kg × 12',
      kg: 15,
      reps: 12,
      completed: true,
      restSeconds: 120,
    ),
    const SetLogEntry(
      setNumber: 3,
      previousLabel: '15 kg × 10',
      kg: 16,
      reps: 12,
      completed: false,
      restSeconds: 120,
    ),
  ].obs;

  // ─── 08b · Rest Time per Set ───
  final RxBool restPerSetMode = true.obs;
  final RxList<int> perSetRestSeconds = <int>[90, 120, 120].obs;

  // ─── 09 · RPE Feedback ───
  final RxInt selectedRpeIndex = 1.obs; // 0: 1-2, 1: 3, 2: 4, 3: 5

  // ─── 10 & 11 · Timed Circuit Player & Rest Countdown ───
  final RxInt circuitRound = 1.obs;
  final RxBool circuitPaused = false.obs;
  final RxInt circuitWorkSeconds = 28.obs;
  final RxInt roundRestSeconds = 20.obs;
  final RxInt roundRestTotal = 30.obs;
  Timer? _circuitTimer;

  // ─── 11b · End-of-Session Feedback ───
  final RxInt overallFeelIndex = 2.obs; // Just right
  final RxBool hadPain = false.obs;
  final RxInt enjoymentIndex = 0.obs; // Loved it
  final coachNoteController = TextEditingController();

  // ─── 11c · Session Summary ───
  final coachReplyController = TextEditingController();
  // Translation keys — resolved with `.tr` in the UI.
  final List<CoachAnalysisItem> coachAnalysis = const [
    CoachAnalysisItem(
      title: 'home_workout.summary.consistency_title',
      body: 'home_workout.summary.consistency_body',
    ),
    CoachAnalysisItem(
      title: 'home_workout.summary.cadence_title',
      body: 'home_workout.summary.cadence_body',
    ),
    CoachAnalysisItem(
      title: 'home_workout.summary.progression_title',
      body: 'home_workout.summary.progression_body',
    ),
    CoachAnalysisItem(
      title: 'home_workout.summary.wrist_title',
      body: 'home_workout.summary.wrist_body',
    ),
  ];

  String formatMmSs(int totalSeconds) {
    final s = totalSeconds.clamp(0, 3599);
    final m = s ~/ 60;
    final rem = s % 60;
    return '${m.toString().padLeft(2, '0')}:${rem.toString().padLeft(2, '0')}';
  }

  String formatShortMmSs(int totalSeconds) {
    final s = totalSeconds.clamp(0, 3599);
    final m = s ~/ 60;
    final rem = s % 60;
    return '$m:${rem.toString().padLeft(2, '0')}';
  }

  void openExerciseDetail(int index) {
    selectedExerciseIndex.value = index;
    Get.toNamed(AppRoute.workoutExerciseDetailScreen);
  }

  void toggleSpeed() {
    playbackSpeed.value = playbackSpeed.value == 1.0 ? 0.75 : 1.0;
  }

  void toggleSetCompleted(int index) {
    final entry = activeSets[index];
    activeSets[index] = entry.copyWith(completed: !entry.completed);
  }

  void addSet() {
    final last = activeSets.last;
    activeSets.add(
      SetLogEntry(
        setNumber: activeSets.length + 1,
        previousLabel: '${last.kg} kg × ${last.reps}',
        kg: last.kg,
        reps: last.reps,
        completed: false,
        restSeconds: last.restSeconds,
      ),
    );
    perSetRestSeconds.add(last.restSeconds);
  }

  void adjustRestTimer(int delta) {
    restSecondsLeft.value = (restSecondsLeft.value + delta).clamp(0, 300);
    if (restSecondsLeft.value > restTotalSeconds.value) {
      restTotalSeconds.value = restSecondsLeft.value;
    }
  }

  void skipRest() => restSecondsLeft.value = 0;

  void adjustPerSetRest(int setIdx, int delta) {
    final next = (perSetRestSeconds[setIdx] + delta).clamp(15, 300);
    if (!restPerSetMode.value) {
      for (int i = 0; i < perSetRestSeconds.length; i++) {
        perSetRestSeconds[i] = next;
      }
    } else {
      perSetRestSeconds[setIdx] = next;
    }
  }

  void nextExerciseOrCircuit() {
    if (activeExerciseIdx.value < exercises.length - 1) {
      activeExerciseIdx.value++;
    } else {
      Get.toNamed(AppRoute.workoutEndFeedbackScreen);
    }
  }

  void prevExercise() {
    if (activeExerciseIdx.value > 0) {
      activeExerciseIdx.value--;
    }
  }

  void addRoundRestSeconds(int delta) {
    roundRestSeconds.value = (roundRestSeconds.value + delta).clamp(0, 120);
    if (roundRestSeconds.value > roundRestTotal.value) {
      roundRestTotal.value = roundRestSeconds.value;
    }
  }

  void openActiveSet() => Get.toNamed(AppRoute.workoutActiveSetScreen);
  void openTimedCircuit() => Get.toNamed(AppRoute.workoutTimedCircuitScreen);
  void openRestCountdown() => Get.toNamed(AppRoute.workoutRestCountdownScreen);
  void openEndFeedback() => Get.toNamed(AppRoute.workoutEndFeedbackScreen);
  void openSessionSummary() =>
      Get.toNamed(AppRoute.workoutSessionSummaryScreen);

  @override
  void onClose() {
    _circuitTimer?.cancel();
    coachNoteController.dispose();
    coachReplyController.dispose();
    super.onClose();
  }
}
