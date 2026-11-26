import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/domain/entities/onboarding_models.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';

/// Figma "02b · Onboarding — Injury Detail Sheet".
class InjuryDetailSheet extends StatelessWidget {
  const InjuryDetailSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => const InjuryDetailSheet(),
    );
  }

  static const _avoidItems = [
    'Push-ups on palms',
    'Burpees',
    'Barbell front squat',
    'High plank holds',
  ];

  static const _includeItems = [
    'Forearm plank',
    'Neutral-grip DB press',
    'Machine chest press',
    'Leg press',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    final text = AppTextStyle(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.line,
                  borderRadius: BorderRadius.circular(99.r),
                ),
              ),
            ),
            Gap(16),
            // Sheet Header
            Row(
              children: [
                Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      IconPath.obShield,
                      width: 22.r,
                      height: 22.r,
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
                          controller.activeInjuryZone.value,
                          style: text.boldTextStyle(
                            fontSize: 20,
                            lineHeight: 24,
                            color: AppColors.ink,
                          ),
                        ),
                        Gap(2),
                        Text(
                          controller.activeInjuryViewLabel.value,
                          style: text.regularTextStyle(
                            fontSize: 13,
                            lineHeight: 16,
                            color: AppColors.muted,
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
                    onTap: Get.back,
                    child: SizedBox.square(
                      dimension: 36.r,
                      child: Center(
                        child: SvgPicture.asset(
                          IconPath.obClose,
                          width: 16.r,
                          height: 16.r,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(20),
            const OnboardingSectionTitle(title: "What's the condition?"),
            Gap(12),
            Obx(
              () => Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: OnboardingController.injuryConditions.map((cond) {
                  return OnboardingTagChip(
                    label: cond,
                    selected: controller.draftCondition.value == cond,
                    onTap: () => controller.draftCondition.value = cond,
                  );
                }).toList(),
              ),
            ),
            Gap(20),
            const OnboardingSectionTitle(title: 'How severe is it?'),
            Gap(12),
            Obx(
              () => OnboardingSegmentedControl<InjurySeverity>(
                items: InjurySeverity.values,
                selected: controller.draftSeverity.value,
                selectedTextColor: AppColors.ink,
                onSelect: (v) => controller.draftSeverity.value = v,
                labelBuilder: (s) {
                  switch (s) {
                    case InjurySeverity.mild:
                      return 'Mild';
                    case InjurySeverity.moderate:
                      return 'Moderate';
                    case InjurySeverity.severe:
                      return 'Severe';
                  }
                },
              ),
            ),
            Gap(14),
            TextField(
              controller: controller.injuryNotesController,
              style: text.regularTextStyle(
                fontSize: AppTextStyle.md,
                color: AppColors.ink,
              ),
              decoration: InputDecoration(
                hintText: 'Anything else to add? (optional)',
                hintStyle: text.regularTextStyle(
                  fontSize: AppTextStyle.md,
                  color: AppColors.subtle,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 14.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: const BorderSide(
                    color: AppColors.coral,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            Gap(16),
            // Adaptation preview card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.pearl,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28.r,
                        height: 28.r,
                        decoration: BoxDecoration(
                          color: AppColors.coral,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.obSpark,
                            width: 16.r,
                            height: 16.r,
                          ),
                        ),
                      ),
                      Gap.h(10),
                      Text(
                        'MILON will adapt your plan',
                        style: text.semiBoldTextStyle(
                          fontSize: 15,
                          lineHeight: 20,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                  Gap(14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AVOID',
                              style: text.boldTextStyle(
                                fontSize: 11,
                                lineHeight: 14,
                                letterSpacing: 0.6,
                                color: AppColors.cta,
                              ),
                            ),
                            Gap(10),
                            ..._avoidItems.map(
                              (item) => Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20.r,
                                      height: 20.r,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.coralSoft,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          IconPath.obCloseSmall,
                                          width: 10.r,
                                          height: 10.r,
                                        ),
                                      ),
                                    ),
                                    Gap.h(8),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: text.regularTextStyle(
                                          fontSize: 13,
                                          lineHeight: 17,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap.h(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'INCLUDE',
                              style: text.boldTextStyle(
                                fontSize: 11,
                                lineHeight: 14,
                                letterSpacing: 0.6,
                                color: AppColors.emerald,
                              ),
                            ),
                            Gap(10),
                            ..._includeItems.map(
                              (item) => Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20.r,
                                      height: 20.r,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.mintLight,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          IconPath.obCheck,
                                          width: 11.r,
                                          height: 11.r,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.emerald,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap.h(8),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: text.regularTextStyle(
                                          fontSize: 13,
                                          lineHeight: 17,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  IconPath.obInfo,
                  width: 16.r,
                  height: 16.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.muted,
                    BlendMode.srcIn,
                  ),
                ),
                Gap.h(8),
                Expanded(
                  child: Text(
                    "MILON isn't a medical device. If pain persists or gets worse, stop and see a health professional.",
                    style: text.regularTextStyle(
                      fontSize: 12,
                      lineHeight: 16,
                      color: AppColors.muted,
                    ),
                  ),
                ),
              ],
            ),
            Gap(18),
            AppPrimaryButton(
              label: 'Confirm & Save',
              onPressed: () {
                controller.saveActiveInjury();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
