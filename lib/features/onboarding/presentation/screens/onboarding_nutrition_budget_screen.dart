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
      eyebrow: 'STEP 6 · NUTRITION',
      title: 'Your food, your budget',
      subtitle:
          "We'll match recipes to your diet and generate a grocery list within budget.",
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Generate My Plan',
          onPressed: controller.goToGeneratingPlan,
        ),
      ),
      children: [
        Gap(22),
        const OnboardingSectionTitle(title: 'Dietary preferences'),
        Gap(12),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: OnboardingController.dietaryOptions.map((diet) {
              return OnboardingTagChip(
                label: diet,
                selected: controller.selectedDiets.contains(diet),
                onTap: () => controller.toggleDiet(diet),
              );
            }).toList(),
          ),
        ),
        Gap(24),
        const OnboardingSectionTitle(title: 'Meals per week'),
        Gap(12),
        Obx(
          () => OnboardingSegmentedControl<int>(
            items: _mealCounts,
            selected: controller.mealsPerWeek.value,
            onSelect: (m) => controller.mealsPerWeek.value = m,
            labelBuilder: (m) => '$m',
            subtitleBuilder: (m) => '${m ~/ 7} / day',
          ),
        ),
        Gap(24),
        const OnboardingSectionTitle(title: 'Weekly grocery budget'),
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
