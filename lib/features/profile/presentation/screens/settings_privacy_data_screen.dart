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
      title: 'profile.privacy_data.title'.tr,
      children: [
        SettingsSectionLabel('profile.privacy_data.section_health_data'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwShield,
                title: 'profile.privacy_data.health_consent'.tr,
                subtitle: 'profile.privacy_data.health_consent_subtitle'.tr,
                value: controller.healthConsent.value,
                onChanged: (v) => controller.healthConsent.value = v,
              ),
            ),
          ],
        ),
        Gap(12),
        OnboardingInfoBanner(
          backgroundColor: AppColors.amberSoft,
          textColor: AppColors.ink,
          text: 'profile.privacy_data.consent_off_info'.tr,
        ),
        Gap(22),
        SettingsSectionLabel('profile.privacy_data.section_usage'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwChart,
                title: 'profile.privacy_data.product_analytics'.tr,
                subtitle: 'profile.privacy_data.product_analytics_subtitle'.tr,
                value: controller.productAnalytics.value,
                onChanged: (v) => controller.productAnalytics.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.prTag,
                title: 'profile.privacy_data.personalized_offers'.tr,
                subtitle:
                    'profile.privacy_data.personalized_offers_subtitle'.tr,
                value: controller.personalizedOffers.value,
                onChanged: (v) => controller.personalizedOffers.value = v,
              ),
            ),
            SettingsNavRow(
              iconPath: IconPath.pcChat,
              title: 'profile.privacy_data.chat_history'.tr,
              subtitle: 'profile.privacy_data.chat_history_subtitle'.tr,
              onTap: () => AppHelperFunctions.showSnackBar(
                'profile.privacy_data.chat_history_retention'.tr,
              ),
            ),
          ],
        ),
        Gap(22),
        SettingsSectionLabel('profile.privacy_data.section_your_data'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.prDownload,
              title: 'profile.privacy_data.download_data'.tr,
              subtitle: 'profile.privacy_data.download_data_subtitle'.tr,
              trailing: Material(
                color: AppColors.ink,
                borderRadius: BorderRadius.circular(11.r),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => AppHelperFunctions.showSnackBar(
                    'profile.privacy_data.export_requested'.tr,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      'profile.privacy_data.request'.tr,
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
              title: 'profile.privacy_data.delete_account'.tr,
              subtitle: 'profile.privacy_data.delete_account_subtitle'.tr,
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
                'profile.privacy_data.privacy_policy'.tr,
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
                'profile.privacy_data.terms_of_use'.tr,
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
