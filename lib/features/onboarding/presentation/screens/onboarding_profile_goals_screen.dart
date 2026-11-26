import 'package:flutter/cupertino.dart';
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

/// Figma "01 · Onboarding — Profile & Goals" (Step 1/6).
class OnboardingProfileGoalsScreen extends GetView<OnboardingController> {
  const OnboardingProfileGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      stepIndex: 1,
      eyebrow: 'onboarding.profile_goals.eyebrow'.tr,
      title: 'onboarding.profile_goals.title'.tr,
      subtitle: 'onboarding.profile_goals.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'onboarding.common.continue'.tr,
          onPressed: controller.goToTargetWeight,
        ),
      ),
      children: [
        Gap(22),
        OnboardingSectionTitle(title: 'onboarding.profile_goals.name_title'.tr),
        Gap(10),
        TextField(
          controller: controller.nameController,
          textCapitalization: TextCapitalization.words,
          style: text.mediumTextStyle(
            fontSize: 16,
            lineHeight: 22,
            color: AppColors.ink,
          ),
          decoration: InputDecoration(
            hintText: 'onboarding.profile_goals.name_hint'.tr,
            hintStyle: text.regularTextStyle(
              fontSize: 16,
              color: AppColors.subtle,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.coral, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.cta, width: 1.8),
            ),
          ),
        ),
        Gap(8),
        Text(
          'onboarding.profile_goals.name_helper'.tr,
          style: text.regularTextStyle(
            fontSize: AppTextStyle.sm,
            lineHeight: 16,
            color: AppColors.muted,
          ),
        ),
        Gap(22),
        OnboardingSectionTitle(
          title: 'onboarding.profile_goals.gender_title'.tr,
        ),
        Gap(10),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: OnboardingChoicePill(
                  label: 'onboarding.profile_goals.gender_female'.tr,
                  selected: controller.gender.value == GenderOption.female,
                  onTap: () => controller.gender.value = GenderOption.female,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: OnboardingChoicePill(
                  label: 'onboarding.profile_goals.gender_male'.tr,
                  selected: controller.gender.value == GenderOption.male,
                  onTap: () => controller.gender.value = GenderOption.male,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: OnboardingChoicePill(
                  label: 'onboarding.common.other'.tr,
                  selected: controller.gender.value == GenderOption.other,
                  onTap: () => controller.gender.value = GenderOption.other,
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        OnboardingSectionTitle(title: 'onboarding.profile_goals.demo_title'.tr),
        Gap(10),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: OnboardingChoicePill(
                  label: 'onboarding.profile_goals.demo_woman'.tr,
                  selected: controller.demoModel.value == DemoModelOption.woman,
                  onTap: () =>
                      controller.demoModel.value = DemoModelOption.woman,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: OnboardingChoicePill(
                  label: 'onboarding.profile_goals.demo_man'.tr,
                  selected: controller.demoModel.value == DemoModelOption.man,
                  onTap: () => controller.demoModel.value = DemoModelOption.man,
                ),
              ),
            ],
          ),
        ),
        Gap(8),
        Text(
          'onboarding.profile_goals.demo_helper'.tr,
          style: text.regularTextStyle(
            fontSize: AppTextStyle.sm,
            lineHeight: 17,
            color: AppColors.muted,
          ),
        ),
        Gap(22),
        OnboardingSectionTitle(
          title: 'onboarding.profile_goals.metrics_title'.tr,
        ),
        Gap(12),
        Row(
          children: [
            Expanded(
              child: _MetricWheelColumn(
                label: 'onboarding.profile_goals.age'.tr,
                unit: 'onboarding.common.yrs'.tr,
                minValue: 16,
                maxValue: 85,
                valueRx: controller.age,
              ),
            ),
            Gap.h(10),
            Expanded(
              child: _MetricWheelColumn(
                label: 'onboarding.profile_goals.height'.tr,
                unit: 'cm',
                minValue: 130,
                maxValue: 220,
                valueRx: controller.heightCm,
              ),
            ),
            Gap.h(10),
            Expanded(
              child: _MetricWheelColumn(
                label: 'onboarding.profile_goals.weight'.tr,
                unit: 'kg',
                minValue: 35,
                maxValue: 180,
                valueRx: controller.currentWeightKg,
              ),
            ),
          ],
        ),
        Gap(24),
        OnboardingSectionTitle(title: 'onboarding.profile_goals.goal_title'.tr),
        Gap(12),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: _GoalCard(
                  label: 'onboarding.goal.lose_weight'.tr,
                  iconPath: IconPath.obFlame,
                  selected:
                      controller.primaryGoal.value ==
                      PrimaryGoalOption.loseWeight,
                  onTap: () => controller.primaryGoal.value =
                      PrimaryGoalOption.loseWeight,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _GoalCard(
                  label: 'onboarding.goal.build_muscle'.tr,
                  iconPath: IconPath.obDumbbell,
                  selected:
                      controller.primaryGoal.value ==
                      PrimaryGoalOption.buildMuscle,
                  onTap: () => controller.primaryGoal.value =
                      PrimaryGoalOption.buildMuscle,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _GoalCard(
                  label: 'onboarding.goal.stay_fit'.tr,
                  iconPath: IconPath.obHeart,
                  selected:
                      controller.primaryGoal.value == PrimaryGoalOption.stayFit,
                  onTap: () =>
                      controller.primaryGoal.value = PrimaryGoalOption.stayFit,
                ),
              ),
            ],
          ),
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'onboarding.profile_goals.activity_title'.tr,
        ),
        Gap(12),
        Obx(
          () => Column(
            children: [
              _ActivityCard(
                title: 'onboarding.profile_goals.sedentary_title'.tr,
                subtitle: 'onboarding.profile_goals.sedentary_subtitle'.tr,
                iconPath: IconPath.obBuilding,
                selected:
                    controller.activityLevel.value ==
                    ActivityLevelOption.sedentary,
                onTap: () => controller.activityLevel.value =
                    ActivityLevelOption.sedentary,
              ),
              Gap(10),
              _ActivityCard(
                title: 'onboarding.profile_goals.active_title'.tr,
                subtitle: 'onboarding.profile_goals.active_subtitle'.tr,
                iconPath: IconPath.obRun,
                selected:
                    controller.activityLevel.value ==
                    ActivityLevelOption.active,
                onTap: () =>
                    controller.activityLevel.value = ActivityLevelOption.active,
              ),
              Gap(10),
              _ActivityCard(
                title: 'onboarding.profile_goals.very_active_title'.tr,
                subtitle: 'onboarding.profile_goals.very_active_subtitle'.tr,
                iconPath: IconPath.obBolt,
                selected:
                    controller.activityLevel.value ==
                    ActivityLevelOption.veryActive,
                onTap: () => controller.activityLevel.value =
                    ActivityLevelOption.veryActive,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetricWheelColumn extends StatelessWidget {
  const _MetricWheelColumn({
    required this.label,
    required this.unit,
    required this.minValue,
    required this.maxValue,
    required this.valueRx,
  });

  final String label;
  final String unit;
  final int minValue;
  final int maxValue;
  final RxInt valueRx;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final count = maxValue - minValue + 1;

    return Column(
      children: [
        Text(
          label,
          style: text.mediumTextStyle(
            fontSize: AppTextStyle.sm,
            lineHeight: 16,
            color: AppColors.muted,
          ),
        ),
        Gap(8),
        Container(
          height: 146.h,
          decoration: BoxDecoration(
            color: AppColors.pearl,
            borderRadius: BorderRadius.circular(18.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Center highlight band
              Container(
                height: 44.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border.symmetric(
                    horizontal: BorderSide(color: AppColors.line),
                  ),
                ),
              ),
              CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: (valueRx.value - minValue).clamp(0, count - 1),
                ),
                itemExtent: 34.h,
                diameterRatio: 2.2,
                squeeze: 1.05,
                selectionOverlay: const SizedBox.shrink(),
                onSelectedItemChanged: (idx) => valueRx.value = minValue + idx,
                children: List.generate(count, (idx) {
                  final v = minValue + idx;
                  return Obx(() {
                    final selected = valueRx.value == v;
                    return Center(
                      child: selected
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$v',
                                  style: text.boldTextStyle(
                                    fontSize: 20,
                                    lineHeight: 24,
                                    color: AppColors.ink,
                                  ),
                                ),
                                Gap.h(3),
                                Text(
                                  unit,
                                  style: text.mediumTextStyle(
                                    fontSize: 12,
                                    lineHeight: 14,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              '$v',
                              style: text.mediumTextStyle(
                                fontSize: 14,
                                lineHeight: 18,
                                color: AppColors.subtle,
                              ),
                            ),
                    );
                  });
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({
    required this.label,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 38.r,
                  height: 38.r,
                  decoration: BoxDecoration(
                    color: selected ? AppColors.coral : AppColors.pearl,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                      width: 20.r,
                      height: 20.r,
                      colorFilter: ColorFilter.mode(
                        selected ? AppColors.white : AppColors.ink,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                OnboardingCheckBadge(selected: selected),
              ],
            ),
            Gap(16),
            Text(
              label,
              style: text.boldTextStyle(
                fontSize: 13,
                lineHeight: 17,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: selected ? AppColors.white : AppColors.pearl,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    selected ? AppColors.cta : AppColors.ink,
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
                    title,
                    style: text.boldTextStyle(
                      fontSize: 14,
                      lineHeight: 18,
                      color: AppColors.ink,
                    ),
                  ),
                  Gap(2),
                  Text(
                    subtitle,
                    style: text.regularTextStyle(
                      fontSize: AppTextStyle.sm,
                      lineHeight: 16,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            Gap.h(8),
            OnboardingCheckBadge(selected: selected),
          ],
        ),
      ),
    );
  }
}
