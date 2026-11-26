import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19n · Settings — Units & Language".
class SettingsUnitsLanguageScreen extends GetView<ProfileController> {
  const SettingsUnitsLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.units_language.title'.tr,
      children: [
        SettingsSectionLabel('profile.units_language.section_language'.tr),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'English',
            rightLabel: 'Français',
            leftSelected: controller.appLanguage.value == AppLanguage.en,
            onSelect: (isEn) =>
                controller.setLanguage(isEn ? AppLanguage.en : AppLanguage.fr),
          ),
        ),
        Gap(8),
        Text(
          'profile.units_language.language_info'.tr,
          style: text.regularTextStyle(fontSize: 12, color: AppColors.muted),
        ),
        Gap(22),
        SettingsSectionLabel('profile.units_language.section_weight'.tr),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'kg',
            rightLabel: 'lb',
            leftSelected: controller.weightInKg.value,
            onSelect: (v) => controller.weightInKg.value = v,
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.units_language.section_height'.tr),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'cm',
            rightLabel: 'ft / in',
            leftSelected: controller.heightInCm.value,
            onSelect: (v) => controller.heightInCm.value = v,
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.units_language.section_energy'.tr),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'kcal',
            rightLabel: 'kJ',
            leftSelected: controller.energyInKcal.value,
            onSelect: (v) => controller.energyInKcal.value = v,
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.units_language.section_distance'.tr),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'km',
            rightLabel: 'mi',
            leftSelected: controller.distanceInKm.value,
            onSelect: (v) => controller.distanceInKm.value = v,
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.units_language.section_week_start'.tr),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'profile.units_language.monday'.tr,
            rightLabel: 'profile.units_language.sunday'.tr,
            leftSelected: controller.weekStartsMonday.value,
            onSelect: (v) => controller.weekStartsMonday.value = v,
          ),
        ),
      ],
    );
  }
}
