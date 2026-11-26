import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';

/// Figma "14 · Nutrition — Add a Meal (Multi-Modal Logging)" modal sheet.
class NutritionAddMealSheet extends StatelessWidget {
  const NutritionAddMealSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => const NutritionAddMealSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NutritionController>();
    final text = AppTextStyle(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 28.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add a Meal',
                  style: text.boldTextStyle(
                    fontSize: 22,
                    color: AppColors.ink,
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
                          IconPath.hwClose,
                          width: 16.r,
                          height: 16.r,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(14),
            // Meal slot chips
            Obx(
              () => Row(
                children: List.generate(
                  NutritionController.mealSlotTabs.length,
                  (i) => Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: OnboardingTagChip(
                      label: NutritionController.mealSlotTabs[i],
                      selected: controller.addMealSlotIndex.value == i,
                      onTap: () => controller.addMealSlotIndex.value = i,
                    ),
                  ),
                ),
              ),
            ),
            Gap(16),
            // 2x2 Logging Mode Cards
            Row(
              children: [
                Expanded(
                  child: _LogModeCard(
                    title: 'Photo Scan',
                    subtitle: 'Snap your plate',
                    iconPath: IconPath.nutCamera,
                    highlighted: true,
                    onTap: () {
                      Get.back();
                      controller.openPhotoScanResult();
                    },
                  ),
                ),
                Gap.h(12),
                Expanded(
                  child: _LogModeCard(
                    title: 'Barcode Scanner',
                    subtitle: 'Packaged foods',
                    iconPath: IconPath.nutBarcode,
                    onTap: () {
                      Get.back();
                      controller.openPhotoScanResult();
                    },
                  ),
                ),
              ],
            ),
            Gap(12),
            Row(
              children: [
                Expanded(
                  child: _LogModeCard(
                    title: 'Gallery Upload',
                    subtitle: 'From your photos',
                    iconPath: IconPath.nutImage,
                    onTap: () {
                      Get.back();
                      controller.openPhotoScanResult();
                    },
                  ),
                ),
                Gap.h(12),
                Expanded(
                  child: _LogModeCard(
                    title: 'Manual Entry',
                    subtitle: 'Search the database',
                    iconPath: IconPath.nutEdit,
                    onTap: () {
                      Get.back();
                      controller.openMealPlanner();
                    },
                  ),
                ),
              ],
            ),
            Gap(18),
            Row(
              children: [
                const Expanded(child: Divider(color: AppColors.line)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'or describe it',
                    style: text.regularTextStyle(
                      fontSize: 12.5,
                      color: AppColors.muted,
                    ),
                  ),
                ),
                const Expanded(child: Divider(color: AppColors.line)),
              ],
            ),
            Gap(16),
            // Describe box + Estimate button
            Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.line),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.describeMealController,
                          maxLines: 2,
                          style: text.regularTextStyle(
                            fontSize: 14,
                            color: AppColors.ink,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'e.g. "2 eggs, a slice of toast and an orange juice"',
                            hintStyle: text.regularTextStyle(
                              fontSize: 13.5,
                              lineHeight: 19,
                              color: AppColors.subtle,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                      Gap.h(8),
                      Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.pearl,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.nutMic,
                            width: 18.r,
                            height: 18.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(12),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: Material(
                      color: AppColors.ink,
                      borderRadius: BorderRadius.circular(14.r),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          controller.openPhotoScanResult();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              IconPath.hwSpark,
                              width: 17.r,
                              height: 17.r,
                              colorFilter: const ColorFilter.mode(
                                AppColors.lime,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap.h(8),
                            Text(
                              'Estimate from a photo',
                              style: text.boldTextStyle(
                                fontSize: 14.5,
                                color: AppColors.white,
                              ),
                            ),
                          ],
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
    );
  }
}

class _LogModeCard extends StatelessWidget {
  const _LogModeCard({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
    this.highlighted = false,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: highlighted ? AppColors.cta : AppColors.pearl,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42.r,
              height: 42.r,
              decoration: BoxDecoration(
                color: highlighted
                    ? AppColors.white.withValues(alpha: 0.2)
                    : AppColors.white,
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    highlighted ? AppColors.white : AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Gap(16),
            Text(
              title,
              style: text.boldTextStyle(
                fontSize: 15,
                lineHeight: 19,
                color: highlighted ? AppColors.white : AppColors.ink,
              ),
            ),
            Gap(3),
            Text(
              subtitle,
              style: text.regularTextStyle(
                fontSize: 12.5,
                color: highlighted
                    ? AppColors.white.withValues(alpha: 0.82)
                    : AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
