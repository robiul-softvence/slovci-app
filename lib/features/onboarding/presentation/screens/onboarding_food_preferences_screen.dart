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
      eyebrow: 'onboarding.food_prefs.eyebrow'.tr,
      title: 'onboarding.food_prefs.title'.tr,
      subtitle: 'onboarding.food_prefs.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'onboarding.common.continue'.tr,
          onPressed: controller.goToNutritionBudget,
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
            hintText: 'onboarding.food_prefs.search_hint'.tr,
            hintStyle: text.regularTextStyle(
              fontSize: AppTextStyle.md,
              color: AppColors.subtle,
            ),
            prefixIcon: Icon(Icons.search, size: 18.r, color: AppColors.subtle),
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
            (e) =>
                query.isEmpty ||
                OnboardingController.optionLabel(
                  e.key,
                ).toLowerCase().contains(query),
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
                title: 'onboarding.food_prefs.love_title'.tr,
                badge: '👍 ${_selectedCount(loved.length)}',
              ),
              Gap(12),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: loved.map((food) {
                  return OnboardingTagChip(
                    label: OnboardingController.optionLabel(food),
                    selected: true,
                    selectedBg: AppColors.ink,
                    selectedText: AppColors.white,
                    onTap: () => controller.cycleFoodPreference(food),
                  );
                }).toList(),
              ),
              Gap(22),
              _PreferenceHeader(
                title: 'onboarding.food_prefs.dislike_title'.tr,
                badge: '👎 ${_selectedCount(disliked.length)}',
              ),
              Gap(12),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: disliked.map((food) {
                  return OnboardingTagChip(
                    label: OnboardingController.optionLabel(food),
                    selected: true,
                    selectedBg: AppColors.coralSoft,
                    selectedText: AppColors.dangerDark,
                    onTap: () => controller.cycleFoodPreference(food),
                  );
                }).toList(),
              ),
              Gap(22),
              OnboardingSectionTitle(
                title: 'onboarding.food_prefs.tap_to_add'.tr,
              ),
              Gap(12),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: neutral.map((food) {
                  return OnboardingTagChip(
                    label: OnboardingController.optionLabel(food),
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

  String _selectedCount(int count) =>
      (count == 1
              ? 'onboarding.food_prefs.selected_one'
              : 'onboarding.food_prefs.selected_other')
          .trParams({'count': '$count'});
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
