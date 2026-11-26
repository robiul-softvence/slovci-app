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
      title: 'Units & Language',
      children: [
        const SettingsSectionLabel('LANGUAGE'),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'English',
            rightLabel: 'Français',
            leftSelected: controller.appLanguage.value == 'EN',
            onSelect: (isEn) =>
                controller.appLanguage.value = isEn ? 'EN' : 'FR',
          ),
        ),
        Gap(8),
        Text(
          "Changes the app, recipes and your MILON Coach's language.",
          style: text.regularTextStyle(fontSize: 12, color: AppColors.muted),
        ),
        Gap(22),
        const SettingsSectionLabel('WEIGHT'),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'kg',
            rightLabel: 'lb',
            leftSelected: controller.weightInKg.value,
            onSelect: (v) => controller.weightInKg.value = v,
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('HEIGHT & MEASUREMENTS'),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'cm',
            rightLabel: 'ft / in',
            leftSelected: controller.heightInCm.value,
            onSelect: (v) => controller.heightInCm.value = v,
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('ENERGY'),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'kcal',
            rightLabel: 'kJ',
            leftSelected: controller.energyInKcal.value,
            onSelect: (v) => controller.energyInKcal.value = v,
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('DISTANCE'),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'km',
            rightLabel: 'mi',
            leftSelected: controller.distanceInKm.value,
            onSelect: (v) => controller.distanceInKm.value = v,
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('WEEK STARTS ON'),
        Obx(
          () => SettingsBinaryToggle(
            leftLabel: 'Monday',
            rightLabel: 'Sunday',
            leftSelected: controller.weekStartsMonday.value,
            onSelect: (v) => controller.weekStartsMonday.value = v,
          ),
        ),
      ],
    );
  }
}
