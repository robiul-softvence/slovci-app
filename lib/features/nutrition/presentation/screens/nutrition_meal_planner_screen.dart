import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentaion/UI/bottom_nav_screen.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_add_meal_sheet.dart';

/// Figma "13 · Nutrition — Meal Planner & Recipe Swap".
class NutritionMealPlannerScreen extends GetView<NutritionController> {
  const NutritionMealPlannerScreen({super.key});

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
                    _RoundIconBtn(
                      iconPath: IconPath.chevLeft,
                      onTap: Get.back,
                    ),
                    Expanded(
                      child: Text(
                        'Meal Plan',
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    _RoundIconBtn(
                      iconPath: IconPath.nutCal,
                      onTap: controller.openGroceryList,
                    ),
                  ],
                ),
                Gap(14),
                // Breakfast / Lunch / Snack / Dinner segmented tabs
                Obx(
                  () => Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: AppColors.pearl,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      children: List.generate(
                        NutritionController.mealSlotTabs.length,
                        (i) {
                          final selected = controller.selectedSlotTab.value == i;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => controller.selectedSlotTab.value = i,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 160),
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: selected
                                      ? AppColors.ink
                                      : AppColors.transparent,
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                                child: Text(
                                  NutritionController.mealSlotTabs[i],
                                  textAlign: TextAlign.center,
                                  style: text.semiBoldTextStyle(
                                    fontSize: 13,
                                    color: selected
                                        ? AppColors.white
                                        : AppColors.muted,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Gap(16),
                // Featured meal card
                Obx(() {
                  final meal = controller.featuredMeal;
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: AppColors.line),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Photo + badges
                        GestureDetector(
                          onTap: controller.openRecipeDetail,
                          child: SizedBox(
                            height: 196.h,
                            width: double.infinity,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(meal.imagePath, fit: BoxFit.cover),
                                Positioned(
                                  top: 12.h,
                                  left: 12.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white.withValues(
                                        alpha: 0.92,
                                      ),
                                      borderRadius: BorderRadius.circular(99.r),
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
                                          '1.25 PORTION · AUTO-ADJUSTED',
                                          style: text.boldTextStyle(
                                            fontSize: 10,
                                            letterSpacing: 0.5,
                                            color: AppColors.ink,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12.h,
                                  left: 12.w,
                                  child: GestureDetector(
                                    onTap: () => controller.recipeSaved.toggle(),
                                    child: Container(
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
                                            IconPath.nutHeart,
                                            width: 13.r,
                                            height: 13.r,
                                            colorFilter: ColorFilter.mode(
                                              controller.recipeSaved.value
                                                  ? AppColors.cta
                                                  : AppColors.muted,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          Gap.h(5),
                                          Text(
                                            controller.recipeSaved.value
                                                ? 'Saved'
                                                : 'Save',
                                            style: text.semiBoldTextStyle(
                                              fontSize: 12,
                                              color: AppColors.ink,
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
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal.timeLabel,
                                style: text.boldTextStyle(
                                  fontSize: 11,
                                  letterSpacing: 0.6,
                                  color: AppColors.cta,
                                ),
                              ),
                              Gap(4),
                              GestureDetector(
                                onTap: controller.openRecipeDetail,
                                child: Text(
                                  meal.title,
                                  style: text.boldTextStyle(
                                    fontSize: 21,
                                    lineHeight: 26,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                              Gap(8),
                              Wrap(
                                spacing: 10.w,
                                runSpacing: 4.h,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        IconPath.hwFlame,
                                        width: 13.r,
                                        height: 13.r,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.cta,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      Gap.h(4),
                                      Text(
                                        '${meal.kcal} kcal',
                                        style: text.boldTextStyle(
                                          fontSize: 12.5,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        IconPath.hwClock,
                                        width: 13.r,
                                        height: 13.r,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.muted,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      Gap.h(4),
                                      Text(
                                        meal.prepLabel,
                                        style: text.regularTextStyle(
                                          fontSize: 12.5,
                                          color: AppColors.muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '≈ €${meal.costEur.toStringAsFixed(2)}',
                                    style: text.boldTextStyle(
                                      fontSize: 12.5,
                                      color: AppColors.emerald,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(14),
                              Row(
                                children: [
                                  Expanded(
                                    child: _MacroChipBox(
                                      value: '${meal.proteinG}g',
                                      label: 'Protein',
                                      dotColor: AppColors.coral,
                                    ),
                                  ),
                                  Gap.h(8),
                                  Expanded(
                                    child: _MacroChipBox(
                                      value: '${meal.carbsG}g',
                                      label: 'Carbs',
                                      dotColor: AppColors.carbsBlue,
                                    ),
                                  ),
                                  Gap.h(8),
                                  Expanded(
                                    child: _MacroChipBox(
                                      value: '${meal.fatsG}g',
                                      label: 'Fats',
                                      dotColor: AppColors.amber,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(14),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppPrimaryButton(
                                      label: meal.eaten
                                          ? 'Logged ✓'
                                          : 'Log as Eaten',
                                      onPressed:
                                          controller.logFeaturedMealAsEaten,
                                    ),
                                  ),
                                  Gap.h(10),
                                  Material(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                      side: const BorderSide(
                                        color: AppColors.line,
                                      ),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () => controller
                                          .swapWithAlternative(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                Gap(16),
                // Dashed "+ Add a meal or snack" CTA
                GestureDetector(
                  onTap: () => NutritionAddMealSheet.show(context),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: AppColors.coral.withValues(alpha: 0.55),
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IconPath.hwPlus,
                          width: 15.r,
                          height: 15.r,
                          colorFilter: const ColorFilter.mode(
                            AppColors.cta,
                            BlendMode.srcIn,
                          ),
                        ),
                        Gap.h(8),
                        Text(
                          'Add a meal or snack (photo, barcode, search)',
                          style: text.semiBoldTextStyle(
                            fontSize: 13,
                            color: AppColors.cta,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(22),
                // Swap with an alternative
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Swap with an alternative',
                      style: text.boldTextStyle(
                        fontSize: 17,
                        color: AppColors.ink,
                      ),
                    ),
                    Text(
                      'Same macros ±5%',
                      style: text.regularTextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.alternatives.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.78,
                  ),
                  itemBuilder: (context, i) {
                    final alt = controller.alternatives[i];
                    return GestureDetector(
                      onTap: () => controller.swapWithAlternative(alt),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: AppColors.line),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                alt.imagePath,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    alt.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: text.boldTextStyle(
                                      fontSize: 13.5,
                                      lineHeight: 17,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  Gap(6),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        alt.prepMin,
                                        style: text.regularTextStyle(
                                          fontSize: 11.5,
                                          color: AppColors.muted,
                                        ),
                                      ),
                                      Text(
                                        '≈ €${alt.costEur.toStringAsFixed(2)}',
                                        style: text.boldTextStyle(
                                          fontSize: 11.5,
                                          color: AppColors.emerald,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(3),
                                  Text(
                                    '${alt.kcal} kcal · ${alt.proteinG}g P',
                                    style: text.regularTextStyle(
                                      fontSize: 11.5,
                                      color: AppColors.muted,
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoundIconBtn extends StatelessWidget {
  const _RoundIconBtn({required this.iconPath, required this.onTap});

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

class _MacroChipBox extends StatelessWidget {
  const _MacroChipBox({
    required this.value,
    required this.label,
    required this.dotColor,
  });

  final String value;
  final String label;
  final Color dotColor;

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
            style: text.boldTextStyle(fontSize: 16, color: AppColors.ink),
          ),
          Gap(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6.r,
                height: 6.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: dotColor,
                ),
              ),
              Gap.h(4),
              Text(
                label,
                style: text.regularTextStyle(
                  fontSize: 11.5,
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
