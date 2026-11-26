import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  /// Short target date ("Nov 26" / "26 nov."), localized at call time.
  String get targetDateFormatted {
    final target = DateTime.now().add(Duration(days: estimatedWeeks * 7));
    return 'onboarding.common.date_short'.trParams({
      'month': _monthKeys[target.month - 1].tr,
      'day': '${target.day}',
    });
  }

  static const List<String> _monthKeys = [
    'onboarding.month.jan',
    'onboarding.month.feb',
    'onboarding.month.mar',
    'onboarding.month.apr',
    'onboarding.month.may',
    'onboarding.month.jun',
    'onboarding.month.jul',
    'onboarding.month.aug',
    'onboarding.month.sep',
    'onboarding.month.oct',
    'onboarding.month.nov',
    'onboarding.month.dec',
  ];

  /// Signed weekly pace ("−0.4" / "−0,4"), localized at call time.
  String get weeklyPaceLabel {
    final pace = weeklyPaceKg;
    return '${pace < 0 ? '−' : '+'}${formatDecimal(pace.abs(), 1)}';
  }

  String get healthyRangeText {
    final hMeters = heightCm.value / 100.0;
    final minKg = (18.5 * hMeters * hMeters).round();
    final maxKg = (24.9 * hMeters * hMeters).round();
    return '$minKg–$maxKg kg';
  }

  // ─── 01d · Health Screening ───
  /// Translation keys; call `.tr` where they are shown.
  static const List<String> healthConditionKeys = [
    'onboarding.health.condition_heart',
    'onboarding.health.condition_blood_pressure',
    'onboarding.health.condition_kidney',
    'onboarding.health.condition_surgery',
    'onboarding.health.condition_diabetes',
    'onboarding.health.condition_pregnant',
    'onboarding.health.condition_eating_disorder',
    'onboarding.health.condition_treatment',
  ];

  final RxList<bool> healthFlags = List<bool>.filled(
    healthConditionKeys.length,
    false,
  ).obs;
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

  /// Translation keys; call `.tr` where they are shown.
  static const List<String> weekDayLetterKeys = [
    'onboarding.day_letter.mon',
    'onboarding.day_letter.tue',
    'onboarding.day_letter.wed',
    'onboarding.day_letter.thu',
    'onboarding.day_letter.fri',
    'onboarding.day_letter.sat',
    'onboarding.day_letter.sun',
  ];
  static const List<String> weekDayNameKeys = [
    'onboarding.day.mon',
    'onboarding.day.tue',
    'onboarding.day.wed',
    'onboarding.day.thu',
    'onboarding.day.fri',
    'onboarding.day.sat',
    'onboarding.day.sun',
  ];
  final RxSet<int> selectedDayIndices = <int>{0, 2, 4}.obs;
  final RxInt sessionLengthMinutes = 30.obs;
  final Rx<PreferredTimeOption> preferredTime = PreferredTimeOption.morning.obs;

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
      firstName.value = nameController.text.trim();
    });
    foodSearchController.addListener(() {
      foodSearchQuery.value = foodSearchController.text.trim().toLowerCase();
    });
  }

  // ─── Actions ───
  void toggleHealthFlag(int index) {
    healthFlags[index] = !healthFlags[index];
  }

  void prepareInjurySheet(
    String zone, {
    String viewLabel = 'Front view · Both sides',
  }) {
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
  // These getters run at build time, so `.tr` always uses the current locale.

  /// First name for display; falls back to a friendly placeholder when empty.
  String get displayName =>
      firstName.value.isEmpty ? 'onboarding.common.friend'.tr : firstName.value;

  String get goalLabel {
    switch (primaryGoal.value) {
      case PrimaryGoalOption.loseWeight:
        return 'onboarding.goal.lose_weight'.tr;
      case PrimaryGoalOption.buildMuscle:
        return 'onboarding.goal.build_muscle'.tr;
      case PrimaryGoalOption.stayFit:
        return 'onboarding.goal.stay_fit'.tr;
    }
  }

  String get environmentLabel {
    switch (trainingEnvironment.value) {
      case TrainingEnvironmentOption.gym:
        return 'onboarding.env.gym'.tr;
      case TrainingEnvironmentOption.home:
        return 'onboarding.env.home'.tr;
      case TrainingEnvironmentOption.hybrid:
        return 'onboarding.env.hybrid'.tr;
    }
  }

  /// Where the session happens, phrased for the notification preview.
  String get environmentPlaceLabel {
    switch (trainingEnvironment.value) {
      case TrainingEnvironmentOption.gym:
        return 'onboarding.notifications.place_gym'.tr;
      case TrainingEnvironmentOption.home:
        return 'onboarding.notifications.place_home'.tr;
      case TrainingEnvironmentOption.hybrid:
        return 'onboarding.notifications.place_hybrid'.tr;
    }
  }

  String get reminderTimeLabel {
    switch (preferredTime.value) {
      case PreferredTimeOption.morning:
        return 'onboarding.time.morning_reminder'.tr;
      case PreferredTimeOption.lunchBreak:
        return 'onboarding.time.lunch_reminder'.tr;
      case PreferredTimeOption.evening:
        return 'onboarding.time.evening_reminder'.tr;
    }
  }

  String get selectedDaysSummary {
    final sorted = selectedDayIndices.toList()..sort();
    return sorted.map((i) => weekDayNameKeys[i].tr).join(', ');
  }

  String get scheduleBannerSummary {
    final count = selectedDayIndices.length;
    final totalMin = count * sessionLengthMinutes.value;
    final hrs = totalMin ~/ 60;
    final mins = totalMin % 60;
    final durStr = hrs > 0
        ? (mins > 0 ? '${hrs}h ${mins.toString().padLeft(2, '0')}' : '${hrs}h')
        : '$mins min';
    return 'onboarding.schedule.banner'.trParams({
      'count': '$count',
      'length': '${sessionLengthMinutes.value}',
      'duration': durStr,
      'days': selectedDaysSummary,
      'time': reminderTimeLabel,
    });
  }

  List<WeekDayPlan> get weekOnePlan {
    final dur = '${sessionLengthMinutes.value} min';
    const workoutKeys = [
      'onboarding.workout.full_body_a',
      'onboarding.workout.full_body_b',
      'onboarding.workout.lower_core',
      'onboarding.workout.cardio_circuit',
      'onboarding.workout.upper_body',
      'onboarding.workout.mobility_core',
    ];
    int workoutIdx = 0;
    return List.generate(7, (i) {
      final day = weekDayNameKeys[i].tr;
      if (selectedDayIndices.contains(i)) {
        final title = workoutKeys[workoutIdx % workoutKeys.length].tr;
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
          title: 'onboarding.workout.active_walk'.tr,
          durationLabel: '30 min',
          type: DayPlanType.activeRecovery,
        );
      }
      return WeekDayPlan(
        dayShort: day,
        title: 'onboarding.workout.rest'.tr,
        durationLabel: '—',
        type: DayPlanType.rest,
      );
    });
  }

  /// Fixed-digit decimal with the current locale's separator ("3.57" / "3,57").
  static String formatDecimal(double value, int digits) => value
      .toStringAsFixed(digits)
      .replaceAll('.', 'onboarding.common.decimal_separator'.tr);

  /// Display label for an option id (zone, view, condition, equipment, diet,
  /// food). Ids stay in English because they are used as identifiers.
  static String optionLabel(String id) {
    final key = _optionLabelKeys[id];
    return key == null ? id : key.tr;
  }

  /// Short zone label for compact tags ("Wrists" for "Wrists & Hands").
  static String zoneShortLabel(String zone) {
    final key = _zoneShortKeys[zone];
    return key == null ? zone.split(' ').first : key.tr;
  }

  static const Map<String, String> _zoneShortKeys = {
    'Neck': 'onboarding.zone_short.neck',
    'Shoulders': 'onboarding.zone_short.shoulders',
    'Chest': 'onboarding.zone_short.chest',
    'Back': 'onboarding.zone_short.back',
    'Elbows': 'onboarding.zone_short.elbows',
    'Wrists & Hands': 'onboarding.zone_short.wrists_hands',
    'Abdomen': 'onboarding.zone_short.abdomen',
    'Hips & Glutes': 'onboarding.zone_short.hips_glutes',
    'Thighs & Calves': 'onboarding.zone_short.thighs_calves',
    'Knees': 'onboarding.zone_short.knees',
    'Ankles & Feet': 'onboarding.zone_short.ankles_feet',
    'Pregnancy / Postpartum': 'onboarding.zone_short.pregnancy',
    'Surgery or fracture': 'onboarding.zone_short.surgery',
    'Other': 'onboarding.common.other',
  };

  static const Map<String, String> _optionLabelKeys = {
    // Shared
    'Other': 'onboarding.common.other',
    // Injury zones
    'Neck': 'onboarding.zone.neck',
    'Shoulders': 'onboarding.zone.shoulders',
    'Chest': 'onboarding.zone.chest',
    'Back': 'onboarding.zone.back',
    'Elbows': 'onboarding.zone.elbows',
    'Wrists & Hands': 'onboarding.zone.wrists_hands',
    'Abdomen': 'onboarding.zone.abdomen',
    'Hips & Glutes': 'onboarding.zone.hips_glutes',
    'Thighs & Calves': 'onboarding.zone.thighs_calves',
    'Knees': 'onboarding.zone.knees',
    'Ankles & Feet': 'onboarding.zone.ankles_feet',
    'Pregnancy / Postpartum': 'onboarding.zone.pregnancy',
    'Surgery or fracture': 'onboarding.zone.surgery',
    // Body map views
    'Front view · Left side': 'onboarding.view.front_left',
    'Front view · Right side': 'onboarding.view.front_right',
    'Front view · Both sides': 'onboarding.view.front_both',
    'Back view · Left side': 'onboarding.view.back_left',
    'Back view · Right side': 'onboarding.view.back_right',
    'Back view · Upper back': 'onboarding.view.back_upper',
    'Back view · Lower back': 'onboarding.view.back_lower',
    'Back view · Both sides': 'onboarding.view.back_both',
    // Injury conditions
    'Carpal Tunnel': 'onboarding.condition.carpal_tunnel',
    'Tendinitis': 'onboarding.condition.tendinitis',
    'Sprain': 'onboarding.condition.sprain',
    'Arthritis': 'onboarding.condition.arthritis',
    'Post-surgery': 'onboarding.condition.post_surgery',
    // Equipment
    'Bodyweight Only': 'onboarding.equipment.bodyweight_only',
    'Dumbbells': 'onboarding.equipment.dumbbells',
    'Kettlebells': 'onboarding.equipment.kettlebells',
    'Resistance Bands': 'onboarding.equipment.resistance_bands',
    'Pull-up Bar': 'onboarding.equipment.pull_up_bar',
    'Bench': 'onboarding.equipment.bench',
    // Diets
    'Classic': 'onboarding.diet.classic',
    'Flexitarian': 'onboarding.diet.flexitarian',
    'Vegetarian': 'onboarding.diet.vegetarian',
    'Vegan': 'onboarding.diet.vegan',
    'Halal': 'onboarding.diet.halal',
    'Gluten-Free': 'onboarding.diet.gluten_free',
    'Lactose-Free': 'onboarding.diet.lactose_free',
    // Foods
    'Chicken': 'onboarding.food.chicken',
    'Salmon': 'onboarding.food.salmon',
    'Avocado': 'onboarding.food.avocado',
    'Pasta': 'onboarding.food.pasta',
    'Greek yogurt': 'onboarding.food.greek_yogurt',
    'Berries': 'onboarding.food.berries',
    'Mushrooms': 'onboarding.food.mushrooms',
    'Tuna': 'onboarding.food.tuna',
    'Coriander': 'onboarding.food.coriander',
    'Eggs': 'onboarding.food.eggs',
    'Tofu': 'onboarding.food.tofu',
    'Lentils': 'onboarding.food.lentils',
    'Quinoa': 'onboarding.food.quinoa',
    'Broccoli': 'onboarding.food.broccoli',
    'Sweet potato': 'onboarding.food.sweet_potato',
    'Beef': 'onboarding.food.beef',
    'Shrimp': 'onboarding.food.shrimp',
    'Oats': 'onboarding.food.oats',
    'Chickpeas': 'onboarding.food.chickpeas',
    'Spinach': 'onboarding.food.spinach',
    'Cottage cheese': 'onboarding.food.cottage_cheese',
  };

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
