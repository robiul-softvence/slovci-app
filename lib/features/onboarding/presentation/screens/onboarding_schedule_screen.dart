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

/// Figma "03b · Onboarding — Schedule & Availability" (Step 5/6).
class OnboardingScheduleScreen extends GetView<OnboardingController> {
  const OnboardingScheduleScreen({super.key});

  static const _sessionCounts = [2, 3, 4, 5, 6];
  static const _sessionLengths = [20, 30, 45, 60];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      stepIndex: 5,
      eyebrow: 'STEP 5 · AVAILABILITY',
      title: 'When can you train?',
      subtitle: "We'll fit your program into your real week, with rest days built in.",
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Continue',
          onPressed: controller.goToFoodPreferences,
        ),
      ),
      children: [
        Gap(22),
        const OnboardingSectionTitle(
          title: 'Sessions per week',
          accent: '3 recommended',
        ),
        Gap(12),
        Obx(
          () => OnboardingSegmentedControl<int>(
            items: _sessionCounts,
            selected: controller.sessionsPerWeek.value,
            onSelect: controller.selectSessionsPerWeek,
            labelBuilder: (c) => '$c',
          ),
        ),
        Gap(22),
        const OnboardingSectionTitle(title: 'Preferred days'),
        Gap(12),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (i) {
              final selected = controller.selectedDayIndices.contains(i);
              return GestureDetector(
                onTap: () => controller.toggleDay(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 42.r,
                  height: 42.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.ink : AppColors.pearl,
                  ),
                  child: Text(
                    OnboardingController.weekDayLetters[i],
                    style: text.boldTextStyle(
                      fontSize: 14,
                      lineHeight: 18,
                      color: selected ? AppColors.white : AppColors.muted,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Gap(10),
        Text(
          'Tip: avoid back-to-back days for the same muscles.',
          style: text.regularTextStyle(
            fontSize: AppTextStyle.sm,
            lineHeight: 16,
            color: AppColors.muted,
          ),
        ),
        Gap(22),
        const OnboardingSectionTitle(
          title: 'Session length',
          accent: '30 min recommended',
        ),
        Gap(12),
        Obx(
          () => Row(
            children: _sessionLengths.map((mins) {
              final selected = controller.sessionLengthMinutes.value == mins;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: mins == _sessionLengths.last ? 0 : 8.w,
                  ),
                  child: GestureDetector(
                    onTap: () => controller.sessionLengthMinutes.value = mins,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      height: 38.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected ? AppColors.ink : AppColors.pearl,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: Text(
                        '$mins min',
                        style: text.semiBoldTextStyle(
                          fontSize: 13,
                          lineHeight: 16,
                          color: selected ? AppColors.white : AppColors.ink,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Gap(22),
        const OnboardingSectionTitle(title: 'Preferred time'),
        Gap(12),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: _TimeSlotCard(
                  title: 'Morning',
                  range: '6–10 AM',
                  iconPath: IconPath.obSun,
                  selected:
                      controller.preferredTime.value ==
                      PreferredTimeOption.morning,
                  onTap: () => controller.preferredTime.value =
                      PreferredTimeOption.morning,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _TimeSlotCard(
                  title: 'Lunch break',
                  range: '12–2 PM',
                  iconPath: IconPath.obCoffee,
                  selected:
                      controller.preferredTime.value ==
                      PreferredTimeOption.lunchBreak,
                  onTap: () => controller.preferredTime.value =
                      PreferredTimeOption.lunchBreak,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _TimeSlotCard(
                  title: 'Evening',
                  range: '6–9 PM',
                  iconPath: IconPath.obMoon,
                  selected:
                      controller.preferredTime.value ==
                      PreferredTimeOption.evening,
                  onTap: () => controller.preferredTime.value =
                      PreferredTimeOption.evening,
                ),
              ),
            ],
          ),
        ),
        Gap(16),
        Obx(
          () => OnboardingInfoBanner(
            iconPath: IconPath.obCalendar,
            text: controller.scheduleBannerSummary,
          ),
        ),
      ],
    );
  }
}

class _TimeSlotCard extends StatelessWidget {
  const _TimeSlotCard({
    required this.title,
    required this.range,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String range;
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
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 13.h),
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
            SvgPicture.asset(
              iconPath,
              width: 22.r,
              height: 22.r,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.cta : AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
            Gap(14),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.boldTextStyle(
                fontSize: 13,
                lineHeight: 17,
                color: AppColors.ink,
              ),
            ),
            Gap(3),
            Text(
              range,
              style: text.regularTextStyle(
                fontSize: 12,
                lineHeight: 16,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
