import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/coach/presentation/controllers/coach_controller.dart';
import 'package:flutter_tamplate/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Main app shell with the Figma-exact floating pill Bottom Navigation Bar:
/// active tab shows a coral CTA pill with white icon + label, inactive tabs
/// show muted icons only.
class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }
    if (!Get.isRegistered<WorkoutController>()) {
      Get.put(WorkoutController());
    }
    if (!Get.isRegistered<NutritionController>()) {
      Get.put(NutritionController());
    }
    if (!Get.isRegistered<ProgressController>()) {
      Get.put(ProgressController());
    }
    if (!Get.isRegistered<CoachController>()) {
      Get.put(CoachController());
    }
    final controller = Get.isRegistered<BottomNavController>()
        ? Get.find<BottomNavController>()
        : Get.put(BottomNavController());

    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.screens,
        ),
      ),
      bottomNavigationBar: MilonFloatingNavBar(controller: controller),
    );
  }
}

/// Figma floating pill bottom nav bar (shared on Home, Free Plan, Workout).
class MilonFloatingNavBar extends StatelessWidget {
  const MilonFloatingNavBar({super.key, required this.controller});

  final BottomNavController controller;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final bottomInset = math.max(
      MediaQuery.viewPaddingOf(context).bottom,
      14.0,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, bottomInset),
      child: Container(
        height: 64.h,
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: AppColors.pearl,
          borderRadius: BorderRadius.circular(999.r),
          border: Border.all(color: AppColors.line),
          boxShadow: [
            BoxShadow(
              color: AppColors.ink.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Obx(() {
          final active = controller.currentIndex.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.items.length, (i) {
              final item = controller.items[i];
              final isSelected = i == active;

              return GestureDetector(
                onTap: () => controller.changeIndex(i),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isSelected ? 14.w : 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.cta : AppColors.transparent,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        item.iconPath,
                        width: 20.r,
                        height: 20.r,
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppColors.white : AppColors.muted,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (isSelected) ...[
                        Gap.h(6),
                        Text(
                          item.title,
                          style: text.boldTextStyle(
                            fontSize: 13,
                            lineHeight: 16,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
