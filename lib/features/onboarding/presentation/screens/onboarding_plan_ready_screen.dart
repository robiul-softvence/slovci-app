import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/domain/entities/onboarding_models.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "04c · Onboarding — Your Plan Is Ready".
class OnboardingPlanReadyScreen extends GetView<OnboardingController> {
  const OnboardingPlanReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      showHeader: false,
      topWidget: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.mintLight,
          borderRadius: BorderRadius.circular(99.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              IconPath.obCheck,
              width: 13.r,
              height: 13.r,
              colorFilter: const ColorFilter.mode(
                AppColors.emerald,
                BlendMode.srcIn,
              ),
            ),
            Gap.h(6),
            Text(
              'PLAN READY',
              style: text.boldTextStyle(
                fontSize: 11,
                lineHeight: 14,
                letterSpacing: 0.7,
                color: AppColors.emerald,
              ),
            ),
          ],
        ),
      ),
      titleWidget: Obx(
        () => Text(
          "${controller.firstName.value}, here's your first week",
          style: text.boldTextStyle(
            fontSize: 28,
            lineHeight: 34,
            letterSpacing: -0.5,
            color: AppColors.ink,
          ),
        ),
      ),
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Start My 7-Day Free Trial',
          onPressed: controller.goToNotifications,
        ),
        secondary: GestureDetector(
          onTap: controller.goToNotifications,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Text(
              'Review plan details',
              style: text.semiBoldTextStyle(
                fontSize: AppTextStyle.md,
                lineHeight: 20,
                color: AppColors.ink,
              ),
            ),
          ),
        ),
      ),
      children: [
        Gap(18),
        // Dark hero goal card
        Obx(
          () => Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.r),
            decoration: BoxDecoration(
              color: AppColors.ink,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'YOUR GOAL · ${controller.goalLabel.toUpperCase()}',
                      style: text.boldTextStyle(
                        fontSize: 11,
                        lineHeight: 14,
                        letterSpacing: 0.7,
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          IconPath.obTarget,
                          width: 15.r,
                          height: 15.r,
                        ),
                        Gap.h(5),
                        Text(
                          '~${controller.estimatedWeeks} weeks',
                          style: text.boldTextStyle(
                            fontSize: 12,
                            lineHeight: 15,
                            color: AppColors.lime,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(14),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          style: text.regularTextStyle(
                            fontSize: 12,
                            color: AppColors.white.withValues(alpha: 0.65),
                          ),
                        ),
                        Gap(2),
                        Text(
                          '${controller.currentWeightKg.value} kg',
                          style: text.boldTextStyle(
                            fontSize: 28,
                            lineHeight: 32,
                            letterSpacing: -0.6,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: SvgPicture.asset(
                        IconPath.obChevRight,
                        width: 18.r,
                        height: 18.r,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Target',
                          style: text.regularTextStyle(
                            fontSize: 12,
                            color: AppColors.white.withValues(alpha: 0.65),
                          ),
                        ),
                        Gap(2),
                        Text(
                          '${controller.targetWeightKg.value} kg',
                          style: text.boldTextStyle(
                            fontSize: 28,
                            lineHeight: 32,
                            letterSpacing: -0.6,
                            color: AppColors.lime,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(12),
                Text(
                  'About ${controller.weeklyPaceKg < 0 ? '−' : '+'}${controller.weeklyPaceKg.abs().toStringAsFixed(1)} kg per week. This is an estimate, not a guarantee. We adjust every week with your check-in.',
                  style: text.regularTextStyle(
                    fontSize: 12,
                    lineHeight: 17,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(14),
        // Training & Nutrition summary cards
        Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 38.r,
                        height: 38.r,
                        decoration: BoxDecoration(
                          color: AppColors.coral,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.obDumbbell,
                            width: 20.r,
                            height: 20.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Gap(12),
                      Text(
                        'TRAINING',
                        style: text.boldTextStyle(
                          fontSize: 11,
                          letterSpacing: 0.6,
                          color: AppColors.cta,
                        ),
                      ),
                      Gap(6),
                      Text(
                        '${controller.selectedDayIndices.length} × ${controller.sessionLengthMinutes.value} min / week',
                        style: text.boldTextStyle(
                          fontSize: 16,
                          lineHeight: 21,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(8),
                      Text(
                        'Full Body · ${controller.environmentLabel}',
                        style: text.regularTextStyle(
                          fontSize: 12,
                          lineHeight: 16,
                          color: AppColors.muted,
                        ),
                      ),
                      Gap(4),
                      Text(
                        controller.selectedInjuries.isEmpty
                            ? 'Tailored to your level'
                            : 'Wrist-safe moves only',
                        style: text.regularTextStyle(
                          fontSize: 12,
                          lineHeight: 16,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap.h(12),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    color: AppColors.mintSoft,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 38.r,
                        height: 38.r,
                        decoration: BoxDecoration(
                          color: AppColors.emerald,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.obFood,
                            width: 20.r,
                            height: 20.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Gap(12),
                      Text(
                        'NUTRITION',
                        style: text.boldTextStyle(
                          fontSize: 11,
                          letterSpacing: 0.6,
                          color: AppColors.emerald,
                        ),
                      ),
                      Gap(6),
                      Text(
                        '1,485 kcal / day',
                        style: text.boldTextStyle(
                          fontSize: 16,
                          lineHeight: 21,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(8),
                      Text(
                        'P 125g · C 145g · F 45g',
                        style: text.regularTextStyle(
                          fontSize: 12,
                          lineHeight: 16,
                          color: AppColors.muted,
                        ),
                      ),
                      Gap(4),
                      Text(
                        '${controller.mealsPerWeek.value} meals · ≈ €${(controller.weeklyBudgetEur.value - 1.5).toStringAsFixed(2)} / wk',
                        style: text.regularTextStyle(
                          fontSize: 12,
                          lineHeight: 16,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        // Week 1 Schedule
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OnboardingSectionTitle(title: 'Week 1 · Nov 16–22'),
            Text(
              'Rest days included',
              style: text.regularTextStyle(
                fontSize: 12,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
        Gap(12),
        Obx(
          () => Column(
            children: controller.weekOnePlan.map((day) {
              final isRest = day.type == DayPlanType.rest;
              final dotColor = day.type == DayPlanType.workout
                  ? AppColors.coral
                  : (day.type == DayPlanType.activeRecovery
                        ? AppColors.info
                        : AppColors.line);

              return Container(
                margin: EdgeInsets.only(bottom: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                decoration: BoxDecoration(
                  color: isRest ? AppColors.pearl : AppColors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: isRest ? null : Border.all(color: AppColors.line),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 42.w,
                      child: Text(
                        day.dayShort,
                        style: text.boldTextStyle(
                          fontSize: 13.5,
                          color: isRest ? AppColors.muted : AppColors.ink,
                        ),
                      ),
                    ),
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dotColor,
                      ),
                    ),
                    Gap.h(12),
                    Expanded(
                      child: Text(
                        day.title,
                        style: text.mediumTextStyle(
                          fontSize: 14,
                          color: isRest ? AppColors.muted : AppColors.ink,
                        ),
                      ),
                    ),
                    Text(
                      day.durationLabel,
                      style: text.mediumTextStyle(
                        fontSize: 13,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        Gap(18),
        const OnboardingSectionTitle(title: 'Adapted for you'),
        Gap(12),
        Obx(() {
          final tags = <(String, bool)>[
            ...controller.selectedInjuries.values.map(
              (inj) => ('${inj.zone.split(' ').first} · ${inj.condition}', true),
            ),
            ...controller.selectedDiets.map((d) => (d, false)),
            (
              '${controller.environmentLabel} · ${controller.selectedEquipment.take(3).join(', ')}',
              false,
            ),
          ];

          return Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: tags.map((pair) {
              final (label, highlight) = pair;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
                decoration: BoxDecoration(
                  color: highlight ? AppColors.peach : AppColors.pearl,
                  borderRadius: BorderRadius.circular(99.r),
                ),
                child: Text(
                  label,
                  style: text.semiBoldTextStyle(
                    fontSize: 13,
                    lineHeight: 16,
                    color: highlight ? AppColors.cta : AppColors.ink,
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
