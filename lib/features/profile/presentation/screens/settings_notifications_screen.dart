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
      title: 'profile.notifications.title'.tr,
      children: [
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                title: 'profile.notifications.allow'.tr,
                subtitle: 'profile.notifications.allow_subtitle'.tr,
                value: controller.allowNotifications.value,
                onChanged: (v) => controller.allowNotifications.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.notifications.section_workouts'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwDumbbell,
                title: 'profile.notifications.session_reminders'.tr,
                subtitle: 'profile.notifications.session_reminders_subtitle'.tr,
                value: controller.sessionReminders.value,
                onChanged: (v) => controller.sessionReminders.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcMoon,
                title: 'profile.notifications.rest_day_tips'.tr,
                subtitle: 'profile.notifications.rest_day_tips_subtitle'.tr,
                value: controller.restDayTips.value,
                onChanged: (v) => controller.restDayTips.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.notifications.section_nutrition'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwFood,
                title: 'profile.notifications.meal_reminders'.tr,
                subtitle: 'profile.notifications.meal_reminders_subtitle'.tr,
                value: controller.mealReminders.value,
                onChanged: (v) => controller.mealReminders.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcDrop,
                title: 'profile.notifications.water_nudges'.tr,
                subtitle: 'profile.notifications.water_nudges_subtitle'.tr,
                value: controller.waterNudges.value,
                onChanged: (v) => controller.waterNudges.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.notifications.section_progress'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.nutCal,
                title: 'profile.notifications.weekly_checkin'.tr,
                subtitle: 'profile.notifications.weekly_checkin_subtitle'.tr,
                value: controller.weeklyCheckinNotif.value,
                onChanged: (v) => controller.weeklyCheckinNotif.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwTrophy,
                title: 'profile.notifications.achievements'.tr,
                subtitle: 'profile.notifications.achievements_subtitle'.tr,
                value: controller.achievementsNotif.value,
                onChanged: (v) => controller.achievementsNotif.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.notifications.section_coach_news'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcChat,
                title: 'profile.notifications.coach_messages'.tr,
                subtitle: 'profile.notifications.coach_messages_subtitle'.tr,
                value: controller.coachMessagesNotif.value,
                onChanged: (v) => controller.coachMessagesNotif.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.prTag,
                title: 'profile.notifications.offers_news'.tr,
                subtitle: 'profile.notifications.offers_news_subtitle'.tr,
                value: controller.offersNewsNotif.value,
                onChanged: (v) => controller.offersNewsNotif.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.notifications.section_quiet_hours'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcMoon,
                title: 'profile.notifications.do_not_disturb'.tr,
                subtitle: 'profile.notifications.do_not_disturb_subtitle'.tr,
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
