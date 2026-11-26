import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/budget_arc_dial.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "04 · Onboarding — Nutrition & Budget" (Step 6/6).
class OnboardingNutritionBudgetScreen extends GetView<OnboardingController> {
  const OnboardingNutritionBudgetScreen({super.key});

  static const _mealCounts = [7, 14, 21];

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      stepIndex: 6,
      eyebrow: 'onboarding.nutrition_budget.eyebrow'.tr,
      title: 'onboarding.nutrition_budget.title'.tr,
      subtitle: 'onboarding.nutrition_budget.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'onboarding.nutrition_budget.cta'.tr,
          onPressed: controller.goToGeneratingPlan,
        ),
      ),
      children: [
        Gap(22),
        OnboardingSectionTitle(
          title: 'onboarding.nutrition_budget.diet_title'.tr,
        ),
        Gap(12),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: OnboardingController.dietaryOptions.map((diet) {
              return OnboardingTagChip(
                label: OnboardingController.optionLabel(diet),
                selected: controller.selectedDiets.contains(diet),
                onTap: () => controller.toggleDiet(diet),
              );
            }).toList(),
          ),
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'onboarding.nutrition_budget.meals_title'.tr,
        ),
        Gap(12),
        Obx(
          () => OnboardingSegmentedControl<int>(
            items: _mealCounts,
            selected: controller.mealsPerWeek.value,
            onSelect: (m) => controller.mealsPerWeek.value = m,
            labelBuilder: (m) => '$m',
            subtitleBuilder: (m) => 'onboarding.nutrition_budget.per_day'
                .trParams({'count': '${m ~/ 7}'}),
          ),
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'onboarding.nutrition_budget.budget_title'.tr,
        ),
        Gap(12),
        Obx(
          () => BudgetArcDial(
            budgetEur: controller.weeklyBudgetEur.value,
            costPerMealEur: controller.costPerMealEur,
            onDecrease: () => controller.adjustBudget(-5),
            onIncrease: () => controller.adjustBudget(5),
          ),
        ),
      ],
    );
  }
}
