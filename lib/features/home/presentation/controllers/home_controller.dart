import 'package:get/get.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/home/domain/entities/home_models.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class HomeController extends GetxController {
  final RxString userName = 'Solène'.obs;
  final RxString todayDateLabel = 'Wednesday, Nov 18'.obs;
  final RxString monthLabel = 'November 2026'.obs;
  final RxInt streakDays = 5.obs;
  final RxInt selectedDayIndex = 2.obs; // Wed 18

  final List<HomeWeekDay> weekDays = const [
    HomeWeekDay(weekday: 'Mon', dayNumber: 16, status: DayStatusDot.completed),
    HomeWeekDay(weekday: 'Tue', dayNumber: 17, status: DayStatusDot.completed),
    HomeWeekDay(weekday: 'Wed', dayNumber: 18, status: DayStatusDot.active),
    HomeWeekDay(weekday: 'Thu', dayNumber: 19, status: DayStatusDot.upcoming),
    HomeWeekDay(weekday: 'Fri', dayNumber: 20, status: DayStatusDot.upcoming),
    HomeWeekDay(weekday: 'Sat', dayNumber: 21, status: DayStatusDot.upcoming),
    HomeWeekDay(weekday: 'Sun', dayNumber: 22, status: DayStatusDot.upcoming),
  ];

  final RxList<HomeMealItem> meals = <HomeMealItem>[
    const HomeMealItem(
      id: 'breakfast',
      tag: 'BREAKFAST · YOUR CHOICE',
      title: 'Soy Yogurt Power Bowl',
      prepLabel: 'Prep 5 min',
      kcal: 380,
      proteinGrams: 26,
      isPlanned: false,
    ),
    const HomeMealItem(
      id: 'lunch',
      tag: 'LUNCH · PLANNED',
      title: 'Grilled Tofu & Egg Salad',
      prepLabel: 'Prep 10 · Cook 5 min',
      kcal: 423,
      proteinGrams: 42,
      isPlanned: true,
    ),
    const HomeMealItem(
      id: 'snack',
      tag: 'SNACK · YOUR CHOICE',
      title: 'Apple & Almond Butter',
      prepLabel: 'Prep 2 min',
      kcal: 190,
      proteinGrams: 8,
      isPlanned: false,
    ),
    const HomeMealItem(
      id: 'dinner',
      tag: 'DINNER · PLANNED',
      title: 'Chicken Quinoa Stir-fry',
      prepLabel: 'Prep 10 · Cook 15 min',
      kcal: 492,
      proteinGrams: 49,
      isPlanned: true,
    ),
  ].obs;

  int get targetKcal => 1485;
  int get targetProtein => 125;

  int get loggedProtein => meals
      .where((m) => m.logged)
      .fold<int>(0, (sum, m) => sum + m.proteinGrams);

  int get plannedCount => meals.where((m) => m.isPlanned).length;

  int get loggedPlannedCount =>
      meals.where((m) => m.isPlanned && m.logged).length;

  void selectDay(int index) => selectedDayIndex.value = index;

  void toggleMealLogged(int index) {
    final item = meals[index];
    meals[index] = item.copyWith(logged: !item.logged);
  }

  void openWorkoutTab() {
    if (Get.isRegistered<BottomNavController>()) {
      Get.find<BottomNavController>().goToWorkout();
    }
  }

  void openNutritionTab() {
    if (Get.isRegistered<BottomNavController>()) {
      Get.find<BottomNavController>().goToNutrition();
    }
  }

  void openFreePlanPreview() => Get.toNamed(AppRoute.homeFreePlanScreen);

  void openPersonalizedPlan() =>
      Get.toNamed(AppRoute.onboardingProfileGoalsScreen);
}
