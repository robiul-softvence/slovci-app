import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/domain/entities/workout_models.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class WorkoutController extends GetxController {
  // ─── Exercises (06 · Session Overview & 07 · Exercise Detail) ───
  final List<WorkoutExercise> exercises = const [
    WorkoutExercise(
      indexLabel: '01',
      name: 'Goblet Squat',
      setsRepsLabel: '3 sets × 12 reps · 15 kg',
      imagePath: ImagePath.exGobletSquat,
      primaryMuscles: ['Quadriceps', 'Glutes'],
      equipmentLabel: 'Dumbbell · 15 kg',
      shortTarget: '3 × 12',
      recommendedKg: 15,
      proTip:
          'Keep the dumbbell close to your chest and drive through your heels. Never let your knees cave in.',
      steps: [
        'Stand with feet shoulder-width apart, toes slightly turned out.',
        'Hold one dumbbell vertically against your chest with both hands.',
        'Brace your core and keep your chest tall and proud.',
        'Push your hips back and bend your knees to lower down.',
        'Descend until your thighs are parallel to the floor.',
        'Drive through your heels to return to standing. Exhale.',
      ],
    ),
    WorkoutExercise(
      indexLabel: '02',
      name: 'Romanian Deadlift',
      setsRepsLabel: '3 sets × 10 reps · 20 kg',
      imagePath: ImagePath.exRdl,
      primaryMuscles: ['Hamstrings', 'Glutes'],
      equipmentLabel: 'Dumbbells · 20 kg',
      shortTarget: '3 × 10',
      recommendedKg: 20,
      proTip:
          'Hinge at the hips with soft knees and keep the dumbbells grazing your thighs.',
      steps: [
        'Stand tall holding dumbbells in front of your thighs.',
        'Slightly unlock your knees and brace your core.',
        'Push your hips straight back while keeping your spine neutral.',
        'Lower until you feel a deep stretch in your hamstrings.',
        'Drive hips forward and squeeze glutes to stand back up.',
      ],
    ),
    WorkoutExercise(
      indexLabel: '03',
      name: 'Incline DB Press · Neutral Grip',
      setsRepsLabel: '3 sets × 12 reps · 10 kg',
      imagePath: ImagePath.exInclinePress,
      primaryMuscles: ['Chest', 'Triceps'],
      equipmentLabel: 'Dumbbells · 10 kg',
      shortTarget: '3 × 12',
      recommendedKg: 10,
      proTip:
          'Neutral palms-in grip keeps wrists straight and removes joint compression.',
      steps: [
        'Set bench to a 30° incline and hold dumbbells with palms facing each other.',
        'Press weights up smoothly above your upper chest.',
        'Lower slowly with elbows at a 45° angle.',
        'Pause lightly at chest level, then press back up.',
      ],
    ),
    WorkoutExercise(
      indexLabel: '04',
      name: 'Reverse Lunge',
      setsRepsLabel: '3 sets × 10 reps/leg · 8 kg',
      imagePath: ImagePath.exReverseLunge,
      primaryMuscles: ['Quadriceps', 'Glutes'],
      equipmentLabel: 'Dumbbells · 8 kg',
      shortTarget: '3 × 10/leg',
      recommendedKg: 8,
      proTip: 'Step back softly and keep your front shin nearly vertical.',
      steps: [
        'Stand tall with dumbbells by your sides.',
        'Step one foot backward and lower your back knee toward the floor.',
        'Push through your front heel to return to standing.',
        'Alternate legs or finish all reps on one side.',
      ],
    ),
    WorkoutExercise(
      indexLabel: '05',
      name: 'Forearm Plank',
      setsRepsLabel: '3 sets × 45 sec',
      imagePath: ImagePath.exForearmPlank,
      primaryMuscles: ['Core', 'Shoulders'],
      equipmentLabel: 'Bodyweight · Wrist-safe',
      shortTarget: '3 × 45s',
      recommendedKg: 0,
      proTip:
          'Done on forearms to protect your wrists. Squeeze glutes and draw ribs down.',
      steps: [
        'Place forearms flat on the mat with elbows directly under shoulders.',
        'Extend legs back and lift hips into a straight line.',
        'Breathe steadily and hold without letting hips sag.',
      ],
    ),
    WorkoutExercise(
      indexLabel: '06',
      name: 'Glute Bridge',
      setsRepsLabel: '3 sets × 15 reps · 15 kg',
      imagePath: ImagePath.exGluteBridge,
      primaryMuscles: ['Glutes', 'Core'],
      equipmentLabel: 'Dumbbell · 15 kg',
      shortTarget: '3 × 15',
      recommendedKg: 15,
      proTip: 'Pause for 1 second at the top with full glute squeeze.',
      steps: [
        'Lie on your back with knees bent and feet flat on the floor.',
        'Rest a dumbbell across your hips.',
        'Drive through heels to lift hips until knees, hips, and shoulders align.',
        'Lower with control and repeat.',
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
  final List<CoachAnalysisItem> coachAnalysis = const [
    CoachAnalysisItem(
      title: 'Consistency',
      body: 'You hit every target rep across all 18 sets. 3rd perfect session in a row.',
    ),
    CoachAnalysisItem(
      title: 'Cadence',
      body: 'Squat tempo stayed steady at ~3 s down / 1 s up. Excellent control.',
    ),
    CoachAnalysisItem(
      title: 'Progression',
      body: 'Increase Goblet Squat to 17 kg next session; keep RDL at 20 kg.',
    ),
    CoachAnalysisItem(
      title: 'Wrist safety',
      body: 'No palm-loaded moves were needed. Keep using neutral grips.',
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
