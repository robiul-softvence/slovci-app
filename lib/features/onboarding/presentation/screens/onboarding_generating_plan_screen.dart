import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';

/// Figma "04b · Onboarding — Generating Your Plan".
class OnboardingGeneratingPlanScreen extends GetView<OnboardingController> {
  const OnboardingGeneratingPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                const Spacer(),
                // Progress Ring + MILON Mark
                GestureDetector(
                  onTap: controller.goToPlanReady,
                  child: Obx(() {
                    final progress = controller.generationProgress.value;
                    final pct = (progress * 100).round();

                    return Column(
                      children: [
                        SizedBox.square(
                          dimension: 174.r,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomPaint(
                                size: Size.square(174.r),
                                painter: _RingProgressPainter(
                                  progress: progress,
                                ),
                              ),
                              SvgPicture.asset(
                                IconPath.obMilonMark,
                                width: 68.r,
                                height: 45.r,
                              ),
                            ],
                          ),
                        ),
                        Gap(22),
                        Text(
                          '$pct%',
                          style: text.boldTextStyle(
                            fontSize: 22,
                            lineHeight: 26,
                            color: AppColors.cta,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                Gap(10),
                Text(
                  'onboarding.generating.title'.tr,
                  style: text.boldTextStyle(
                    fontSize: 28,
                    lineHeight: 34,
                    letterSpacing: -0.5,
                    color: AppColors.ink,
                  ),
                ),
                Gap(8),
                Text(
                  'onboarding.generating.duration'.tr,
                  style: text.regularTextStyle(
                    fontSize: AppTextStyle.md,
                    lineHeight: 20,
                    color: AppColors.muted,
                  ),
                ),
                Gap(26),
                // Step checklist card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18.r),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Obx(() {
                    final p = controller.generationProgress.value;
                    final diets = controller.selectedDiets
                        .map(OnboardingController.optionLabel)
                        .join(' · ');
                    final injuriesCount = controller.selectedInjuries.length;
                    final injurySub = injuriesCount == 0
                        ? 'onboarding.generating.injuries_none'.tr
                        : 'onboarding.generating.injuries_some'.trParams({
                            'zone': OnboardingController.optionLabel(
                              controller.selectedInjuries.keys.first,
                            ),
                          });

                    final steps = [
                      (
                        'onboarding.generating.step_profile'.tr,
                        '${controller.goalLabel} · ${controller.currentWeightKg.value} kg → ${controller.targetWeightKg.value} kg',
                        0.2,
                      ),
                      (
                        'onboarding.generating.step_injuries'.tr,
                        injurySub,
                        0.4,
                      ),
                      (
                        'onboarding.generating.step_schedule'.tr,
                        '${controller.selectedDayIndices.length} × ${controller.sessionLengthMinutes.value} min · ${controller.selectedDaysSummary}',
                        0.6,
                      ),
                      (
                        'onboarding.generating.step_recipes'.tr,
                        'onboarding.generating.recipes_subtitle'.trParams({
                          'diets': diets,
                          'budget': '${controller.weeklyBudgetEur.value}',
                        }),
                        0.82,
                      ),
                      (
                        'onboarding.generating.step_grocery'.tr,
                        'onboarding.generating.grocery_subtitle'.trParams({
                          'count': '${controller.mealsPerWeek.value}',
                        }),
                        0.98,
                      ),
                    ];

                    return Column(
                      children: List.generate(steps.length, (i) {
                        final (title, sub, threshold) = steps[i];
                        final prevThreshold = i == 0 ? 0.0 : steps[i - 1].$3;
                        final status = p >= threshold
                            ? _StepStatus.done
                            : (p >= prevThreshold
                                  ? _StepStatus.active
                                  : _StepStatus.pending);

                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: i == steps.length - 1 ? 0 : 18.h,
                          ),
                          child: _GenerationStepRow(
                            title: title,
                            subtitle: sub,
                            status: status,
                          ),
                        );
                      }),
                    );
                  }),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconPath.obShield,
                      width: 15.r,
                      height: 15.r,
                      colorFilter: const ColorFilter.mode(
                        AppColors.muted,
                        BlendMode.srcIn,
                      ),
                    ),
                    Gap.h(6),
                    Text(
                      'onboarding.generating.built_by'.tr,
                      style: text.mediumTextStyle(
                        fontSize: 13,
                        lineHeight: 16,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _StepStatus { done, active, pending }

class _GenerationStepRow extends StatelessWidget {
  const _GenerationStepRow({
    required this.title,
    required this.subtitle,
    required this.status,
  });

  final String title;
  final String subtitle;
  final _StepStatus status;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    Widget indicator;
    switch (status) {
      case _StepStatus.done:
        indicator = Container(
          width: 26.r,
          height: 26.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.emerald,
          ),
          child: Center(
            child: SvgPicture.asset(
              IconPath.obCheck,
              width: 14.r,
              height: 14.r,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      case _StepStatus.active:
        indicator = Container(
          width: 26.r,
          height: 26.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.peach,
            border: Border.all(color: AppColors.coral, width: 2),
          ),
          child: Center(
            child: Container(
              width: 8.r,
              height: 8.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.coral,
              ),
            ),
          ),
        );
      case _StepStatus.pending:
        indicator = Container(
          width: 26.r,
          height: 26.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.transparent,
            border: Border.all(color: AppColors.line, width: 1.5),
          ),
        );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        indicator,
        Gap.h(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: text.semiBoldTextStyle(
                  fontSize: 14.5,
                  lineHeight: 19,
                  color: status == _StepStatus.pending
                      ? AppColors.subtle
                      : AppColors.ink,
                ),
              ),
              Gap(2),
              Text(
                subtitle,
                style: text.regularTextStyle(
                  fontSize: 12.5,
                  lineHeight: 17,
                  color: status == _StepStatus.active
                      ? AppColors.cta
                      : AppColors.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RingProgressPainter extends CustomPainter {
  _RingProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 6;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.peach
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9,
    );

    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi * 2 * progress.clamp(0.0, 1.0),
      false,
      Paint()
        ..color = AppColors.coral
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9
        ..strokeCap = StrokeCap.butt,
    );
  }

  @override
  bool shouldRepaint(covariant _RingProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
