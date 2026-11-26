import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';

/// Figma "13b · Nutrition — Recipe Detail".
class NutritionRecipeDetailScreen extends GetView<NutritionController> {
  const NutritionRecipeDetailScreen({super.key});

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
                padding: EdgeInsets.only(bottom: 24.h),
                child: Obx(() {
                  final meal = controller.featuredMeal;
                  final mult = controller.portionMultiplier.value;
                  final scale = mult / 1.25;
                  final kcal = (meal.kcal * scale).round();
                  final pro = (meal.proteinG * scale).round();
                  final carb = (meal.carbsG * scale).round();
                  final fat = (meal.fatsG * scale).round();
                  final inCartCount = controller.ingredients
                      .where((e) => e.inGroceryList)
                      .length;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero recipe image
                      SizedBox(
                        height: 268.h,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(meal.imagePath, fit: BoxFit.cover),
                            SafeArea(
                              bottom: false,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 8.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _HeroBtn(
                                          iconPath: IconPath.chevLeft,
                                          onTap: Get.back,
                                        ),
                                        _HeroBtn(
                                          iconPath: IconPath.nutHeart,
                                          iconColor: controller.recipeSaved.value
                                              ? AppColors.cta
                                              : AppColors.ink,
                                          onTap: () =>
                                              controller.recipeSaved.toggle(),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white.withValues(
                                          alpha: 0.92,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          99.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            IconPath.hwSpark,
                                            width: 12.r,
                                            height: 12.r,
                                            colorFilter: const ColorFilter.mode(
                                              AppColors.ink,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          Gap.h(5),
                                          Text(
                                            'nutrition.meal_plan.portion_badge'
                                                .trParams({
                                                  'portion': controller.amount(
                                                    mult,
                                                  ),
                                                }),
                                            style: text.boldTextStyle(
                                              fontSize: 10.5,
                                              letterSpacing: 0.5,
                                              color: AppColors.ink,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(12),
                                  ],
                                ),
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
                            Text(
                              meal.timeLabel.tr,
                              style: text.boldTextStyle(
                                fontSize: 11,
                                letterSpacing: 0.6,
                                color: AppColors.cta,
                              ),
                            ),
                            Gap(4),
                            Text(
                              meal.title.tr,
                              style: text.boldTextStyle(
                                fontSize: 25,
                                lineHeight: 30,
                                letterSpacing: -0.4,
                                color: AppColors.ink,
                              ),
                            ),
                            Gap(8),
                            Wrap(
                              spacing: 10.w,
                              runSpacing: 4.h,
                              children: [
                                Text(
                                  controller.prepText(meal),
                                  style: text.regularTextStyle(
                                    fontSize: 12.5,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Text(
                                  controller.approxPrice(meal.costEur),
                                  style: text.boldTextStyle(
                                    fontSize: 12.5,
                                    color: AppColors.emerald,
                                  ),
                                ),
                                Text(
                                  meal.dietTags.tr,
                                  style: text.regularTextStyle(
                                    fontSize: 12.5,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                            Gap(16),
                            // Portion stepper
                            Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                color: AppColors.pearl,
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              child: Row(
                                children: [
                                  _StepperBtn(
                                    iconPath: IconPath.hwMinus,
                                    onTap: () =>
                                        controller.adjustPortion(-0.25),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'nutrition.recipe.portion'.trParams({
                                            'portion': controller.amount(mult),
                                          }),
                                          style: text.boldTextStyle(
                                            fontSize: 15,
                                            color: AppColors.ink,
                                          ),
                                        ),
                                        Text(
                                          'nutrition.recipe.adjusted_to_target'
                                              .trParams({'kcal': '1,485'}),
                                          style: text.regularTextStyle(
                                            fontSize: 11.5,
                                            color: AppColors.muted,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _StepperBtn(
                                    iconPath: IconPath.hwPlus,
                                    onTap: () => controller.adjustPortion(0.25),
                                  ),
                                ],
                              ),
                            ),
                            Gap(14),
                            // 4 macro boxes
                            Row(
                              children: [
                                Expanded(
                                  child: _SmallMacroTile(
                                    value: '$kcal',
                                    label: 'nutrition.common.kcal'.tr,
                                    color: AppColors.coral,
                                  ),
                                ),
                                Gap.h(8),
                                Expanded(
                                  child: _SmallMacroTile(
                                    value: controller.grams(pro),
                                    label: 'nutrition.common.protein'.tr,
                                    color: AppColors.coral,
                                  ),
                                ),
                                Gap.h(8),
                                Expanded(
                                  child: _SmallMacroTile(
                                    value: controller.grams(carb),
                                    label: 'nutrition.common.carbs'.tr,
                                    color: AppColors.carbsBlue,
                                  ),
                                ),
                                Gap.h(8),
                                Expanded(
                                  child: _SmallMacroTile(
                                    value: controller.grams(fat),
                                    label: 'nutrition.common.fats'.tr,
                                    color: AppColors.amber,
                                  ),
                                ),
                              ],
                            ),
                            Gap(22),
                            // Ingredients header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'nutrition.recipe.ingredients'.tr,
                                  style: text.boldTextStyle(
                                    fontSize: 18,
                                    color: AppColors.ink,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: controller.openGroceryList,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconPath.nutCartGreen,
                                        width: 14.r,
                                        height: 14.r,
                                      ),
                                      Gap.h(5),
                                      Text(
                                        'nutrition.recipe.in_grocery_list'
                                            .trParams({
                                              'count': '$inCartCount',
                                              'total':
                                                  '${controller.ingredients.length}',
                                            }),
                                        style: text.semiBoldTextStyle(
                                          fontSize: 12.5,
                                          color: AppColors.emerald,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(12),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(18.r),
                                border: Border.all(color: AppColors.line),
                              ),
                              child: Column(
                                children: List.generate(
                                  controller.ingredients.length,
                                  (i) {
                                    final ing = controller.ingredients[i];
                                    return GestureDetector(
                                      onTap: () => controller
                                          .toggleIngredientInCart(i),
                                      behavior: HitTestBehavior.opaque,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 7.r,
                                              height: 7.r,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.coral,
                                              ),
                                            ),
                                            Gap.h(10),
                                            Expanded(
                                              child: Text(
                                                ing.name.tr,
                                                style: text.mediumTextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.ink,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ing.quantity.tr,
                                              style: text.boldTextStyle(
                                                fontSize: 13.5,
                                                color: AppColors.ink,
                                              ),
                                            ),
                                            Gap.h(12),
                                            SvgPicture.asset(
                                              ing.inGroceryList
                                                  ? IconPath.nutCartGreen
                                                  : IconPath.hwPlus,
                                              width: 16.r,
                                              height: 16.r,
                                              colorFilter: ing.inGroceryList
                                                  ? null
                                                  : const ColorFilter.mode(
                                                      AppColors.muted,
                                                      BlendMode.srcIn,
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Gap(22),
                            Text(
                              'nutrition.recipe.steps'.tr,
                              style: text.boldTextStyle(
                                fontSize: 18,
                                color: AppColors.ink,
                              ),
                            ),
                            Gap(12),
                            ...List.generate(controller.recipeSteps.length, (i) {
                              final numStr = (i + 1).toString().padLeft(2, '0');
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 30.w,
                                      child: Text(
                                        numStr,
                                        style: text.boldTextStyle(
                                          fontSize: 15,
                                          color: AppColors.coral,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.recipeSteps[i].tr,
                                        style: text.regularTextStyle(
                                          fontSize: 14,
                                          lineHeight: 20,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            // Pinned bottom CTA
            Container(
              color: AppColors.white,
              padding: EdgeInsets.fromLTRB(
                20.w,
                10.h,
                20.w,
                math.max(MediaQuery.viewPaddingOf(context).bottom, 20.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppPrimaryButton(
                      label: 'nutrition.common.log_as_eaten'.tr,
                      onPressed: () {
                        controller.logFeaturedMealAsEaten();
                        Get.back();
                      },
                    ),
                  ),
                  Gap.h(10),
                  Material(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: const BorderSide(color: AppColors.line),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => controller.swapWithAlternative(
                        controller.alternatives.first,
                      ),
                      child: SizedBox.square(
                        dimension: 52.r,
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.nutRefresh,
                            width: 20.r,
                            height: 20.r,
                          ),
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

class _HeroBtn extends StatelessWidget {
  const _HeroBtn({
    required this.iconPath,
    required this.onTap,
    this.iconColor = AppColors.ink,
  });

  final String iconPath;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white.withValues(alpha: 0.9),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 40.r,
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 19.r,
              height: 19.r,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}

class _StepperBtn extends StatelessWidget {
  const _StepperBtn({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 38.r,
          child: Center(
            child: SvgPicture.asset(iconPath, width: 16.r, height: 16.r),
          ),
        ),
      ),
    );
  }
}

class _SmallMacroTile extends StatelessWidget {
  const _SmallMacroTile({
    required this.value,
    required this.label,
    required this.color,
  });

  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.pearl,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: text.boldTextStyle(fontSize: 15, color: AppColors.ink),
          ),
          Gap(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 5.r,
                height: 5.r,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
              Gap.h(4),
              Text(
                label,
                style: text.regularTextStyle(
                  fontSize: 11,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
