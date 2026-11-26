import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_add_meal_sheet.dart';

/// Figma "12 · Nutrition — Daily Macro Dashboard".
class NutritionDailyDashboardScreen extends GetView<NutritionController> {
  const NutritionDailyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final numFmt = NumberFormat('#,###');

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 114.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Nutrition + Cart icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'nutrition.dashboard.title'.tr,
                      style: text.boldTextStyle(
                        fontSize: 28,
                        lineHeight: 34,
                        letterSpacing: -0.5,
                        color: AppColors.ink,
                      ),
                    ),
                    Material(
                      color: AppColors.pearl,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: controller.openGroceryList,
                        child: SizedBox.square(
                          dimension: 42.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.nutCart,
                              width: 20.r,
                              height: 20.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(14),
                // Date switcher bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DateArrowButton(
                        iconPath: IconPath.chevLeft,
                        onTap: controller.prevDate,
                      ),
                      Obx(
                        () => Text(
                          controller.dateLabels[controller.dateIndex.value].tr,
                          style: text.semiBoldTextStyle(
                            fontSize: 14,
                            lineHeight: 18,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      _DateArrowButton(
                        iconPath: IconPath.hwChevRight,
                        onTap: controller.nextDate,
                      ),
                    ],
                  ),
                ),
                Gap(16),
                // Macro Ring + Bars bordered card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(18.w, 22.h, 18.w, 18.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Obx(() {
                    final eaten = controller.eatenKcal;
                    final remaining = controller.remainingKcal;
                    final burned = controller.burnedKcal.value;
                    final progress = (eaten / NutritionController.targetKcal)
                        .clamp(0.0, 1.0);

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Eaten column
                            Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      IconPath.hwFood,
                                      width: 15.r,
                                      height: 15.r,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.emerald,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Gap.h(4),
                                    Text(
                                      '$eaten',
                                      style: text.boldTextStyle(
                                        fontSize: 18,
                                        color: AppColors.ink,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(2),
                                Text(
                                  'nutrition.dashboard.eaten'.tr,
                                  style: text.regularTextStyle(
                                    fontSize: 12,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                            // Center calorie ring
                            SizedBox.square(
                              dimension: 174.r,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomPaint(
                                    size: Size.square(174.r),
                                    painter: _CalorieRingPainter(
                                      progress: progress,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        numFmt.format(remaining),
                                        style: text.boldTextStyle(
                                          fontSize: 38,
                                          lineHeight: 42,
                                          letterSpacing: -1.2,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                      Gap(2),
                                      Text(
                                        'nutrition.dashboard.kcal_remaining'.tr,
                                        style: text.regularTextStyle(
                                          fontSize: 12.5,
                                          color: AppColors.muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Burned column
                            Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      IconPath.hwFlame,
                                      width: 15.r,
                                      height: 15.r,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.cta,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Gap.h(4),
                                    Text(
                                      '$burned',
                                      style: text.boldTextStyle(
                                        fontSize: 18,
                                        color: AppColors.ink,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(2),
                                Text(
                                  'nutrition.dashboard.burned'.tr,
                                  style: text.regularTextStyle(
                                    fontSize: 12,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(22),
                        _MacroProgressBar(
                          label: 'nutrition.common.protein'.tr,
                          current: controller.eatenProtein,
                          target: NutritionController.targetProtein,
                          color: AppColors.coral,
                        ),
                        Gap(14),
                        _MacroProgressBar(
                          label: 'nutrition.common.carbs'.tr,
                          current: controller.eatenCarbs,
                          target: NutritionController.targetCarbs,
                          color: AppColors.carbsBlue,
                        ),
                        Gap(14),
                        _MacroProgressBar(
                          label: 'nutrition.common.fats'.tr,
                          current: controller.eatenFats,
                          target: NutritionController.targetFats,
                          color: AppColors.amber,
                        ),
                      ],
                    );
                  }),
                ),
                Gap(14),
                // ASK MILON COACH lime card
                GestureDetector(
                  onTap: () => NutritionAddMealSheet.show(context),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(14.r),
                    decoration: BoxDecoration(
                      color: AppColors.lime,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 42.r,
                          height: 42.r,
                          decoration: BoxDecoration(
                            color: AppColors.ink,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.hwSpark,
                              width: 20.r,
                              height: 20.r,
                              colorFilter: const ColorFilter.mode(
                                AppColors.lime,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        Gap.h(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'nutrition.dashboard.ask_coach_eyebrow'.tr,
                                style: text.boldTextStyle(
                                  fontSize: 10.5,
                                  letterSpacing: 0.6,
                                  color: AppColors.ink,
                                ),
                              ),
                              Gap(3),
                              Obx(
                                () => Text(
                                  'nutrition.dashboard.ask_coach_prompt'
                                      .trParams({
                                        'kcal': numFmt.format(
                                          controller.remainingKcal,
                                        ),
                                      }),
                                  style: text.boldTextStyle(
                                    fontSize: 14,
                                    lineHeight: 19,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap.h(8),
                        SvgPicture.asset(
                          IconPath.hwChevRight,
                          width: 16.r,
                          height: 16.r,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(22),
                // Today's plan header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'nutrition.dashboard.todays_plan'.tr,
                      style: text.boldTextStyle(
                        fontSize: 18,
                        lineHeight: 22,
                        color: AppColors.ink,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.openMealPlanner(slotIndex: 1),
                      child: Text(
                        'nutrition.dashboard.see_all'.tr,
                        style: text.semiBoldTextStyle(
                          fontSize: 14,
                          color: AppColors.cta,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(12),
                Obx(
                  () => Column(
                    children: List.generate(controller.todayMeals.length, (i) {
                      final meal = controller.todayMeals[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: GestureDetector(
                          onTap: () => controller.openMealPlanner(slotIndex: i),
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14.r),
                                child: Image.asset(
                                  meal.imagePath,
                                  width: 56.r,
                                  height: 56.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Gap.h(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      meal.slotLabel.tr,
                                      style: text.boldTextStyle(
                                        fontSize: 10.5,
                                        letterSpacing: 0.5,
                                        color: AppColors.subtle,
                                      ),
                                    ),
                                    Gap(3),
                                    Text(
                                      meal.title.tr,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: text.semiBoldTextStyle(
                                        fontSize: 15,
                                        lineHeight: 19,
                                        color: AppColors.ink,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap.h(8),
                              Text(
                                '${meal.kcal} kcal',
                                style: text.mediumTextStyle(
                                  fontSize: 13.5,
                                  color: AppColors.muted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DateArrowButton extends StatelessWidget {
  const _DateArrowButton({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 34.r,
          child: Center(
            child: SvgPicture.asset(iconPath, width: 15.r, height: 15.r),
          ),
        ),
      ),
    );
  }
}

class _MacroProgressBar extends StatelessWidget {
  const _MacroProgressBar({
    required this.label,
    required this.current,
    required this.target,
    required this.color,
  });

  final String label;
  final int current;
  final int target;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final ratio = (current / target).clamp(0.02, 1.0);

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 8.r,
              height: 8.r,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
            Gap.h(8),
            Text(
              label,
              style: text.semiBoldTextStyle(fontSize: 14, color: AppColors.ink),
            ),
            const Spacer(),
            Text(
              '$current / $target${'nutrition.common.unit_g'.tr}',
              style: text.mediumTextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ],
        ),
        Gap(7),
        ClipRRect(
          borderRadius: BorderRadius.circular(99.r),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 6.h,
            backgroundColor: AppColors.pearl,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _CalorieRingPainter extends CustomPainter {
  _CalorieRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 8;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.peach
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12,
    );

    if (progress > 0) {
      canvas.drawArc(
        rect,
        -math.pi / 2,
        math.pi * 2 * progress,
        false,
        Paint()
          ..color = AppColors.coral
          ..style = PaintingStyle.stroke
          ..strokeWidth = 12
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CalorieRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
