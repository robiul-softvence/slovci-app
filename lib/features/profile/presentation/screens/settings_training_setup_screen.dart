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

/// Figma "19g · Settings — Training Setup".
class SettingsTrainingSetupScreen extends GetView<ProfileController> {
  const SettingsTrainingSetupScreen({super.key});

  static const _equipList = [
    'Bodyweight',
    'Dumbbells',
    'Kettlebells',
    'Resistance Bands',
    'Pull-up Bar',
    'Bench',
  ];
  static const _equipLabelKeys = {
    'Bodyweight': 'profile.training_setup.equip_bodyweight',
    'Dumbbells': 'profile.training_setup.equip_dumbbells',
    'Kettlebells': 'profile.training_setup.equip_kettlebells',
    'Resistance Bands': 'profile.training_setup.equip_resistance_bands',
    'Pull-up Bar': 'profile.training_setup.equip_pull_up_bar',
    'Bench': 'profile.training_setup.equip_bench',
  };
  static const _dayKeys = [
    'profile.training_setup.day_mon',
    'profile.training_setup.day_tue',
    'profile.training_setup.day_wed',
    'profile.training_setup.day_thu',
    'profile.training_setup.day_fri',
    'profile.training_setup.day_sat',
    'profile.training_setup.day_sun',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.training_setup.title'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'profile.training_setup.save_update'.tr,
          onPressed: () {
            Get.back();
            AppHelperFunctions.showSnackBar('profile.training_setup.saved'.tr);
          },
        ),
      ),
      children: [
        SettingsSectionLabel('profile.training_setup.section_where'.tr),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: _EnvTile(
                  iconPath: IconPath.obBuilding,
                  label: 'profile.training_setup.env_gym'.tr,
                  selected: controller.trainEnvIdx.value == 0,
                  onTap: () => controller.trainEnvIdx.value = 0,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _EnvTile(
                  iconPath: IconPath.obHome,
                  label: 'profile.training_setup.env_home'.tr,
                  selected: controller.trainEnvIdx.value == 1,
                  onTap: () => controller.trainEnvIdx.value = 1,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _EnvTile(
                  iconPath: IconPath.obRefresh,
                  label: 'profile.training_setup.env_hybrid'.tr,
                  selected: controller.trainEnvIdx.value == 2,
                  onTap: () => controller.trainEnvIdx.value = 2,
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.training_setup.section_equipment'.tr),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: _equipList.map((eq) {
              return OnboardingTagChip(
                label: _equipLabelKeys[eq]!.tr,
                selected: controller.trainEquipment.contains(eq),
                unselectedBg: AppColors.white,
                onTap: () => controller.toggleEquipment(eq),
              );
            }).toList(),
          ),
        ),
        Gap(14),
        Text(
          'profile.training_setup.dumbbell_weights'.tr,
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(6),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Text(
            'profile.training_setup.dumbbell_weights_value'.tr,
            style: text.mediumTextStyle(fontSize: 14.5, color: AppColors.ink),
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.training_setup.section_schedule'.tr),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (i) {
              final selected = controller.trainDays.contains(i);
              return GestureDetector(
                onTap: () => controller.toggleTrainDay(i),
                child: Container(
                  width: 42.r,
                  height: 42.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.ink : AppColors.white,
                    border: selected ? null : Border.all(color: AppColors.line),
                  ),
                  child: Text(
                    _dayKeys[i].tr,
                    style: text.boldTextStyle(
                      fontSize: 13.5,
                      color: selected ? AppColors.white : AppColors.muted,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Gap(14),
        Row(
          children: [
            Expanded(
              child: _ReadOnlyBox(
                label: 'profile.training_setup.session_length'.tr,
                value: 'profile.training_setup.session_length_value'.tr,
              ),
            ),
            Gap.h(12),
            Expanded(
              child: _ReadOnlyBox(
                label: 'profile.training_setup.preferred_time'.tr,
                value: 'profile.training_setup.preferred_time_value'.tr,
              ),
            ),
          ],
        ),
        Gap(22),
        SettingsSectionLabel('profile.training_setup.section_options'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                title: 'profile.training_setup.cardio_finisher'.tr,
                subtitle: 'profile.training_setup.cardio_finisher_subtitle'.tr,
                value: controller.cardioFinisher.value,
                onChanged: (v) => controller.cardioFinisher.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                title: 'profile.training_setup.warm_up'.tr,
                subtitle: 'profile.training_setup.warm_up_subtitle'.tr,
                value: controller.warmUpEnabled.value,
                onChanged: (v) => controller.warmUpEnabled.value = v,
              ),
            ),
          ],
        ),
        Gap(16),
        OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text: 'profile.training_setup.changes_info'.tr,
        ),
      ],
    );
  }
}

class _EnvTile extends StatelessWidget {
  const _EnvTile({
    required this.iconPath,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22.r,
              height: 22.r,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.cta : AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
            Gap(8),
            Text(
              label,
              style: AppTextStyle(
                context,
              ).boldTextStyle(fontSize: 14, color: AppColors.ink),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadOnlyBox extends StatelessWidget {
  const _ReadOnlyBox({required this.label, required this.value});

  final String label;
  final String value;

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
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Text(
            value,
            style: text.mediumTextStyle(fontSize: 14, color: AppColors.ink),
          ),
        ),
      ],
    );
  }
}
