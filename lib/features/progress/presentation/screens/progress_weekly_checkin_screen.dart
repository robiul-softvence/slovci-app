import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';

/// Figma "17c · Progress — Weekly Check-in".
class ProgressWeeklyCheckinScreen extends GetView<ProgressController> {
  const ProgressWeeklyCheckinScreen({super.key});

  // Translation keys; translated with `.tr` at display time.
  static const _feelLabels = [
    'progress_coach.weekly_checkin.feel_too_easy',
    'progress_coach.weekly_checkin.feel_just_right',
    'progress_coach.weekly_checkin.feel_too_hard',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
                child: Row(
                  children: [
                    Material(
                      color: AppColors.pearl,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: Get.back,
                        child: SizedBox.square(
                          dimension: 40.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.hwClose,
                              width: 17.r,
                              height: 17.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'progress_coach.weekly_checkin.title'.tr,
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    SizedBox(width: 40.r),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'progress_coach.weekly_checkin.heading'.trParams({
                          'name': 'Solène',
                        }),
                        style: text.boldTextStyle(
                          fontSize: 28,
                          lineHeight: 34,
                          letterSpacing: -0.5,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(8),
                      Text(
                        'progress_coach.weekly_checkin.intro'.tr,
                        style: text.regularTextStyle(
                          fontSize: 14,
                          lineHeight: 20,
                          color: AppColors.muted,
                        ),
                      ),
                      Gap(16),
                      // Auto-tracked summary box
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          color: AppColors.pearl,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'progress_coach.weekly_checkin.auto_tracked'
                                      .tr,
                                  style: text.boldTextStyle(
                                    fontSize: 10.5,
                                    letterSpacing: 0.6,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Text(
                                  'progress_coach.weekly_checkin.week_range'.tr,
                                  style: text.regularTextStyle(
                                    fontSize: 11.5,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Expanded(
                                  child: _TrackedBox(
                                    value: '3 / 4',
                                    label:
                                        'progress_coach.weekly_checkin.workouts_done'
                                            .tr,
                                  ),
                                ),
                                Gap.h(8),
                                Expanded(
                                  child: _TrackedBox(
                                    value: '11 / 14',
                                    label:
                                        'progress_coach.weekly_checkin.planned_meals'
                                            .tr,
                                  ),
                                ),
                                Gap.h(8),
                                Expanded(
                                  child: _TrackedBox(
                                    value: '7h10',
                                    label:
                                        'progress_coach.weekly_checkin.avg_sleep'
                                            .tr,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(14),
                      _RatingScaleCard(
                        iconPath: IconPath.pcZap,
                        title: 'progress_coach.weekly_checkin.energy_title'.tr,
                        leftLabel:
                            'progress_coach.weekly_checkin.energy_low'.tr,
                        rightLabel:
                            'progress_coach.weekly_checkin.energy_high'.tr,
                        ratingRx: controller.energyRating,
                      ),
                      Gap(12),
                      _RatingScaleCard(
                        iconPath: IconPath.hwFood,
                        title: 'progress_coach.weekly_checkin.hunger_title'.tr,
                        leftLabel:
                            'progress_coach.weekly_checkin.hunger_low'.tr,
                        rightLabel:
                            'progress_coach.weekly_checkin.hunger_high'.tr,
                        ratingRx: controller.hungerRating,
                      ),
                      Gap(12),
                      _RatingScaleCard(
                        iconPath: IconPath.pcMoon,
                        title: 'progress_coach.weekly_checkin.sleep_title'.tr,
                        leftLabel: 'progress_coach.weekly_checkin.sleep_low'.tr,
                        rightLabel:
                            'progress_coach.weekly_checkin.sleep_high'.tr,
                        ratingRx: controller.sleepRating,
                      ),
                      Gap(12),
                      _RatingScaleCard(
                        iconPath: IconPath.pcHeart,
                        title: 'progress_coach.weekly_checkin.stress_title'.tr,
                        leftLabel:
                            'progress_coach.weekly_checkin.stress_low'.tr,
                        rightLabel:
                            'progress_coach.weekly_checkin.stress_high'.tr,
                        ratingRx: controller.stressRating,
                      ),
                      Gap(12),
                      // How did your workouts feel?
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _PeachIconBadge(iconPath: IconPath.hwDumbbell),
                                Gap.h(10),
                                Text(
                                  'progress_coach.weekly_checkin.feel_title'.tr,
                                  style: text.boldTextStyle(
                                    fontSize: 15,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ],
                            ),
                            Gap(12),
                            Obx(
                              () => Row(
                                children: List.generate(_feelLabels.length, (
                                  i,
                                ) {
                                  final selected =
                                      controller.workoutFeelIndex.value == i;
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: i == 2 ? 0 : 8.w,
                                      ),
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.workoutFeelIndex.value =
                                                i,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 11.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: selected
                                                ? AppColors.ink
                                                : AppColors.pearl,
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                          ),
                                          child: Text(
                                            _feelLabels[i].tr,
                                            textAlign: TextAlign.center,
                                            style: text.semiBoldTextStyle(
                                              fontSize: 13,
                                              color: selected
                                                  ? AppColors.white
                                                  : AppColors.ink,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(12),
                      // Weight this morning
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: Row(
                          children: [
                            const _PeachIconBadge(iconPath: IconPath.pcScale),
                            Gap.h(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'progress_coach.weekly_checkin.weight_title'
                                        .tr,
                                    style: text.boldTextStyle(
                                      fontSize: 14.5,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  Text(
                                    'progress_coach.weekly_checkin.weight_hint'
                                        .tr,
                                    style: text.regularTextStyle(
                                      fontSize: 11.5,
                                      color: AppColors.muted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 9.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: AppColors.ink,
                                  width: 1.5,
                                ),
                              ),
                              child: Obx(
                                () => Text(
                                  '${controller.currentWeight.value.toStringAsFixed(1)} kg',
                                  style: text.boldTextStyle(
                                    fontSize: 14,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomActionBar(
                primary: AppPrimaryButton(
                  label: 'progress_coach.weekly_checkin.submit'.tr,
                  onPressed: controller.openWeek2Plan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrackedBox extends StatelessWidget {
  const _TrackedBox({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: text.boldTextStyle(fontSize: 16, color: AppColors.ink),
          ),
          Gap(2),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: text.regularTextStyle(fontSize: 11, color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class _PeachIconBadge extends StatelessWidget {
  const _PeachIconBadge({required this.iconPath});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.r,
      height: 34.r,
      decoration: BoxDecoration(
        color: AppColors.peach,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 17.r,
          height: 17.r,
          colorFilter: const ColorFilter.mode(AppColors.cta, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class _RatingScaleCard extends StatelessWidget {
  const _RatingScaleCard({
    required this.iconPath,
    required this.title,
    required this.leftLabel,
    required this.rightLabel,
    required this.ratingRx,
  });

  final String iconPath;
  final String title;
  final String leftLabel;
  final String rightLabel;
  final RxInt ratingRx;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _PeachIconBadge(iconPath: iconPath),
              Gap.h(10),
              Text(
                title,
                style: text.boldTextStyle(fontSize: 15, color: AppColors.ink),
              ),
            ],
          ),
          Gap(12),
          Obx(
            () => Row(
              children: List.generate(5, (i) {
                final val = i + 1;
                final selected = ratingRx.value == val;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: i == 4 ? 0 : 8.w),
                    child: GestureDetector(
                      onTap: () => ratingRx.value = val,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 140),
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected ? AppColors.ink : AppColors.pearl,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '$val',
                          style: text.boldTextStyle(
                            fontSize: 14,
                            color: selected ? AppColors.white : AppColors.ink,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leftLabel,
                style: text.regularTextStyle(
                  fontSize: 11.5,
                  color: AppColors.subtle,
                ),
              ),
              Text(
                rightLabel,
                style: text.regularTextStyle(
                  fontSize: 11.5,
                  color: AppColors.subtle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
