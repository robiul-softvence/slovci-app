import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/coach/presentation/screens/milon_coach_chat_screen.dart';
import 'package:flutter_tamplate/features/home/presentation/screens/home_daily_planner_screen.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_daily_dashboard_screen.dart';
import 'package:flutter_tamplate/features/progress/presentation/screens/progress_dashboard_screen.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_session_overview_screen.dart';

class MilonNavItem {
  const MilonNavItem({required this.titleKey, required this.iconPath});

  /// Translation key; resolve with `.tr` at build time.
  final String titleKey;
  final String iconPath;
}

/// Manages the 5-tab MILON floating pill bottom navigation bar.
class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<MilonNavItem> items = const [
    MilonNavItem(titleKey: 'common.bottom_nav.home', iconPath: IconPath.hwHome),
    MilonNavItem(
      titleKey: 'common.bottom_nav.workout',
      iconPath: IconPath.hwDumbbell,
    ),
    MilonNavItem(
      titleKey: 'common.bottom_nav.nutrition',
      iconPath: IconPath.hwFood,
    ),
    MilonNavItem(
      titleKey: 'common.bottom_nav.progress',
      iconPath: IconPath.hwChart,
    ),
    MilonNavItem(
      titleKey: 'common.bottom_nav.coach',
      iconPath: IconPath.hwSpark,
    ),
  ];

  final List<Widget> screens = const [
    HomeDailyPlannerScreen(),
    WorkoutSessionOverviewScreen(),
    NutritionDailyDashboardScreen(),
    ProgressDashboardScreen(),
    MilonCoachChatScreen(),
  ];

  void changeIndex(int index) {
    if (index < 0 || index >= items.length) return;
    currentIndex.value = index;
  }

  void goToWorkout() => changeIndex(1);
  void goToNutrition() => changeIndex(2);
  void goToProgress() => changeIndex(3);
  void goToCoach() => changeIndex(4);
  void goToHome() => changeIndex(0);
}
