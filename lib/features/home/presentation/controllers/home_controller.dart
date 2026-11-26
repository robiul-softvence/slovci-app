import 'package:get/get.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/home/domain/entities/home_models.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class HomeController extends GetxController {
  final RxString userName = 'Solène'.obs;
  // Translation keys — resolved with `.tr` at display time.
  final RxString todayDateLabel = 'home_workout.home.today_date'.obs;
  final RxString monthLabel = 'home_workout.home.month_label'.obs;
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
      tag: 'home_workout.home.meal_tag_breakfast',
      title: 'home_workout.home.meal_title_breakfast',
      prepLabel: 'home_workout.home.meal_prep_breakfast',
      kcal: 380,
      proteinGrams: 26,
      isPlanned: false,
    ),
    const HomeMealItem(
      id: 'lunch',
      tag: 'home_workout.home.meal_tag_lunch',
      title: 'home_workout.home.meal_title_lunch',
      prepLabel: 'home_workout.home.meal_prep_lunch',
      kcal: 423,
      proteinGrams: 42,
      isPlanned: true,
    ),
    const HomeMealItem(
      id: 'snack',
      tag: 'home_workout.home.meal_tag_snack',
      title: 'home_workout.home.meal_title_snack',
      prepLabel: 'home_workout.home.meal_prep_snack',
      kcal: 190,
      proteinGrams: 8,
      isPlanned: false,
    ),
    const HomeMealItem(
      id: 'dinner',
      tag: 'home_workout.home.meal_tag_dinner',
      title: 'home_workout.home.meal_title_dinner',
      prepLabel: 'home_workout.home.meal_prep_dinner',
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

  void openProfile() => Get.toNamed(AppRoute.profileMainScreen);

  void openPersonalizedPlan() =>
      Get.toNamed(AppRoute.onboardingProfileGoalsScreen);
}
