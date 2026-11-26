import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_tamplate/features/onboarding/domain/entities/onboarding_models.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

/// Shared reactive state controller across all 14 MILON Onboarding screens.
class OnboardingController extends GetxController {
  // ─── 01 · Profile & Goals ───
  final nameController = TextEditingController(text: 'Solène');
  final RxString firstName = 'Solène'.obs;
  final Rx<GenderOption> gender = GenderOption.female.obs;
  final Rx<DemoModelOption> demoModel = DemoModelOption.woman.obs;
  final RxInt age = 28.obs;
  final RxInt heightCm = 165.obs;
  final RxInt currentWeightKg = 62.obs;
  final Rx<PrimaryGoalOption> primaryGoal = PrimaryGoalOption.loseWeight.obs;
  final Rx<ActivityLevelOption> activityLevel =
      ActivityLevelOption.sedentary.obs;

  // ─── 01b · Target Weight & Pace ───
  final RxInt targetWeightKg = 58.obs;

  int get weightDeltaKg => targetWeightKg.value - currentWeightKg.value;

  double get weeklyPaceKg {
    if (weightDeltaKg == 0) return 0;
    return weightDeltaKg < 0 ? -0.4 : 0.3;
  }

  int get estimatedWeeks {
    final diff = weightDeltaKg.abs();
    if (diff == 0) return 8;
    final pace = weeklyPaceKg.abs();
    return (diff / pace).ceil().clamp(2, 52);
  }

  String get targetDateFormatted {
    final target = DateTime.now().add(Duration(days: estimatedWeeks * 7));
    return DateFormat('MMM d').format(target);
  }

  String get healthyRangeText {
    final hMeters = heightCm.value / 100.0;
    final minKg = (18.5 * hMeters * hMeters).round();
    final maxKg = (24.9 * hMeters * hMeters).round();
    return '$minKg–$maxKg kg';
  }

  // ─── 01d · Health Screening ───
  static const List<String> healthConditionLabels = [
    'Heart condition or chest pain during effort',
    'Uncontrolled high blood pressure',
    'Kidney disease',
    'Recent surgery or injury',
    'Diabetes',
    'Pregnant or breastfeeding',
    'Eating disorder, current or past',
    'Ongoing medical treatment',
  ];

  final RxList<bool> healthFlags =
      List<bool>.filled(healthConditionLabels.length, false).obs;
  final RxBool healthConsent = true.obs;

  // ─── 02a / 02 / 02b · Injuries & Sensitive Areas ───
  final RxBool hasInjuriesToReport = true.obs;

  static const List<String> injuryZones = [
    'Neck',
    'Shoulders',
    'Chest',
    'Back',
    'Elbows',
    'Wrists & Hands',
    'Abdomen',
    'Hips & Glutes',
    'Thighs & Calves',
    'Knees',
    'Ankles & Feet',
    'Pregnancy / Postpartum',
    'Surgery or fracture',
    'Other',
  ];

  static const List<String> injuryConditions = [
    'Carpal Tunnel',
    'Tendinitis',
    'Sprain',
    'Arthritis',
    'Post-surgery',
    'Other',
  ];

  final RxMap<String, InjuryDetail> selectedInjuries = <String, InjuryDetail>{
    'Wrists & Hands': const InjuryDetail(
      zone: 'Wrists & Hands',
      viewLabel: 'Front view · Both sides',
      condition: 'Carpal Tunnel',
      severity: InjurySeverity.moderate,
    ),
  }.obs;

  // Draft state for 02b Injury Detail Sheet
  final RxString activeInjuryZone = 'Wrists & Hands'.obs;
  final RxString activeInjuryViewLabel = 'Front view · Both sides'.obs;
  final RxString draftCondition = 'Carpal Tunnel'.obs;
  final Rx<InjurySeverity> draftSeverity = InjurySeverity.moderate.obs;
  final injuryNotesController = TextEditingController();

  // ─── 03 · Environment & Equipment ───
  final Rx<TrainingEnvironmentOption> trainingEnvironment =
      TrainingEnvironmentOption.home.obs;

  static const List<String> equipmentOptions = [
    'Bodyweight Only',
    'Dumbbells',
    'Kettlebells',
    'Resistance Bands',
    'Pull-up Bar',
    'Bench',
  ];

  final RxSet<String> selectedEquipment = <String>{
    'Dumbbells',
    'Resistance Bands',
    'Bench',
  }.obs;

  // ─── 03b · Schedule & Availability ───
  final RxInt sessionsPerWeek = 3.obs;
  static const List<String> weekDayLetters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  static const List<String> weekDayNames = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  final RxSet<int> selectedDayIndices = <int>{0, 2, 4}.obs;
  final RxInt sessionLengthMinutes = 30.obs;
  final Rx<PreferredTimeOption> preferredTime =
      PreferredTimeOption.morning.obs;

  // ─── 04a · Food Preferences ───
  final foodSearchController = TextEditingController();
  final RxString foodSearchQuery = ''.obs;

  final RxMap<String, FoodPreferenceState> foodPreferences =
      <String, FoodPreferenceState>{
        'Chicken': FoodPreferenceState.love,
        'Salmon': FoodPreferenceState.love,
        'Avocado': FoodPreferenceState.love,
        'Pasta': FoodPreferenceState.love,
        'Greek yogurt': FoodPreferenceState.love,
        'Berries': FoodPreferenceState.love,
        'Mushrooms': FoodPreferenceState.dislike,
        'Tuna': FoodPreferenceState.dislike,
        'Coriander': FoodPreferenceState.dislike,
        'Eggs': FoodPreferenceState.neutral,
        'Tofu': FoodPreferenceState.neutral,
        'Lentils': FoodPreferenceState.neutral,
        'Quinoa': FoodPreferenceState.neutral,
        'Broccoli': FoodPreferenceState.neutral,
        'Sweet potato': FoodPreferenceState.neutral,
        'Beef': FoodPreferenceState.neutral,
        'Shrimp': FoodPreferenceState.neutral,
        'Oats': FoodPreferenceState.neutral,
        'Chickpeas': FoodPreferenceState.neutral,
        'Spinach': FoodPreferenceState.neutral,
        'Cottage cheese': FoodPreferenceState.neutral,
      }.obs;

  // ─── 04 · Nutrition & Budget ───
  static const List<String> dietaryOptions = [
    'Classic',
    'Flexitarian',
    'Vegetarian',
    'Vegan',
    'Halal',
    'Gluten-Free',
    'Lactose-Free',
  ];
  final RxSet<String> selectedDiets = <String>{
    'Flexitarian',
    'Lactose-Free',
  }.obs;
  final RxInt mealsPerWeek = 14.obs;
  final RxInt weeklyBudgetEur = 50.obs;

  double get costPerMealEur => weeklyBudgetEur.value / mealsPerWeek.value;

  // ─── 04b · Generating Plan ───
  final RxDouble generationProgress = 0.72.obs;
  Timer? _generationTimer;

  // ─── 04d · Notifications & Apple Health ───
  final Rx<MotivationFrequency> motivationFrequency =
      MotivationFrequency.threePerWeek.obs;
  final RxBool appleHealthConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(() {
      final trimmed = nameController.text.trim();
      firstName.value = trimmed.isEmpty ? 'Friend' : trimmed;
    });
    foodSearchController.addListener(() {
      foodSearchQuery.value = foodSearchController.text.trim().toLowerCase();
    });
  }

  // ─── Actions ───
  void toggleHealthFlag(int index) {
    healthFlags[index] = !healthFlags[index];
  }

  void prepareInjurySheet(String zone, {String viewLabel = 'Front view · Both sides'}) {
    activeInjuryZone.value = zone;
    activeInjuryViewLabel.value = viewLabel;
    final existing = selectedInjuries[zone];
    draftCondition.value = existing?.condition ?? injuryConditions.first;
    draftSeverity.value = existing?.severity ?? InjurySeverity.moderate;
    injuryNotesController.text = existing?.notes ?? '';
  }

  void saveActiveInjury() {
    final zone = activeInjuryZone.value;
    selectedInjuries[zone] = InjuryDetail(
      zone: zone,
      viewLabel: activeInjuryViewLabel.value,
      condition: draftCondition.value,
      severity: draftSeverity.value,
      notes: injuryNotesController.text.trim(),
    );
  }

  void removeInjury(String zone) {
    selectedInjuries.remove(zone);
  }

  void toggleEquipment(String item) {
    if (item == 'Bodyweight Only') {
      selectedEquipment
        ..clear()
        ..add('Bodyweight Only');
      return;
    }
    selectedEquipment.remove('Bodyweight Only');
    if (selectedEquipment.contains(item)) {
      selectedEquipment.remove(item);
    } else {
      selectedEquipment.add(item);
    }
  }

  void selectSessionsPerWeek(int count) {
    sessionsPerWeek.value = count;
    // Suggest evenly spaced days
    final presets = <int, Set<int>>{
      2: {0, 3},
      3: {0, 2, 4},
      4: {0, 2, 4, 5},
      5: {0, 1, 2, 4, 5},
      6: {0, 1, 2, 3, 4, 5},
    };
    selectedDayIndices
      ..clear()
      ..addAll(presets[count] ?? {0, 2, 4});
  }

  void toggleDay(int index) {
    if (selectedDayIndices.contains(index)) {
      if (selectedDayIndices.length > 1) {
        selectedDayIndices.remove(index);
      }
    } else {
      selectedDayIndices.add(index);
    }
  }

  void cycleFoodPreference(String food) {
    final current = foodPreferences[food] ?? FoodPreferenceState.neutral;
    switch (current) {
      case FoodPreferenceState.neutral:
        foodPreferences[food] = FoodPreferenceState.love;
      case FoodPreferenceState.love:
        foodPreferences[food] = FoodPreferenceState.dislike;
      case FoodPreferenceState.dislike:
        foodPreferences[food] = FoodPreferenceState.neutral;
    }
  }

  void toggleDiet(String diet) {
    if (selectedDiets.contains(diet)) {
      if (selectedDiets.length > 1) {
        selectedDiets.remove(diet);
      }
    } else {
      selectedDiets.add(diet);
    }
  }

  void adjustBudget(int delta) {
    weeklyBudgetEur.value = (weeklyBudgetEur.value + delta).clamp(20, 150);
  }

  void startPlanGeneration() {
    _generationTimer?.cancel();
    generationProgress.value = 0.12;
    _generationTimer = Timer.periodic(const Duration(milliseconds: 90), (t) {
      final next = generationProgress.value + 0.03;
      if (next >= 1.0) {
        generationProgress.value = 1.0;
        t.cancel();
        Future<void>.delayed(const Duration(milliseconds: 450), () {
          if (Get.currentRoute == AppRoute.onboardingGeneratingPlanScreen) {
            Get.offNamed(AppRoute.onboardingPlanReadyScreen);
          }
        });
      } else {
        generationProgress.value = next;
      }
    });
  }

  void stopPlanGeneration() {
    _generationTimer?.cancel();
  }

  // ─── Derived display helpers ───
  String get goalLabel {
    switch (primaryGoal.value) {
      case PrimaryGoalOption.loseWeight:
        return 'Lose Weight';
      case PrimaryGoalOption.buildMuscle:
        return 'Build Muscle';
      case PrimaryGoalOption.stayFit:
        return 'Stay Fit';
    }
  }

  String get environmentLabel {
    switch (trainingEnvironment.value) {
      case TrainingEnvironmentOption.gym:
        return 'Gym';
      case TrainingEnvironmentOption.home:
        return 'Home';
      case TrainingEnvironmentOption.hybrid:
        return 'Hybrid';
    }
  }

  String get reminderTimeLabel {
    switch (preferredTime.value) {
      case PreferredTimeOption.morning:
        return '7:00 AM';
      case PreferredTimeOption.lunchBreak:
        return '12:15 PM';
      case PreferredTimeOption.evening:
        return '6:30 PM';
    }
  }

  String get selectedDaysSummary {
    final sorted = selectedDayIndices.toList()..sort();
    return sorted.map((i) => weekDayNames[i]).join(', ');
  }

  String get scheduleBannerSummary {
    final count = selectedDayIndices.length;
    final totalMin = count * sessionLengthMinutes.value;
    final hrs = totalMin ~/ 60;
    final mins = totalMin % 60;
    final durStr = hrs > 0
        ? (mins > 0 ? '${hrs}h ${mins.toString().padLeft(2, '0')}' : '${hrs}h')
        : '$mins min';
    return '$count × ${sessionLengthMinutes.value} min = $durStr / week · $selectedDaysSummary · Reminders at $reminderTimeLabel';
  }

  List<WeekDayPlan> get weekOnePlan {
    final dur = '${sessionLengthMinutes.value} min';
    final workouts = [
      'Full Body A',
      'Full Body B',
      'Lower + Core',
      'Cardio circuit',
      'Upper Body',
      'Mobility & Core',
    ];
    int workoutIdx = 0;
    return List.generate(7, (i) {
      final day = weekDayNames[i];
      if (selectedDayIndices.contains(i)) {
        final title = workouts[workoutIdx % workouts.length];
        workoutIdx++;
        return WeekDayPlan(
          dayShort: day,
          title: title,
          durationLabel: dur,
          type: DayPlanType.workout,
        );
      }
      if (i == 3) {
        return WeekDayPlan(
          dayShort: day,
          title: 'Active walk',
          durationLabel: '30 min',
          type: DayPlanType.activeRecovery,
        );
      }
      return WeekDayPlan(
        dayShort: day,
        title: 'Rest',
        durationLabel: '—',
        type: DayPlanType.rest,
      );
    });
  }

  // ─── Navigation helpers ───
  void goToTargetWeight() => Get.toNamed(AppRoute.onboardingTargetWeightScreen);
  void goToWithMilon() => Get.toNamed(AppRoute.onboardingWithMilonScreen);
  void goToHealthScreening() =>
      Get.toNamed(AppRoute.onboardingHealthScreeningScreen);
  void goToAnythingToReport() =>
      Get.toNamed(AppRoute.onboardingAnythingToReportScreen);

  void continueFromAnythingToReport() {
    if (hasInjuriesToReport.value) {
      Get.toNamed(AppRoute.onboardingInjuryBodyMapScreen);
    } else {
      Get.toNamed(AppRoute.onboardingEnvironmentScreen);
    }
  }

  void goToEnvironment() => Get.toNamed(AppRoute.onboardingEnvironmentScreen);
  void goToSchedule() => Get.toNamed(AppRoute.onboardingScheduleScreen);
  void goToFoodPreferences() =>
      Get.toNamed(AppRoute.onboardingFoodPreferencesScreen);
  void goToNutritionBudget() =>
      Get.toNamed(AppRoute.onboardingNutritionBudgetScreen);

  void goToGeneratingPlan() {
    Get.toNamed(AppRoute.onboardingGeneratingPlanScreen);
    startPlanGeneration();
  }

  void goToPlanReady() => Get.offNamed(AppRoute.onboardingPlanReadyScreen);
  void goToNotifications() =>
      Get.toNamed(AppRoute.onboardingNotificationsScreen);

  void finishOnboarding() {
    Get.offAllNamed(AppRoute.bottomNavScreen);
  }

  @override
  void onClose() {
    _generationTimer?.cancel();
    nameController.dispose();
    injuryNotesController.dispose();
    foodSearchController.dispose();
    super.onClose();
  }
}
