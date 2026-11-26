import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/weight_ruler_picker.dart';

/// Figma "01b · Onboarding — Target Weight & Pace" (Step 2/6).
class OnboardingTargetWeightScreen extends GetView<OnboardingController> {
  const OnboardingTargetWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      stepIndex: 2,
      eyebrow: 'onboarding.target_weight.eyebrow'.tr,
      title: 'onboarding.target_weight.title'.tr,
      subtitle: 'onboarding.target_weight.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'onboarding.common.continue'.tr,
          onPressed: controller.goToWithMilon,
        ),
      ),
      children: [
        Gap(22),
        // Target weight ruler card
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(18.w, 22.h, 18.w, 18.h),
          decoration: BoxDecoration(
            color: AppColors.pearl,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Obx(() {
            final target = controller.targetWeightKg.value;
            final current = controller.currentWeightKg.value;
            final delta = controller.weightDeltaKg;
            final deltaLabel = delta == 0
                ? 'onboarding.target_weight.delta_maintain'.trParams({
                    'current': '$current',
                  })
                : 'onboarding.target_weight.delta_change'.trParams({
                    'delta': '${delta > 0 ? '+' : '−'}${delta.abs()}',
                    'current': '$current',
                  });

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$target',
                      style: text.boldTextStyle(
                        fontSize: 52,
                        lineHeight: 56,
                        letterSpacing: -1.5,
                        color: AppColors.ink,
                      ),
                    ),
                    Gap.h(6),
                    Text(
                      'kg',
                      style: text.semiBoldTextStyle(
                        fontSize: 18,
                        lineHeight: 22,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Text(
                    deltaLabel,
                    style: text.semiBoldTextStyle(
                      fontSize: 13,
                      lineHeight: 16,
                      color: AppColors.cta,
                    ),
                  ),
                ),
                Gap(18),
                WeightRulerPicker(
                  valueKg: target,
                  onChanged: (kg) => controller.targetWeightKg.value = kg,
                ),
              ],
            );
          }),
        ),
        Gap(22),
        OnboardingSectionTitle(title: 'onboarding.target_weight.pace_title'.tr),
        Gap(12),
        // Dark recommended pace card
        Obx(() {
          final pace = controller.weeklyPaceKg;
          final paceText = pace == 0
              ? 'onboarding.target_weight.pace_maintenance'.tr
              : 'onboarding.target_weight.pace_change'.trParams({
                  'pace': controller.weeklyPaceLabel,
                });

          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.ink,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Column(
              children: [
                Text(
                  'onboarding.target_weight.recommended_pace'.tr,
                  style: text.boldTextStyle(
                    fontSize: 15,
                    lineHeight: 20,
                    color: AppColors.white,
                  ),
                ),
                Gap(4),
                Text(
                  paceText,
                  textAlign: TextAlign.center,
                  style: text.regularTextStyle(
                    fontSize: 13,
                    lineHeight: 18,
                    color: AppColors.white.withValues(alpha: 0.78),
                  ),
                ),
              ],
            ),
          );
        }),
        Gap(14),
        // Projection chart card
        Obx(() {
          final target = controller.targetWeightKg.value;
          final current = controller.currentWeightKg.value;
          final weeks = controller.estimatedWeeks;
          final dateStr = controller.targetDateFormatted;
          final paceLabel = controller.weeklyPaceLabel;

          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'onboarding.target_weight.reach_by'.trParams({
                    'target': '$target',
                    'date': dateStr,
                  }),
                  style: text.boldTextStyle(
                    fontSize: 15,
                    lineHeight: 20,
                    color: AppColors.ink,
                  ),
                ),
                Gap(10),
                WeightProjectionChart(isLosingWeight: target <= current),
                Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'onboarding.target_weight.today_weight'.trParams({
                        'current': '$current',
                      }),
                      style: text.mediumTextStyle(
                        fontSize: 13,
                        lineHeight: 16,
                        color: AppColors.muted,
                      ),
                    ),
                    Text(
                      'onboarding.common.weeks_approx'.trParams({
                        'weeks': '$weeks',
                      }),
                      style: text.boldTextStyle(
                        fontSize: 13,
                        lineHeight: 16,
                        color: AppColors.emerald,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  'onboarding.target_weight.estimate_note'.trParams({
                    'pace': paceLabel,
                  }),
                  style: text.regularTextStyle(
                    fontSize: AppTextStyle.sm,
                    lineHeight: 17,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          );
        }),
        Gap(14),
        Obx(
          () => OnboardingInfoBanner(
            backgroundColor: AppColors.infoSoft,
            textColor: AppColors.ink,
            text: 'onboarding.target_weight.healthy_range'.trParams({
              'height': '${controller.heightCm.value}',
              'range': controller.healthyRangeText,
            }),
          ),
        ),
      ],
    );
  }
}
