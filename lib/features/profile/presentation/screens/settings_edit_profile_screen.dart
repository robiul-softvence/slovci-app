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

  static const _genders = ['Female', 'Male', 'Other'];
  static const _goals = ['Lose Weight', 'Build Muscle', 'Stay Fit'];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Edit Profile',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Save Changes',
          onPressed: () {
            Get.back();
            AppHelperFunctions.showSnackBar('Profile changes saved!');
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
                      'Change photo',
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
        const SettingsSectionLabel('ABOUT YOU'),
        Row(
          children: [
            Expanded(
              child: _LabeledInput(
                label: 'First name',
                controller: controller.firstNameController,
              ),
            ),
            Gap.h(12),
            Expanded(
              child: _LabeledInput(
                label: 'Last name',
                controller: controller.lastNameController,
              ),
            ),
          ],
        ),
        Gap(12),
        _LabeledInput(
          label: 'Date of birth',
          controller: controller.dobController,
        ),
        Gap(12),
        Text(
          'Gender',
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
              children: List.generate(_genders.length, (i) {
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
                        _genders[i],
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
        const SettingsSectionLabel('BODY'),
        Row(
          children: [
            Expanded(
              child: _LabeledInput(
                label: 'Height',
                controller: controller.heightController,
              ),
            ),
            Gap.h(12),
            Expanded(
              child: _LabeledInput(
                label: 'Current weight',
                controller: controller.weightController,
              ),
            ),
          ],
        ),
        Gap(12),
        _LabeledInput(
          label: 'Target weight',
          controller: controller.targetWeightController,
        ),
        Gap(22),
        const SettingsSectionLabel('GOAL'),
        Obx(
          () => Wrap(
            spacing: 8.w,
            children: List.generate(_goals.length, (i) {
              return OnboardingTagChip(
                label: _goals[i],
                selected: controller.editGoalIndex.value == i,
                unselectedBg: AppColors.white,
                onTap: () => controller.editGoalIndex.value = i,
              );
            }),
          ),
        ),
        Gap(16),
        const OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text:
              "Changing your goal or body data regenerates next week's plan. This week stays as it is.",
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
