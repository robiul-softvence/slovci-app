import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/profile_dialogs.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19f · Settings — Account & Security".
class SettingsAccountSecurityScreen extends GetView<ProfileController> {
  const SettingsAccountSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.account_security.title'.tr,
      children: [
        SettingsSectionLabel('profile.account_security.section_sign_in'.tr),
        SettingsCardGroup(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'profile.account_security.sign_in_apple'.tr,
                          style: text.boldTextStyle(
                            fontSize: 14.5,
                            color: AppColors.ink,
                          ),
                        ),
                        Gap(2),
                        Text(
                          'profile.account_security.apple_status'.tr,
                          style: text.regularTextStyle(
                            fontSize: 12,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mintLight,
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                    child: Text(
                      'profile.account_security.connected'.tr,
                      style: text.boldTextStyle(
                        fontSize: 12,
                        color: AppColors.emerald,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SettingsNavRow(
              iconPath: IconPath.mail,
              title: 'profile.account_security.email'.tr,
              subtitle: 'solene.martin@example.com',
              trailing: Text(
                'profile.account_security.change'.tr,
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
              onTap: () => AppHelperFunctions.showSnackBar(
                'profile.account_security.email_link_sent'.tr,
              ),
            ),
            SettingsNavRow(
              iconPath: IconPath.lock,
              title: 'profile.account_security.password'.tr,
              subtitle: 'profile.account_security.password_subtitle'.tr,
              trailing: Text(
                'profile.account_security.set'.tr,
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
              onTap: () => AppHelperFunctions.showSnackBar(
                'profile.account_security.set_password_opened'.tr,
              ),
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel('profile.account_security.section_security'.tr),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwShield,
                title: 'profile.account_security.two_step'.tr,
                subtitle: 'profile.account_security.two_step_subtitle'.tr,
                value: controller.twoStepEnabled.value,
                onChanged: (v) => controller.twoStepEnabled.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        SettingsSectionLabel(
          'profile.account_security.section_active_sessions'.tr,
        ),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.prPhone,
              title: 'profile.account_security.this_device'.tr,
              subtitle: 'profile.account_security.this_device_subtitle'.tr,
              trailing: SizedBox.shrink(),
            ),
            SettingsNavRow(
              iconPath: IconPath.prTablet,
              title: 'iPad Air',
              subtitle: 'profile.account_security.ipad_subtitle'.tr,
              trailing: Text(
                'profile.account_security.sign_out'.tr,
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
              onTap: () => AppHelperFunctions.showSnackBar(
                'profile.account_security.signed_out_ipad'.tr,
              ),
            ),
          ],
        ),
        Gap(16),
        Center(
          child: GestureDetector(
            onTap: () => AppHelperFunctions.showSnackBar(
              'profile.account_security.signed_out_all'.tr,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Text(
                'profile.account_security.sign_out_all'.tr,
                style: text.semiBoldTextStyle(
                  fontSize: 14,
                  color: AppColors.cta,
                ),
              ),
            ),
          ),
        ),
        Gap(16),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.prTrash,
              title: 'profile.account_security.delete_account'.tr,
              subtitle: 'profile.account_security.delete_account_subtitle'.tr,
              isDanger: true,
              onTap: () => DeleteAccountConfirmSheet.show(context),
            ),
          ],
        ),
      ],
    );
  }
}
