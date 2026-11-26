import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/domain/entities/onboarding_models.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "04a · Onboarding — Food Preferences" (Step 6/6).
class OnboardingFoodPreferencesScreen extends GetView<OnboardingController> {
  const OnboardingFoodPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      stepIndex: 6,
      eyebrow: 'STEP 6 · FOOD PREFERENCES',
      title: 'What do you like to eat?',
      subtitle:
          "Tell us what you love and what you'd rather avoid. MILON will adapt your meals.",
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Continue', onPressed: controller.goToNutritionBudget,
        ),
      ),
      children: [
        Gap(18),
        // Search bar
        TextField(
          controller: controller.foodSearchController,
          style: text.regularTextStyle(
            fontSize: AppTextStyle.md,
            color: AppColors.ink,
          ),
          decoration: InputDecoration(
            hintText: 'Search a food or ingredient',
            hintStyle: text.regularTextStyle(
              fontSize: AppTextStyle.md,
              color: AppColors.subtle,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 18.r,
              color: AppColors.subtle,
            ),
            filled: true,
            fillColor: AppColors.pearl,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        Gap(22),
        Obx(() {
          final query = controller.foodSearchQuery.value;
          final entries = controller.foodPreferences.entries.where(
            (e) => query.isEmpty || e.key.toLowerCase().contains(query),
          );

          final loved = entries
              .where((e) => e.value == FoodPreferenceState.love)
              .map((e) => e.key)
              .toList();
          final disliked = entries
              .where((e) => e.value == FoodPreferenceState.dislike)
              .map((e) => e.key)
              .toList();
          final neutral = entries
              .where((e) => e.value == FoodPreferenceState.neutral)
              .map((e) => e.key)
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PreferenceHeader(
                title: 'I love',
                badge: '👍 ${loved.length} selected',
              ),
              Gap(12),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: loved.map((food) {
                  return OnboardingTagChip(
                    label: food,
                    selected: true,
                    selectedBg: AppColors.ink,
                    selectedText: AppColors.white,
                    onTap: () => controller.cycleFoodPreference(food),
                  );
                }).toList(),
              ),
              Gap(22),
              _PreferenceHeader(
                title: "I don't like",
                badge: '👎 ${disliked.length} selected',
              ),
              Gap(12),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: disliked.map((food) {
                  return OnboardingTagChip(
                    label: food,
                    selected: true,
                    selectedBg: AppColors.coralSoft,
                    selectedText: AppColors.dangerDark,
                    onTap: () => controller.cycleFoodPreference(food),
                  );
                }).toList(),
              ),
              Gap(22),
              const OnboardingSectionTitle(title: 'Tap to add'),
              Gap(12),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: neutral.map((food) {
                  return OnboardingTagChip(
                    label: food,
                    selected: false,
                    onTap: () => controller.cycleFoodPreference(food),
                  );
                }).toList(),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class _PreferenceHeader extends StatelessWidget {
  const _PreferenceHeader({required this.title, required this.badge});

  final String title;
  final String badge;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Row(
      children: [
        Text(
          title,
          style: text.semiBoldTextStyle(
            fontSize: 17,
            lineHeight: 22,
            color: AppColors.ink,
          ),
        ),
        Gap.h(8),
        Text(
          badge,
          style: text.mediumTextStyle(
            fontSize: 13,
            lineHeight: 18,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}
