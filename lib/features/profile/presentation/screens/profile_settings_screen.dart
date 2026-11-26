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
      title: 'Settings',
      backgroundColor: AppColors.white,
      children: [
        const SettingsSectionLabel('ACCOUNT'),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.mail,
              title: 'Email',
              subtitle: 'solene.martin@example.com',
              onTap: controller.openAccountSecurity,
            ),
            SettingsNavRow(
              iconPath: IconPath.prCard,
              title: 'Subscription',
              subtitle: 'MILON Pro · Annual · renews Sep 12, 2027',
              onTap: controller.openSubscription,
            ),
            SettingsNavRow(
              iconPath: IconPath.prTag,
              title: 'Promo code',
              subtitle: 'Add a code',
              onTap: controller.openPaywall,
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('PREFERENCES'),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.pcRuler,
              title: 'Units',
              subtitle: 'kg · cm',
              onTap: controller.openUnitsLanguage,
            ),
            SettingsNavRow(
              iconPath: IconPath.prGlobe,
              title: 'Language',
              subtitle: 'English',
              onTap: controller.openUnitsLanguage,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwBell,
              title: 'Notifications',
              subtitle: 'Workouts, meals, weekly check-in',
              onTap: controller.openNotifications,
            ),
            SettingsNavRow(
              iconPath: IconPath.prActivity,
              title: 'Connected apps',
              subtitle: 'Apple Health · Connected',
              onTap: controller.openConnectedApps,
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('PRIVACY & DATA'),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.hwShield,
              title: 'Health data consent',
              subtitle: 'Granted Nov 16, 2026 · manage',
              onTap: controller.openPrivacyData,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwLock,
              title: 'Privacy settings',
              subtitle: 'Profile visibility, analytics',
              onTap: controller.openPrivacyData,
            ),
            SettingsNavRow(
              iconPath: IconPath.prDownload,
              title: 'Download my data',
              subtitle: 'Export everything as a file',
              onTap: controller.openPrivacyData,
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('HELP & LEGAL'),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.pcChat,
              title: 'Contact us',
              subtitle: 'Reply within 24 h',
              onTap: controller.openHelpSupport,
            ),
            SettingsNavRow(
              iconPath: IconPath.nutAlert,
              title: 'Report a problem',
              onTap: controller.openHelpSupport,
            ),
            SettingsNavRow(
              iconPath: IconPath.prFile,
              title: 'Privacy Policy',
              onTap: controller.openPrivacyPolicy,
            ),
            SettingsNavRow(
              iconPath: IconPath.prFile,
              title: 'Terms of Use',
              onTap: controller.openPrivacyPolicy,
            ),
            SettingsNavRow(
              iconPath: IconPath.prFile,
              title: 'Terms of Sale',
              onTap: controller.openPrivacyPolicy,
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('SESSION'),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.prLogout,
              title: 'Log out',
              trailing: const SizedBox.shrink(),
              onTap: () => LogOutConfirmDialog.show(context),
            ),
            SettingsNavRow(
              iconPath: IconPath.prTrash,
              title: 'Delete my account',
              subtitle: 'Permanently erase your data',
              isDanger: true,
              onTap: () => DeleteAccountConfirmSheet.show(context),
            ),
          ],
        ),
        Gap(18),
        Center(
          child: Text(
            'MILON · Version 1.0.0 (1)',
            style: text.regularTextStyle(fontSize: 12, color: AppColors.subtle),
          ),
        ),
      ],
    );
  }
}
