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
      title: 'Account & Security',
      children: [
        const SettingsSectionLabel('SIGN-IN'),
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
                          'Sign in with Apple',
                          style: text.boldTextStyle(
                            fontSize: 14.5,
                            color: AppColors.ink,
                          ),
                        ),
                        Gap(2),
                        Text(
                          'Connected · Hide My Email off',
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
                      'Connected',
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
              title: 'Email',
              subtitle: 'solene.martin@example.com',
              trailing: Text(
                'Change',
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
              onTap: () => AppHelperFunctions.showSnackBar(
                'Email change link sent.',
              ),
            ),
            SettingsNavRow(
              iconPath: IconPath.lock,
              title: 'Password',
              subtitle: 'Not set. You sign in with Apple',
              trailing: Text(
                'Set',
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
              onTap: () => AppHelperFunctions.showSnackBar(
                'Set password flow opened.',
              ),
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('SECURITY'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwShield,
                title: 'Two-step verification',
                subtitle: 'Extra code when signing in on a new device',
                value: controller.twoStepEnabled.value,
                onChanged: (v) => controller.twoStepEnabled.value = v,
              ),
            ),
          ],
        ),
        Gap(20),
        const SettingsSectionLabel('ACTIVE SESSIONS'),
        SettingsCardGroup(
          children: [
            const SettingsNavRow(
              iconPath: IconPath.prPhone,
              title: 'iPhone 16 · This device',
              subtitle: 'Paris, France · active now',
              trailing: SizedBox.shrink(),
            ),
            SettingsNavRow(
              iconPath: IconPath.prTablet,
              title: 'iPad Air',
              subtitle: 'Paris, France · 3 days ago',
              trailing: Text(
                'Sign out',
                style: text.semiBoldTextStyle(
                  fontSize: 13.5,
                  color: AppColors.cta,
                ),
              ),
              onTap: () => AppHelperFunctions.showSnackBar(
                'Signed out of iPad Air.',
              ),
            ),
          ],
        ),
        Gap(16),
        Center(
          child: GestureDetector(
            onTap: () => AppHelperFunctions.showSnackBar(
              'Signed out of all other devices.',
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Text(
                'Sign out of all other devices',
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
              title: 'Delete my account',
              subtitle: 'Permanently erase your data',
              isDanger: true,
              onTap: () => DeleteAccountConfirmSheet.show(context),
            ),
          ],
        ),
      ],
    );
  }
}
