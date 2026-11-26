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

/// Figma "19e · Settings — Edit Profile".
class SettingsEditProfileScreen extends GetView<ProfileController> {
  const SettingsEditProfileScreen({super.key});

  static const _genderKeys = [
    'profile.edit_profile.gender_female',
    'profile.edit_profile.gender_male',
    'profile.edit_profile.gender_other',
  ];
  static const _goalKeys = [
    'profile.edit_profile.goal_lose_weight',
    'profile.edit_profile.goal_build_muscle',
    'profile.edit_profile.goal_stay_fit',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.edit_profile.title'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'profile.edit_profile.save_changes'.tr,
          onPressed: () {
            Get.back();
            AppHelperFunctions.showSnackBar(
              'profile.edit_profile.changes_saved'.tr,
            );
          },
        ),
      ),
      children: [
        Center(
          child: Column(
            children: [
              Container(
                width: 82.r,
                height: 82.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.coral,
                  border: Border.all(color: AppColors.white, width: 3.5),
                ),
                child: Center(
                  child: Text(
                    'S',
                    style: text.blackTextStyle(
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Gap(12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(99.r),
                  border: Border.all(color: AppColors.line),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      IconPath.nutCamera,
                      width: 15.r,
                      height: 15.r,
                    ),
                    Gap.h(6),
                    Text(
                      'profile.edit_profile.change_photo'.tr,
                      style: text.semiBoldTextStyle(
                        fontSize: 13,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.edit_profile.section_about_you'.tr),
        Row(
          children: [
            Expanded(
              child: _LabeledInput(
                label: 'profile.edit_profile.first_name'.tr,
                controller: controller.firstNameController,
              ),
            ),
            Gap.h(12),
            Expanded(
              child: _LabeledInput(
                label: 'profile.edit_profile.last_name'.tr,
                controller: controller.lastNameController,
              ),
            ),
          ],
        ),
        Gap(12),
        _LabeledInput(
          label: 'profile.edit_profile.date_of_birth'.tr,
          controller: controller.dobController,
        ),
        Gap(12),
        Text(
          'profile.edit_profile.gender'.tr,
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(6),
        Obx(
          () => Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.line),
            ),
            child: Row(
              children: List.generate(_genderKeys.length, (i) {
                final selected = controller.editGenderIndex.value == i;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.editGenderIndex.value = i,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.ink : AppColors.transparent,
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: Text(
                        _genderKeys[i].tr,
                        textAlign: TextAlign.center,
                        style: text.semiBoldTextStyle(
                          fontSize: 13.5,
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
        Gap(22),
        SettingsSectionLabel('profile.edit_profile.section_body'.tr),
        Row(
          children: [
            Expanded(
              child: _LabeledInput(
                label: 'profile.edit_profile.height'.tr,
                controller: controller.heightController,
              ),
            ),
            Gap.h(12),
            Expanded(
              child: _LabeledInput(
                label: 'profile.edit_profile.current_weight'.tr,
                controller: controller.weightController,
              ),
            ),
          ],
        ),
        Gap(12),
        _LabeledInput(
          label: 'profile.edit_profile.target_weight'.tr,
          controller: controller.targetWeightController,
        ),
        Gap(22),
        SettingsSectionLabel('profile.edit_profile.section_goal'.tr),
        Obx(
          () => Wrap(
            spacing: 8.w,
            children: List.generate(_goalKeys.length, (i) {
              return OnboardingTagChip(
                label: _goalKeys[i].tr,
                selected: controller.editGoalIndex.value == i,
                unselectedBg: AppColors.white,
                onTap: () => controller.editGoalIndex.value = i,
              );
            }),
          ),
        ),
        Gap(16),
        OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text: 'profile.edit_profile.regenerate_info'.tr,
        ),
      ],
    );
  }
}

class _LabeledInput extends StatelessWidget {
  const _LabeledInput({required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(6),
        TextField(
          controller: controller,
          style: text.mediumTextStyle(fontSize: 14.5, color: AppColors.ink),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 13.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.line),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.coral, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
