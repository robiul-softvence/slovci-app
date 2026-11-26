import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19j · Settings — Notifications".
class SettingsNotificationsScreen extends GetView<ProfileController> {
  const SettingsNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: 'Notifications',
      children: [
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                title: 'Allow notifications',
                subtitle: 'You can change this anytime',
                value: controller.allowNotifications.value,
                onChanged: (v) => controller.allowNotifications.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('WORKOUTS'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwDumbbell,
                title: 'Session reminders',
                subtitle: 'Mon, Wed, Fri, Sat · 7:00 AM',
                value: controller.sessionReminders.value,
                onChanged: (v) => controller.sessionReminders.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcMoon,
                title: 'Rest-day tips',
                subtitle: 'Mobility and recovery ideas',
                value: controller.restDayTips.value,
                onChanged: (v) => controller.restDayTips.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('NUTRITION'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwFood,
                title: 'Meal reminders',
                subtitle: 'Lunch 12:15 PM · Dinner 7:00 PM',
                value: controller.mealReminders.value,
                onChanged: (v) => controller.mealReminders.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcDrop,
                title: 'Water nudges',
                subtitle: 'Every 2 hours, 9 AM – 8 PM',
                value: controller.waterNudges.value,
                onChanged: (v) => controller.waterNudges.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('PROGRESS'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.nutCal,
                title: 'Weekly check-in',
                subtitle: 'Sunday · 6:00 PM',
                value: controller.weeklyCheckinNotif.value,
                onChanged: (v) => controller.weeklyCheckinNotif.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwTrophy,
                title: 'Achievements & records',
                subtitle: 'New PRs and streaks',
                value: controller.achievementsNotif.value,
                onChanged: (v) => controller.achievementsNotif.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('COACH & NEWS'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcChat,
                title: 'MILON Coach messages',
                subtitle: 'Plan updates and replies',
                value: controller.coachMessagesNotif.value,
                onChanged: (v) => controller.coachMessagesNotif.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.prTag,
                title: 'Offers & news',
                subtitle: 'Promotions and new features',
                value: controller.offersNewsNotif.value,
                onChanged: (v) => controller.offersNewsNotif.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('QUIET HOURS'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcMoon,
                title: 'Do not disturb',
                subtitle: '10:00 PM – 7:00 AM',
                value: controller.quietHoursEnabled.value,
                onChanged: (v) => controller.quietHoursEnabled.value = v,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
