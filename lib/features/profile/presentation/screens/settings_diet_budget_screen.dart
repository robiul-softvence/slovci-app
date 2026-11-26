import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19i · Settings — Diet & Grocery Budget".
class SettingsDietBudgetScreen extends GetView<ProfileController> {
  const SettingsDietBudgetScreen({super.key});

  static const _styles = [
    'Classic',
    'Flexitarian',
    'Vegetarian',
    'Vegan',
    'Halal',
  ];
  static const _restrictions = [
    'Lactose-Free',
    'Gluten-Free',
    'Nut-Free',
    'Pork-Free',
  ];
  static const _mealPlans = ['7 · 1/day', '14 · 2/day', '21 · 3/day'];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Diet & Grocery Budget',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Save & Update Meal Plan',
          onPressed: () {
            Get.back();
            AppHelperFunctions.showSnackBar('Meal plan preferences updated!');
          },
        ),
      ),
      children: [
        const SettingsSectionLabel('EATING STYLE'),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: _styles.map((style) {
              return OnboardingTagChip(
                label: style,
                selected: controller.eatingStyle.value == style,
                unselectedBg: AppColors.white,
                onTap: () => controller.eatingStyle.value = style,
              );
            }).toList(),
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('RESTRICTIONS & ALLERGIES'),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: _restrictions.map((item) {
              return OnboardingTagChip(
                label: item,
                selected: controller.restrictions.contains(item),
                unselectedBg: AppColors.white,
                onTap: () => controller.toggleRestriction(item),
              );
            }).toList(),
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('FOODS YOU DISLIKE'),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              ...controller.dislikedFoods.map(
                (food) => GestureDetector(
                  onTap: () => controller.removeDislikedFood(food),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(99.r),
                      border: Border.all(color: AppColors.line),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          food,
                          style: text.mediumTextStyle(
                            fontSize: 13,
                            color: AppColors.ink,
                          ),
                        ),
                        Gap.h(6),
                        SvgPicture.asset(
                          IconPath.hwClose,
                          width: 12.r,
                          height: 12.r,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.dislikedFoods.add('Tuna'),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Text(
                    '+ Add',
                    style: text.semiBoldTextStyle(
                      fontSize: 13,
                      color: AppColors.cta,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('MEALS PLANNED PER WEEK'),
        Obx(
          () => Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.line),
            ),
            child: Row(
              children: List.generate(_mealPlans.length, (i) {
                final selected = controller.mealsPerWeekIdx.value == i;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.mealsPerWeekIdx.value = i,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 11.h),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.ink : AppColors.transparent,
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: Text(
                        _mealPlans[i],
                        textAlign: TextAlign.center,
                        style: text.semiBoldTextStyle(
                          fontSize: 13,
                          color: selected ? AppColors.white : AppColors.muted,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Gap(8),
        Text(
          'Lunch + dinner are planned. Breakfast and snacks are your choice.',
          style: text.regularTextStyle(fontSize: 12, color: AppColors.muted),
        ),
        Gap(22),
        const SettingsSectionLabel('BUDGET'),
        Obx(() {
          final budget = controller.weeklyBudget.value;
          final meals = [7, 14, 21][controller.mealsPerWeekIdx.value];
          final perMeal = budget / meals;
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weekly grocery budget',
                  style: text.regularTextStyle(
                    fontSize: 13,
                    color: AppColors.muted,
                  ),
                ),
                Gap(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '€${budget.round()}',
                      style: text.boldTextStyle(
                        fontSize: 32,
                        color: AppColors.ink,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lime,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: Text(
                        '≈ €${perMeal.toStringAsFixed(2)} / meal',
                        style: text.boldTextStyle(
                          fontSize: 12.5,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.coral,
                    inactiveTrackColor: AppColors.pearl,
                    thumbColor: AppColors.coral,
                    trackHeight: 6,
                  ),
                  child: Slider(
                    value: budget,
                    min: 20,
                    max: 150,
                    divisions: 26,
                    onChanged: (v) => controller.weeklyBudget.value = v,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '€20',
                      style: text.regularTextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                    Text(
                      '€150',
                      style: text.regularTextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        Gap(16),
        Text(
          'Preferred store',
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Any supermarket',
                style: text.mediumTextStyle(fontSize: 14.5, color: AppColors.ink),
              ),
              SvgPicture.asset(IconPath.hwChevRight, width: 15.r, height: 15.r),
            ],
          ),
        ),
      ],
    );
  }
}
