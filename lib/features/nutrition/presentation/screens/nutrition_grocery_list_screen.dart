import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';

/// Figma "15 · Nutrition — Automated Grocery List".
class NutritionGroceryListScreen extends GetView<NutritionController> {
  const NutritionGroceryListScreen({super.key});

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
                    _TopCircleBtn(
                      iconPath: IconPath.chevLeft,
                      onTap: Get.back,
                    ),
                    Expanded(
                      child: Text(
                        'nutrition.grocery_list.title'.tr,
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    _TopCircleBtn(
                      iconPath: IconPath.hwShare,
                      onTap: () => AppHelperFunctions.showSnackBar(
                        'nutrition.grocery_list.snack_copied'.tr,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 24.h),
                  child: Column(
                    children: [
                      // Dark Budget Summary Card
                      Obx(() {
                        final checked = controller.checkedGroceryCount;
                        final checkedEur = controller.checkedGroceryEur;
                        final progress = (checkedEur / 48.50).clamp(0.02, 1.0);

                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(18.r),
                          decoration: BoxDecoration(
                            color: AppColors.ink,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'nutrition.grocery_list.week_eyebrow'.tr,
                                    style: text.boldTextStyle(
                                      fontSize: 10.5,
                                      letterSpacing: 0.6,
                                      color: AppColors.white.withValues(
                                        alpha: 0.72,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.lime,
                                      borderRadius: BorderRadius.circular(99.r),
                                    ),
                                    child: Text(
                                      'nutrition.grocery_list.within_budget'.tr,
                                      style: text.boldTextStyle(
                                        fontSize: 11,
                                        color: AppColors.ink,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    controller.price(checkedEur),
                                    style: text.boldTextStyle(
                                      fontSize: 32,
                                      lineHeight: 36,
                                      letterSpacing: -0.8,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Gap.h(8),
                                  Text(
                                    'nutrition.grocery_list.estimated'.trParams({
                                      'price': controller.price(48.50),
                                    }),
                                    style: text.regularTextStyle(
                                      fontSize: 13.5,
                                      color: AppColors.white.withValues(
                                        alpha: 0.68,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(12),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(99.r),
                                child: LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 6.h,
                                  backgroundColor: AppColors.white.withValues(
                                    alpha: 0.16,
                                  ),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        AppColors.coral,
                                      ),
                                ),
                              ),
                              Gap(12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'nutrition.grocery_list.items_checked'
                                        .trParams({
                                          'count': '$checked',
                                          'total': '18',
                                        }),
                                    style: text.regularTextStyle(
                                      fontSize: 12,
                                      color: AppColors.white.withValues(
                                        alpha: 0.72,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'nutrition.grocery_list.weekly_budget'
                                        .trParams({
                                          'price': 'nutrition.common.price'
                                              .trParams({'amount': '50'}),
                                        }),
                                    style: text.mediumTextStyle(
                                      fontSize: 12,
                                      color: AppColors.white.withValues(
                                        alpha: 0.78,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                      Gap(16),
                      _GroceryCategoryCard(
                        category: 'Produce',
                        titleKey: 'nutrition.grocery_list.category_produce',
                        iconPath: IconPath.nutLeaf,
                        controller: controller,
                      ),
                      Gap(14),
                      _GroceryCategoryCard(
                        category: 'Protein',
                        titleKey: 'nutrition.grocery_list.category_protein',
                        iconPath: IconPath.hwFlame,
                        controller: controller,
                      ),
                      Gap(14),
                      _GroceryCategoryCard(
                        category: 'Pantry & Dairy',
                        titleKey: 'nutrition.grocery_list.category_pantry_dairy',
                        iconPath: IconPath.hwFood,
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom Share List outline button
              Container(
                color: AppColors.white,
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  10.h,
                  20.w,
                  math.max(MediaQuery.viewPaddingOf(context).bottom, 20.0),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: Material(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: const BorderSide(color: AppColors.line),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => AppHelperFunctions.showSnackBar(
                        'nutrition.grocery_list.snack_ready'.tr,
                      ),
                      child: Center(
                        child: Text(
                          'nutrition.grocery_list.share_list'.tr,
                          style: text.boldTextStyle(
                            fontSize: 15,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopCircleBtn extends StatelessWidget {
  const _TopCircleBtn({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.pearl,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 40.r,
          child: Center(
            child: SvgPicture.asset(iconPath, width: 19.r, height: 19.r),
          ),
        ),
      ),
    );
  }
}

class _GroceryCategoryCard extends StatelessWidget {
  const _GroceryCategoryCard({
    required this.category,
    required this.titleKey,
    required this.iconPath,
    required this.controller,
  });

  /// Identifier matched against [GroceryItem.category] (not displayed).
  final String category;

  /// Translation key of the displayed category title.
  final String titleKey;
  final String iconPath;
  final NutritionController controller;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Obx(() {
      final indexedItems = controller.groceryItems
          .asMap()
          .entries
          .where((e) => e.value.category == category)
          .toList();

      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.line),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
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
                      colorFilter: const ColorFilter.mode(
                        AppColors.cta,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Gap.h(10),
                Text(
                  titleKey.tr,
                  style: text.boldTextStyle(fontSize: 15, color: AppColors.ink),
                ),
                const Spacer(),
                Text(
                  'nutrition.grocery_list.items_count'.trParams({
                    'count': '${indexedItems.length}',
                  }),
                  style: text.regularTextStyle(
                    fontSize: 12.5,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
            Gap(12),
            ...indexedItems.map((entry) {
              final idx = entry.key;
              final item = entry.value;
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: () => controller.toggleGroceryItem(idx),
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    children: [
                      Container(
                        width: 24.r,
                        height: 24.r,
                        decoration: BoxDecoration(
                          color: item.checked
                              ? AppColors.emerald
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(
                            color: item.checked
                                ? AppColors.emerald
                                : AppColors.line,
                            width: 1.5,
                          ),
                        ),
                        child: item.checked
                            ? Center(
                                child: SvgPicture.asset(
                                  IconPath.hwCheck,
                                  width: 13.r,
                                  height: 13.r,
                                  colorFilter: const ColorFilter.mode(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name.tr,
                              style: text.semiBoldTextStyle(
                                fontSize: 14.5,
                                color: item.checked
                                    ? AppColors.muted
                                    : AppColors.ink,
                                decoration: item.checked
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            Gap(2),
                            Text(
                              item.detail.tr,
                              style: text.regularTextStyle(
                                fontSize: 12,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        controller.price(item.priceEur),
                        style: text.semiBoldTextStyle(
                          fontSize: 14,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
