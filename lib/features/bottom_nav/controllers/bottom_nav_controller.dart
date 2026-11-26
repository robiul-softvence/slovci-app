import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/home/presentation/screens/home_daily_planner_screen.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_daily_dashboard_screen.dart';
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
    MilonNavItem(title: 'Coach', iconPath: IconPath.hwSpark),
  ];

  final List<Widget> screens = const [
    HomeDailyPlannerScreen(),
    WorkoutSessionOverviewScreen(),
    NutritionDailyDashboardScreen(),
    _ComingSoonTab(title: 'Progress', subtitle: 'Weight, streaks & PRs'),
    _ComingSoonTab(title: 'MILON Coach', subtitle: 'Your personal AI coach'),
  ];

  void changeIndex(int index) {
    if (index < 0 || index >= items.length) return;
    currentIndex.value = index;
  }

  void goToWorkout() => changeIndex(1);
  void goToNutrition() => changeIndex(2);
  void goToHome() => changeIndex(0);
}

class _ComingSoonTab extends StatelessWidget {
  const _ComingSoonTab({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: text.boldTextStyle(
                fontSize: 24,
                lineHeight: 30,
                color: AppColors.ink,
              ),
            ),
            Gap(6),
            Text(
              subtitle,
              style: text.regularTextStyle(
                fontSize: 14,
                lineHeight: 20,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
