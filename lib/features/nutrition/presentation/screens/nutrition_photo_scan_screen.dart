import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';

/// Figma "14b · Nutrition — Photo Scan Result".
class NutritionPhotoScanScreen extends GetView<NutritionController> {
  const NutritionPhotoScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Photo capture with AI detection tags
                    SizedBox(
                      height: 320.h,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            ImagePath.nutPhotoScan,
                            fit: BoxFit.cover,
                          ),
                          // Top controls
                          SafeArea(
                            bottom: false,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Material(
                                    color: AppColors.white.withValues(
                                      alpha: 0.88,
                                    ),
                                    shape: const CircleBorder(),
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: Get.back,
                                      child: SizedBox.square(
                                        dimension: 38.r,
                                        child: Center(
                                          child: SvgPicture.asset(
                                            IconPath.hwClose,
                                            width: 16.r,
                                            height: 16.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 7.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                      borderRadius: BorderRadius.circular(99.r),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          IconPath.hwSpark,
                                          width: 14.r,
                                          height: 14.r,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.cta,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Gap.h(5),
                                        Text(
                                          'nutrition.add_meal.photo_scan_title'.tr,
                                          style: text.semiBoldTextStyle(
                                            fontSize: 12.5,
                                            color: AppColors.ink,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // AI Detection pills + boxes
                          Positioned(
                            top: 44.h,
                            left: 124.w,
                            child: _DetectionPill(
                              label: 'nutrition.mock.detect_quinoa'.tr,
                            ),
                          ),
                          Positioned(
                            top: 102.h,
                            left: 38.w,
                            child: _DetectionPill(
                              label: 'nutrition.mock.detect_chicken'.tr,
                            ),
                          ),
                          Positioned(
                            top: 122.h,
                            right: 92.w,
                            child: _DetectionPill(
                              label: 'nutrition.mock.detect_broccoli'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  'nutrition.photo_scan.found_items'.trParams({
                                    'count': '${controller.scannedItems.length}',
                                  }),
                                  style: text.boldTextStyle(
                                    fontSize: 20,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: Get.back,
                                child: Text(
                                  'nutrition.photo_scan.retake'.tr,
                                  style: text.semiBoldTextStyle(
                                    fontSize: 14,
                                    color: AppColors.cta,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(14),
                          // Detected items list card
                          Container(
                            padding: EdgeInsets.all(14.r),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: AppColors.line),
                            ),
                            child: Obx(
                              () => Column(
                                children: [
                                  ...List.generate(
                                    controller.scannedItems.length,
                                    (i) {
                                      final item = controller.scannedItems[i];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 14.h),
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.toggleScannedItem(i),
                                          behavior: HitTestBehavior.opaque,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 24.r,
                                                height: 24.r,
                                                decoration: BoxDecoration(
                                                  color: item.selected
                                                      ? AppColors.emerald
                                                      : AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        7.r,
                                                      ),
                                                  border: item.selected
                                                      ? null
                                                      : Border.all(
                                                          color: AppColors.line,
                                                          width: 1.5,
                                                        ),
                                                ),
                                                child: item.selected
                                                    ? Center(
                                                        child: SvgPicture.asset(
                                                          IconPath.hwCheck,
                                                          width: 14.r,
                                                          height: 14.r,
                                                          colorFilter:
                                                              const ColorFilter.mode(
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.name.tr,
                                                      style: text
                                                          .semiBoldTextStyle(
                                                            fontSize: 14.5,
                                                            color: AppColors.ink,
                                                          ),
                                                    ),
                                                    Gap(2),
                                                    Text(
                                                      item.macroSummary.tr,
                                                      style: text
                                                          .regularTextStyle(
                                                            fontSize: 12.5,
                                                            color:
                                                                AppColors.muted,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 12.w,
                                                  vertical: 7.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.pearl,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        11.r,
                                                      ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      '${item.grams} g',
                                                      style: text.boldTextStyle(
                                                        fontSize: 13,
                                                        color: AppColors.ink,
                                                      ),
                                                    ),
                                                    Gap.h(6),
                                                    SvgPicture.asset(
                                                      IconPath.nutEdit,
                                                      width: 13.r,
                                                      height: 13.r,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconPath.hwPlus,
                                        width: 14.r,
                                        height: 14.r,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.cta,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      Gap.h(8),
                                      Text(
                                        'nutrition.photo_scan.add_missing'.tr,
                                        style: text.semiBoldTextStyle(
                                          fontSize: 13.5,
                                          color: AppColors.cta,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(14),
                          // Dark TOTAL summary card
                          Obx(
                            () => Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.w,
                                vertical: 16.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.ink,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'nutrition.photo_scan.total'.tr,
                                        style: text.boldTextStyle(
                                          fontSize: 10.5,
                                          letterSpacing: 0.7,
                                          color: AppColors.white.withValues(
                                            alpha: 0.7,
                                          ),
                                        ),
                                      ),
                                      Gap(3),
                                      Text(
                                        '${controller.scannedTotalKcal} kcal',
                                        style: text.boldTextStyle(
                                          fontSize: 24,
                                          lineHeight: 28,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'nutrition.photo_scan.total_macros'
                                            .trParams({
                                              'protein': controller.grams(
                                                controller.scannedTotalProtein,
                                              ),
                                              'carbs': controller.grams(
                                                controller.scannedTotalCarbs,
                                              ),
                                              'fats': controller.grams(
                                                controller.scannedTotalFats,
                                              ),
                                            }),
                                        style: text.semiBoldTextStyle(
                                          fontSize: 13,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Gap(4),
                                      Text(
                                        'nutrition.photo_scan.fits_budget'.tr,
                                        style: text.semiBoldTextStyle(
                                          fontSize: 12,
                                          color: AppColors.lime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(12),
                          // Amber disclaimer
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              color: AppColors.amberSoft,
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  IconPath.nutAlert,
                                  width: 17.r,
                                  height: 17.r,
                                ),
                                Gap.h(10),
                                Expanded(
                                  child: Text(
                                    'nutrition.photo_scan.disclaimer'.tr,
                                    style: text.regularTextStyle(
                                      fontSize: 12.5,
                                      lineHeight: 17,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Pinned Log CTA
            Container(
              color: AppColors.white,
              padding: EdgeInsets.fromLTRB(
                20.w,
                10.h,
                20.w,
                math.max(MediaQuery.viewPaddingOf(context).bottom, 20.0),
              ),
              child: Obx(
                () => AppPrimaryButton(
                  label: 'nutrition.photo_scan.log_cta'.trParams({
                    'kcal': '${controller.scannedTotalKcal}',
                    'slot': NutritionController
                        .mealSlotTabs[controller.addMealSlotIndex.value]
                        .tr,
                  }),
                  onPressed: controller.logPhotoScanToMeal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetectionPill extends StatelessWidget {
  const _DetectionPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.lime,
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: Text(
        label,
        style: AppTextStyle(context).boldTextStyle(
          fontSize: 11.5,
          lineHeight: 14,
          color: AppColors.ink,
        ),
      ),
    );
  }
}
