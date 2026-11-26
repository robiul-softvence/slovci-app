import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

/// Figma "19h · Settings — Injuries & Sensitive Areas".
class SettingsInjuriesScreen extends GetView<ProfileController> {
  const SettingsInjuriesScreen({super.key});

  static const _avoidedKeys = [
    'profile.injuries.avoided_push_ups',
    'profile.injuries.avoided_burpees',
    'profile.injuries.avoided_high_plank',
  ];
  static const _insteadKeys = [
    'profile.injuries.instead_forearm_plank',
    'profile.injuries.instead_db_press',
    'profile.injuries.instead_machine_press',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.injuries.title'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'profile.injuries.add_area'.tr,
          onPressed: () => Get.toNamed(AppRoute.onboardingInjuryBodyMapScreen),
        ),
      ),
      children: [
        SettingsSectionLabel('profile.injuries.section_active'.tr),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                      color: AppColors.peach,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.hwShield,
                        width: 22.r,
                        height: 22.r,
                      ),
                    ),
                  ),
                  Gap.h(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'profile.injuries.wrists_hands'.tr,
                          style: text.boldTextStyle(
                            fontSize: 17,
                            color: AppColors.ink,
                          ),
                        ),
                        Text(
                          'profile.injuries.wrists_hands_subtitle'.tr,
                          style: text.regularTextStyle(
                            fontSize: 12,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 36.r,
                    height: 36.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.pearl,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.nutEdit,
                        width: 16.r,
                        height: 16.r,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'profile.injuries.avoided'.tr,
                          style: text.boldTextStyle(
                            fontSize: 10.5,
                            letterSpacing: 0.6,
                            color: AppColors.cta,
                          ),
                        ),
                        Gap(8),
                        ..._avoidedKeys.map(
                          (item) => Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Row(
                              children: [
                                Container(
                                  width: 18.r,
                                  height: 18.r,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.coralSoft,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconPath.obCloseSmall,
                                      width: 9.r,
                                      height: 9.r,
                                    ),
                                  ),
                                ),
                                Gap.h(7),
                                Expanded(
                                  child: Text(
                                    item.tr,
                                    style: text.regularTextStyle(
                                      fontSize: 12.5,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap.h(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'profile.injuries.instead'.tr,
                          style: text.boldTextStyle(
                            fontSize: 10.5,
                            letterSpacing: 0.6,
                            color: AppColors.emerald,
                          ),
                        ),
                        Gap(8),
                        ..._insteadKeys.map(
                          (item) => Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Row(
                              children: [
                                Container(
                                  width: 18.r,
                                  height: 18.r,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.mintLight,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconPath.hwCheck,
                                      width: 10.r,
                                      height: 10.r,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.emerald,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                                Gap.h(7),
                                Expanded(
                                  child: Text(
                                    item.tr,
                                    style: text.regularTextStyle(
                                      fontSize: 12.5,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => AppHelperFunctions.showSnackBar(
                        'profile.injuries.marked_healed'.tr,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.line),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 11.h),
                      ),
                      child: Text(
                        'profile.injuries.mark_healed'.tr,
                        style: text.semiBoldTextStyle(
                          fontSize: 13,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                  ),
                  Gap.h(10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.toNamed(AppRoute.onboardingInjuryBodyMapScreen),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.pearl,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 11.h),
                      ),
                      child: Text(
                        'profile.injuries.update_severity'.tr,
                        style: text.semiBoldTextStyle(
                          fontSize: 13,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(14),
        OnboardingInfoBanner(
          backgroundColor: AppColors.peach,
          textColor: AppColors.ink,
          text: 'profile.injuries.excluded_info'.tr,
        ),
        Gap(22),
        SettingsSectionLabel('profile.injuries.section_history'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.pcHeart,
              title: 'profile.injuries.knees'.tr,
              subtitle: 'profile.injuries.knees_subtitle'.tr,
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.mintLight,
                  borderRadius: BorderRadius.circular(99.r),
                ),
                child: Text(
                  'profile.injuries.healed'.tr,
                  style: text.boldTextStyle(
                    fontSize: 12,
                    color: AppColors.emerald,
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(14),
        OnboardingInfoBanner(
          backgroundColor: AppColors.amberSoft,
          textColor: AppColors.ink,
          text: 'profile.injuries.medical_disclaimer'.tr,
        ),
      ],
    );
  }
}
