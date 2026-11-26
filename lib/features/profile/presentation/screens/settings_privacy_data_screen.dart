import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/profile_dialogs.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19m · Settings — Privacy & Data".
class SettingsPrivacyDataScreen extends GetView<ProfileController> {
  const SettingsPrivacyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Privacy & Data',
      children: [
        const SettingsSectionLabel('HEALTH DATA'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwShield,
                title: 'Health data consent',
                subtitle: 'Granted Nov 16, 2026 · injuries, weight, sleep',
                value: controller.healthConsent.value,
                onChanged: (v) => controller.healthConsent.value = v,
              ),
            ),
          ],
        ),
        Gap(12),
        const OnboardingInfoBanner(
          backgroundColor: AppColors.amberSoft,
          textColor: AppColors.ink,
          text:
              'Turning this off pauses personalization: your plan stops adapting to injuries and weight.',
        ),
        Gap(22),
        const SettingsSectionLabel('USAGE'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwChart,
                title: 'Product analytics',
                subtitle: 'Anonymous usage to improve MILON',
                value: controller.productAnalytics.value,
                onChanged: (v) => controller.productAnalytics.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.prTag,
                title: 'Personalized offers',
                subtitle: 'Promotions based on your activity',
                value: controller.personalizedOffers.value,
                onChanged: (v) => controller.personalizedOffers.value = v,
              ),
            ),
            SettingsNavRow(
              iconPath: IconPath.pcChat,
              title: 'MILON Coach chat history',
              subtitle: 'Kept for 90 days',
              onTap: () => AppHelperFunctions.showSnackBar(
                'Chat history retention: 90 days.',
              ),
            ),
          ],
        ),
        Gap(22),
        const SettingsSectionLabel('YOUR DATA'),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.prDownload,
              title: 'Download my data',
              subtitle: 'Get a copy of everything (JSON + PDF). Ready within 48 h.',
              trailing: Material(
                color: AppColors.ink,
                borderRadius: BorderRadius.circular(11.r),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => AppHelperFunctions.showSnackBar(
                    'Data export requested! Ready within 48h.',
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      'Request',
                      style: text.semiBoldTextStyle(
                        fontSize: 13,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
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
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: controller.openPrivacyPolicy,
              child: Text(
                'Privacy Policy',
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
            ),
            Gap.h(20),
            GestureDetector(
              onTap: controller.openPrivacyPolicy,
              child: Text(
                'Terms of Use',
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
