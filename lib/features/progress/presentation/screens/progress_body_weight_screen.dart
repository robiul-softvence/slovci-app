import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentaion/UI/bottom_nav_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';

/// Figma "16b · Progress — Body & Weight".
class ProgressBodyWeightScreen extends GetView<ProgressController> {
  const ProgressBodyWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final navController = Get.isRegistered<BottomNavController>()
        ? Get.find<BottomNavController>()
        : Get.put(BottomNavController());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        bottomNavigationBar: MilonFloatingNavBar(controller: navController),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 114.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
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
                              IconPath.chevLeft,
                              width: 20.r,
                              height: 20.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'progress_coach.body_weight.title'.tr,
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    Material(
                      color: AppColors.cta,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: controller.logTodayWeight,
                        child: SizedBox.square(
                          dimension: 40.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.hwPlus,
                              width: 18.r,
                              height: 18.r,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(16),
                // Weight Trend Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'progress_coach.body_weight.current'.tr,
                                  style: text.boldTextStyle(
                                    fontSize: 11,
                                    letterSpacing: 0.7,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Gap(4),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.currentWeight.value
                                            .toStringAsFixed(1),
                                        style: text.boldTextStyle(
                                          fontSize: 34,
                                          lineHeight: 38,
                                          letterSpacing: -0.8,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ),
                                    Gap.h(5),
                                    Text(
                                      'kg',
                                      style: text.mediumTextStyle(
                                        fontSize: 14,
                                        color: AppColors.muted,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(4),
                                Text(
                                  'progress_coach.body_weight.change_since'.tr,
                                  style: text.semiBoldTextStyle(
                                    fontSize: 12.5,
                                    color: AppColors.emerald,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => Container(
                              padding: EdgeInsets.all(3.r),
                              decoration: BoxDecoration(
                                color: AppColors.pearl,
                                borderRadius: BorderRadius.circular(99.r),
                              ),
                              child: Row(
                                children: List.generate(
                                  ProgressController.weightRanges.length,
                                  (i) {
                                    final selected =
                                        controller.selectedWeightRange.value ==
                                        i;
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.selectedWeightRange.value =
                                              i,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 11.w,
                                          vertical: 6.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? AppColors.ink
                                              : AppColors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            99.r,
                                          ),
                                        ),
                                        child: Text(
                                          ProgressController.weightRanges[i].tr,
                                          style: text.boldTextStyle(
                                            fontSize: 12,
                                            color: selected
                                                ? AppColors.white
                                                : AppColors.muted,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(16),
                      SizedBox(
                        height: 150.h,
                        width: double.infinity,
                        child: SvgPicture.asset(
                          IconPath.pcWeightChart,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Gap(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ChartLegend(
                            color: AppColors.coral,
                            label: 'progress_coach.body_weight.legend_daily'.tr,
                          ),
                          _ChartLegend(
                            color: AppColors.coral,
                            label: 'progress_coach.body_weight.legend_trend'.tr,
                          ),
                          _ChartLegend(
                            color: AppColors.emerald,
                            label: 'progress_coach.body_weight.goal_value'
                                .trParams({'weight': '58 kg'}),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(14),
                // Goal progress card
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'progress_coach.body_weight.start_value'.trParams({
                              'weight': '62.0 kg',
                            }),
                            style: text.regularTextStyle(
                              fontSize: 12.5,
                              color: AppColors.muted,
                            ),
                          ),
                          Text(
                            'progress_coach.body_weight.to_goal'.tr,
                            style: text.boldTextStyle(
                              fontSize: 13,
                              color: AppColors.ink,
                            ),
                          ),
                          Text(
                            'progress_coach.body_weight.goal_value'.trParams({
                              'weight': '58.0 kg',
                            }),
                            style: text.regularTextStyle(
                              fontSize: 12.5,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99.r),
                        child: LinearProgressIndicator(
                          value: 0.12,
                          minHeight: 8.h,
                          backgroundColor: AppColors.white,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.coral,
                          ),
                        ),
                      ),
                      Gap(10),
                      Text(
                        'progress_coach.body_weight.pace'.tr,
                        style: text.regularTextStyle(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(22),
                Text(
                  'progress_coach.body_weight.measurements'.tr,
                  style: text.boldTextStyle(fontSize: 18, color: AppColors.ink),
                ),
                Gap(12),
                Row(
                  children: [
                    Expanded(
                      child: _MeasurementTile(
                        label: 'progress_coach.body_weight.waist'.tr,
                        value: '74 cm',
                        delta: '−1 cm',
                        deltaColor: AppColors.emerald,
                      ),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _MeasurementTile(
                        label: 'progress_coach.body_weight.hips'.tr,
                        value: '96 cm',
                        delta: '±0',
                        deltaColor: AppColors.muted,
                      ),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _MeasurementTile(
                        label: 'progress_coach.body_weight.body_fat'.tr,
                        value: '—',
                        delta: 'progress_coach.body_weight.optional'.tr,
                        deltaColor: AppColors.muted,
                      ),
                    ),
                  ],
                ),
                Gap(16),
                OnboardingInfoBanner(
                  backgroundColor: AppColors.infoSoft,
                  textColor: AppColors.ink,
                  text: 'progress_coach.body_weight.info_banner'.tr,
                ),
                Gap(18),
                AppPrimaryButton(
                  label: 'progress_coach.body_weight.log_button'.tr,
                  onPressed: controller.logTodayWeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChartLegend extends StatelessWidget {
  const _ChartLegend({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10.w,
          height: 3.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(99.r),
          ),
        ),
        Gap.h(5),
        Text(
          label,
          style: AppTextStyle(
            context,
          ).regularTextStyle(fontSize: 11, color: AppColors.muted),
        ),
      ],
    );
  }
}

class _MeasurementTile extends StatelessWidget {
  const _MeasurementTile({
    required this.label,
    required this.value,
    required this.delta,
    required this.deltaColor,
  });

  final String label;
  final String value;
  final String delta;
  final Color deltaColor;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(IconPath.pcRuler, width: 17.r, height: 17.r),
          Gap(10),
          Text(
            label,
            style: text.regularTextStyle(fontSize: 12, color: AppColors.muted),
          ),
          Gap(4),
          Text(
            value,
            style: text.boldTextStyle(fontSize: 18, color: AppColors.ink),
          ),
          Gap(4),
          Text(
            delta,
            style: text.semiBoldTextStyle(fontSize: 12, color: deltaColor),
          ),
        ],
      ),
    );
  }
}
