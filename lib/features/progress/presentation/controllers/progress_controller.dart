import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class ProgressController extends GetxController {
  // ─── 16 · Progress Main ───
  // Translation keys; translated with `.tr` at display time.
  static const List<String> periodTabs = [
    'progress_coach.dashboard.period_week',
    'progress_coach.dashboard.period_month',
    'progress_coach.dashboard.period_year',
  ];
  final RxInt selectedPeriod = 1.obs; // Month

  // Hydration: 0..8 glasses (250 ml each = 2.0 L)
  final RxInt waterGlasses = 0.obs;
  static const int maxWaterGlasses = 8;

  double get waterLiters => waterGlasses.value * 0.25;

  // 12-week × 7-day consistency intensity grid (0..4)
  final List<List<int>> heatmapMatrix = const [
    [0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0],
    [2, 0, 3, 0, 1, 3, 2, 1, 3, 2, 1, 2],
    [3, 3, 2, 1, 3, 2, 1, 3, 2, 1, 3, 3],
    [0, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 2, 1, 3, 2, 4, 4, 2, 0],
    [4, 4, 4, 0, 4, 4, 4, 4, 1, 2, 4, 0],
    [0, 2, 3, 4, 1, 3, 2, 1, 3, 2, 1, 0],
  ];

  // ─── 16b · Body & Weight ───
  // Translation keys; translated with `.tr` at display time.
  static const List<String> weightRanges = [
    'progress_coach.body_weight.range_1w',
    'progress_coach.body_weight.range_1m',
    'progress_coach.body_weight.range_3m',
  ];
  final RxInt selectedWeightRange = 0.obs; // 1W
  final RxDouble currentWeight = 61.6.obs;

  // ─── 17c · Weekly Check-in ───
  final RxInt energyRating = 4.obs;
  final RxInt hungerRating = 4.obs;
  final RxInt sleepRating = 4.obs;
  final RxInt stressRating = 3.obs;
  final RxInt workoutFeelIndex =
      1.obs; // 0: Too easy, 1: Just right, 2: Too hard

  // ─── Actions ───
  void drinkWater() {
    if (waterGlasses.value < maxWaterGlasses) {
      waterGlasses.value++;
    } else {
      waterGlasses.value = 0;
    }
  }

  void setWaterGlass(int count) {
    waterGlasses.value = count.clamp(0, maxWaterGlasses);
  }

  void logTodayWeight() {
    AppHelperFunctions.showSnackBar(
      'progress_coach.body_weight.logged_snackbar'.trParams({
        'weight': currentWeight.value.toStringAsFixed(1),
      }),
    );
  }

  void openBodyWeight() => Get.toNamed(AppRoute.progressBodyWeightScreen);
  void openWeeklyReview() => Get.toNamed(AppRoute.progressWeeklyReviewScreen);
  void openWeeklyCheckin() => Get.toNamed(AppRoute.progressWeeklyCheckinScreen);
  void openWeek2Plan() => Get.toNamed(AppRoute.progressWeek2PlanScreen);

  void acceptWeek2Plan() {
    Get.offAllNamed(AppRoute.bottomNavScreen);
    AppHelperFunctions.showSnackBar(
      'progress_coach.week2_plan.accepted_snackbar'.tr,
    );
  }

  void discussWithCoach() {
    Get.offAllNamed(AppRoute.bottomNavScreen);
    if (Get.isRegistered<BottomNavController>()) {
      Get.find<BottomNavController>().changeIndex(4);
    }
  }
}
