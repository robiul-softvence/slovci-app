import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/coach/presentation/screens/milon_coach_chat_screen.dart';
import 'package:flutter_tamplate/features/home/presentation/screens/home_daily_planner_screen.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_daily_dashboard_screen.dart';
import 'package:flutter_tamplate/features/progress/presentation/screens/progress_dashboard_screen.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_session_overview_screen.dart';

class MilonNavItem {
  const MilonNavItem({required this.title, required this.iconPath});

  final String title;
  final String iconPath;
}

/// Manages the 5-tab MILON floating pill bottom navigation bar.
class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<MilonNavItem> items = const [
    MilonNavItem(title: 'Home', iconPath: IconPath.hwHome),
    MilonNavItem(title: 'Workout', iconPath: IconPath.hwDumbbell),
    MilonNavItem(title: 'Nutrition', iconPath: IconPath.hwFood),
    MilonNavItem(title: 'Progress', iconPath: IconPath.hwChart),
    MilonNavItem(title: 'MILON Coach', iconPath: IconPath.hwSpark),
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
