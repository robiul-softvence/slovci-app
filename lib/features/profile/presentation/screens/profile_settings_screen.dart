import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/profile_dialogs.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19b · Profile — Settings & Account".
class ProfileSettingsScreen extends GetView<ProfileController> {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.settings.title'.tr,
      backgroundColor: AppColors.white,
      children: [
        SettingsSectionLabel('profile.settings.section_account'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.mail,
              title: 'profile.settings.email'.tr,
              subtitle: 'solene.martin@example.com',
              onTap: controller.openAccountSecurity,
            ),
            SettingsNavRow(
              iconPath: IconPath.prCard,
              title: 'profile.settings.subscription'.tr,
              subtitle: 'profile.settings.subscription_subtitle'.tr,
              onTap: controller.openSubscription,
            ),
            SettingsNavRow(
              iconPath: IconPath.prTag,
              title: 'profile.settings.promo_code'.tr,
              subtitle: 'profile.settings.promo_code_subtitle'.tr,
              onTap: controller.openPaywall,
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.settings.section_preferences'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.pcRuler,
              title: 'profile.settings.units'.tr,
              subtitle: 'kg · cm',
              onTap: controller.openUnitsLanguage,
            ),
            SettingsNavRow(
              iconPath: IconPath.prGlobe,
              title: 'profile.settings.language'.tr,
              subtitle: 'profile.settings.language_subtitle'.tr,
              onTap: controller.openUnitsLanguage,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwBell,
              title: 'profile.settings.notifications'.tr,
              subtitle: 'profile.settings.notifications_subtitle'.tr,
              onTap: controller.openNotifications,
            ),
            SettingsNavRow(
              iconPath: IconPath.prActivity,
              title: 'profile.settings.connected_apps'.tr,
              subtitle: 'profile.settings.connected_apps_subtitle'.tr,
              onTap: controller.openConnectedApps,
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.settings.section_privacy_data'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.hwShield,
              title: 'profile.settings.health_consent'.tr,
              subtitle: 'profile.settings.health_consent_subtitle'.tr,
              onTap: controller.openPrivacyData,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwLock,
              title: 'profile.settings.privacy_settings'.tr,
              subtitle: 'profile.settings.privacy_settings_subtitle'.tr,
              onTap: controller.openPrivacyData,
            ),
            SettingsNavRow(
              iconPath: IconPath.prDownload,
              title: 'profile.settings.download_data'.tr,
              subtitle: 'profile.settings.download_data_subtitle'.tr,
              onTap: controller.openPrivacyData,
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.settings.section_help_legal'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.pcChat,
              title: 'profile.settings.contact_us'.tr,
              subtitle: 'profile.settings.contact_us_subtitle'.tr,
              onTap: controller.openHelpSupport,
            ),
            SettingsNavRow(
              iconPath: IconPath.nutAlert,
              title: 'profile.settings.report_problem'.tr,
              onTap: controller.openHelpSupport,
            ),
            SettingsNavRow(
              iconPath: IconPath.prFile,
              title: 'profile.settings.privacy_policy'.tr,
              onTap: controller.openPrivacyPolicy,
            ),
            SettingsNavRow(
              iconPath: IconPath.prFile,
              title: 'profile.settings.terms_of_use'.tr,
              onTap: controller.openPrivacyPolicy,
            ),
            SettingsNavRow(
              iconPath: IconPath.prFile,
              title: 'profile.settings.terms_of_sale'.tr,
              onTap: controller.openPrivacyPolicy,
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.settings.section_session'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.prLogout,
              title: 'profile.settings.log_out'.tr,
              trailing: const SizedBox.shrink(),
              onTap: () => LogOutConfirmDialog.show(context),
            ),
            SettingsNavRow(
              iconPath: IconPath.prTrash,
              title: 'profile.settings.delete_account'.tr,
              subtitle: 'profile.settings.delete_account_subtitle'.tr,
              isDanger: true,
              onTap: () => DeleteAccountConfirmSheet.show(context),
            ),
          ],
        ),
        Gap(18),
        Center(
          child: Text(
            'profile.settings.version'.tr,
            style: text.regularTextStyle(fontSize: 12, color: AppColors.subtle),
          ),
        ),
      ],
    );
  }
}
