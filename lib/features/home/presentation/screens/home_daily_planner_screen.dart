import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/home/domain/entities/home_models.dart';
import 'package:flutter_tamplate/features/home/presentation/controllers/home_controller.dart';

/// Figma "05 · Home — Daily Planner".
class HomeDailyPlannerScreen extends GetView<HomeController> {
  const HomeDailyPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 128.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Avatar + Greeting + Notification bell
                    Row(
                      children: [
                        GestureDetector(
                          onTap: controller.openFreePlanPreview,
                          child: Container(
                            width: 44.r,
                            height: 44.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.peach,
                            ),
                            child: Center(
                              child: Obx(
                                () => Text(
                                  controller.userName.value.isNotEmpty
                                      ? controller.userName.value[0]
                                            .toUpperCase()
                                      : 'S',
                                  style: text.boldTextStyle(
                                    fontSize: 18,
                                    lineHeight: 22,
                                    color: AppColors.cta,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap.h(12),
                        Expanded(
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.todayDateLabel.value,
                                  style: text.regularTextStyle(
                                    fontSize: 13,
                                    lineHeight: 16,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Gap(2),
                                Text(
                                  'Hello, ${controller.userName.value}',
                                  style: text.boldTextStyle(
                                    fontSize: 22,
                                    lineHeight: 26,
                                    letterSpacing: -0.4,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Material(
                          color: AppColors.pearl,
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: controller.openFreePlanPreview,
                            child: SizedBox.square(
                              dimension: 42.r,
                              child: Center(
                                child: SvgPicture.asset(
                                  IconPath.hwBell,
                                  width: 20.r,
                                  height: 20.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(18),
                    // Month + Streak pill
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            controller.monthLabel.value,
                            style: text.semiBoldTextStyle(
                              fontSize: 15,
                              lineHeight: 20,
                              color: AppColors.ink,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lime,
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                IconPath.hwFlame,
                                width: 14.r,
                                height: 14.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.ink,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Gap.h(5),
                              Obx(
                                () => Text(
                                  '${controller.streakDays.value}-day streak',
                                  style: text.boldTextStyle(
                                    fontSize: 12,
                                    lineHeight: 15,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(14),
                    // 7-day calendar strip
                    Obx(() {
                      final active = controller.selectedDayIndex.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          controller.weekDays.length,
                          (i) {
                            final day = controller.weekDays[i];
                            final selected = i == active;
                            final dotColor = selected
                                ? AppColors.coral
                                : (day.status == DayStatusDot.completed
                                      ? AppColors.emerald
                                      : AppColors.line);

                            return GestureDetector(
                              onTap: () => controller.selectDay(i),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 160),
                                width: 46.w,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: selected
                                      ? AppColors.ink
                                      : AppColors.pearl,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      day.weekday,
                                      style: text.mediumTextStyle(
                                        fontSize: 11.5,
                                        lineHeight: 14,
                                        color: selected
                                            ? AppColors.white.withValues(
                                                alpha: 0.72,
                                              )
                                            : AppColors.muted,
                                      ),
                                    ),
                                    Gap(6),
                                    Text(
                                      '${day.dayNumber}',
                                      style: text.boldTextStyle(
                                        fontSize: 16,
                                        lineHeight: 20,
                                        color: selected
                                            ? AppColors.white
                                            : AppColors.ink,
                                      ),
                                    ),
                                    Gap(6),
                                    Container(
                                      width: 6.r,
                                      height: 6.r,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: dotColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    Gap(16),
                    // Generate My Personalized Plan coral banner button
                    Material(
                      color: AppColors.cta,
                      borderRadius: BorderRadius.circular(16.r),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: controller.openPersonalizedPlan,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                IconPath.hwSpark,
                                width: 18.r,
                                height: 18.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Gap.h(8),
                              Text(
                                'Generate My Personalized Plan',
                                style: text.boldTextStyle(
                                  fontSize: 14.5,
                                  lineHeight: 18,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(16),
                    // Side-by-side Today's Workout & Today's Nutrition cards
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _TodayWorkoutCard(
                            onStart: controller.openWorkoutTab,
                          ),
                        ),
                        Gap.h(12),
                        Expanded(
                          child: Obx(
                            () => _TodayNutritionCard(
                              kcal: controller.targetKcal,
                              targetProtein: controller.targetProtein,
                              loggedProtein: controller.loggedProtein,
                              plannedCount: controller.plannedCount,
                              onViewPlan: controller.openNutritionTab,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(24),
                    // Today's meals header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's meals",
                          style: text.boldTextStyle(
                            fontSize: 18,
                            lineHeight: 22,
                            color: AppColors.ink,
                          ),
                        ),
                        Obx(
                          () => Text(
                            '${controller.loggedPlannedCount} / ${controller.plannedCount} planned logged',
                            style: text.regularTextStyle(
                              fontSize: 12.5,
                              lineHeight: 16,
                              color: AppColors.muted,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(12),
                    // Meals bordered card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.line),
                      ),
                      child: Obx(
                        () => Column(
                          children: List.generate(
                            controller.meals.length,
                            (i) {
                              final meal = controller.meals[i];
                              final isLast = i == controller.meals.length - 1;
                              return _MealRow(
                                meal: meal,
                                showDivider: !isLast,
                                onToggle: () => controller.toggleMealLogged(i),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Floating coral "+" quick-log FAB above navbar
              Positioned(
                right: 20.w,
                bottom: 92.h,
                child: Material(
                  color: AppColors.cta,
                  shape: const CircleBorder(),
                  elevation: 6,
                  shadowColor: AppColors.cta.withValues(alpha: 0.35),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: controller.openWorkoutTab,
                    child: SizedBox.square(
                      dimension: 54.r,
                      child: Center(
                        child: SvgPicture.asset(
                          IconPath.hwPlus,
                          width: 22.r,
                          height: 22.r,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodayWorkoutCard extends StatelessWidget {
  const _TodayWorkoutCard({required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.peach,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: AppColors.coral,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.hwDumbbell,
                    width: 20.r,
                    height: 20.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Text(
                'NEW',
                style: text.boldTextStyle(
                  fontSize: 11,
                  lineHeight: 14,
                  letterSpacing: 0.6,
                  color: AppColors.cta,
                ),
              ),
            ],
          ),
          Gap(12),
          Text(
            "TODAY'S WORKOUT",
            style: text.boldTextStyle(
              fontSize: 10.5,
              lineHeight: 14,
              letterSpacing: 0.6,
              color: AppColors.cta,
            ),
          ),
          Gap(4),
          Text(
            'Full Body',
            style: text.boldTextStyle(
              fontSize: 20,
              lineHeight: 24,
              color: AppColors.ink,
            ),
          ),
          Gap(3),
          Text(
            '45 min · Home',
            style: text.regularTextStyle(
              fontSize: 12.5,
              lineHeight: 16,
              color: AppColors.muted,
            ),
          ),
          Gap(10),
          Row(
            children: [
              SvgPicture.asset(
                IconPath.hwFlame,
                width: 14.r,
                height: 14.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.cta,
                  BlendMode.srcIn,
                ),
              ),
              Gap.h(4),
              Expanded(
                child: Text(
                  '~320 kcal · 6 moves',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.mediumTextStyle(
                    fontSize: 11.5,
                    lineHeight: 15,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          Gap(14),
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: Material(
              color: AppColors.ink,
              borderRadius: BorderRadius.circular(14.r),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onStart,
                child: Center(
                  child: Text(
                    'Start',
                    style: text.boldTextStyle(
                      fontSize: 14,
                      lineHeight: 18,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayNutritionCard extends StatelessWidget {
  const _TodayNutritionCard({
    required this.kcal,
    required this.targetProtein,
    required this.loggedProtein,
    required this.plannedCount,
    required this.onViewPlan,
  });

  final int kcal;
  final int targetProtein;
  final int loggedProtein;
  final int plannedCount;
  final VoidCallback onViewPlan;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final progress = (loggedProtein / targetProtein).clamp(0.03, 1.0);

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.limeSoft,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: AppColors.lime,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.hwFood,
                    width: 20.r,
                    height: 20.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.ink,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Text(
                '$plannedCount PLANNED',
                style: text.boldTextStyle(
                  fontSize: 10.5,
                  lineHeight: 14,
                  letterSpacing: 0.5,
                  color: AppColors.emerald,
                ),
              ),
            ],
          ),
          Gap(12),
          Text(
            "TODAY'S NUTRITION",
            style: text.boldTextStyle(
              fontSize: 10.5,
              lineHeight: 14,
              letterSpacing: 0.6,
              color: AppColors.emerald,
            ),
          ),
          Gap(4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '1,485',
                style: text.boldTextStyle(
                  fontSize: 20,
                  lineHeight: 24,
                  color: AppColors.ink,
                ),
              ),
              Gap.h(4),
              Text(
                'kcal',
                style: text.regularTextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
          Gap(3),
          Text(
            '${targetProtein}g Protein',
            style: text.regularTextStyle(
              fontSize: 12.5,
              lineHeight: 16,
              color: AppColors.muted,
            ),
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Protein',
                style: text.regularTextStyle(
                  fontSize: 11.5,
                  color: AppColors.muted,
                ),
              ),
              Text(
                '$loggedProtein / ${targetProtein}g',
                style: text.boldTextStyle(
                  fontSize: 11.5,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          Gap(5),
          ClipRRect(
            borderRadius: BorderRadius.circular(99.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5.h,
              backgroundColor: AppColors.white,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.coral),
            ),
          ),
          Gap(12),
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: Material(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onViewPlan,
                child: Center(
                  child: Text(
                    'View Plan',
                    style: text.boldTextStyle(
                      fontSize: 14,
                      lineHeight: 18,
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MealRow extends StatelessWidget {
  const _MealRow({
    required this.meal,
    required this.showDivider,
    required this.onToggle,
  });

  final HomeMealItem meal;
  final bool showDivider;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onToggle,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: Row(
              children: [
                Container(
                  width: 24.r,
                  height: 24.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: meal.logged ? AppColors.emerald : AppColors.white,
                    border: Border.all(
                      color: meal.logged ? AppColors.emerald : AppColors.line,
                      width: 1.5,
                    ),
                  ),
                  child: meal.logged
                      ? Center(
                          child: SvgPicture.asset(
                            IconPath.hwCheck,
                            width: 13.r,
                            height: 13.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        )
                      : null,
                ),
                Gap.h(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.tag,
                        style: text.boldTextStyle(
                          fontSize: 10.5,
                          lineHeight: 14,
                          letterSpacing: 0.5,
                          color: AppColors.subtle,
                        ),
                      ),
                      Gap(2),
                      Text(
                        meal.title,
                        style: text.semiBoldTextStyle(
                          fontSize: 14.5,
                          lineHeight: 19,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(3),
                      Row(
                        children: [
                          SvgPicture.asset(
                            IconPath.hwClock,
                            width: 12.r,
                            height: 12.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.muted,
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap.h(4),
                          Text(
                            meal.prepLabel,
                            style: text.regularTextStyle(
                              fontSize: 12,
                              lineHeight: 15,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap.h(8),
                Text(
                  '${meal.kcal} kcal',
                  style: text.semiBoldTextStyle(
                    fontSize: 13.5,
                    lineHeight: 18,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
          if (showDivider)
            Divider(
              height: 1,
              indent: 14.w,
              endIndent: 14.w,
              color: AppColors.line,
            ),
        ],
      ),
    );
  }
}
