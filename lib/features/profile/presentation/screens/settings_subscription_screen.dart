import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19k · Settings — Subscription".
class SettingsSubscriptionScreen extends GetView<ProfileController> {
  const SettingsSubscriptionScreen({super.key});

  static const _includedKeys = [
    'profile.subscription.included_unlimited_plans',
    'profile.subscription.included_injury_adaptive',
    'profile.subscription.included_grocery_lists',
    'profile.subscription.included_coach',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.subscription.title'.tr,
      children: [
        // Dark Current Plan card
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
            color: AppColors.ink,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'profile.subscription.current_plan'.tr,
                    style: text.boldTextStyle(
                      fontSize: 11,
                      letterSpacing: 0.7,
                      color: AppColors.white.withValues(alpha: 0.72),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lime,
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                    child: Text(
                      'profile.subscription.active'.tr,
                      style: text.boldTextStyle(
                        fontSize: 11.5,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(10),
              Text(
                'profile.subscription.plan_name'.tr,
                style: text.boldTextStyle(fontSize: 22, color: AppColors.white),
              ),
              Gap(6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'profile.subscription.price'.tr,
                    style: text.boldTextStyle(
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                  Gap.h(6),
                  Text(
                    'profile.subscription.per_year'.tr,
                    style: text.regularTextStyle(
                      fontSize: 14,
                      color: AppColors.white.withValues(alpha: 0.72),
                    ),
                  ),
                ],
              ),
              Gap(10),
              Text(
                'profile.subscription.renews'.tr,
                style: text.regularTextStyle(
                  fontSize: 12.5,
                  color: AppColors.white.withValues(alpha: 0.75),
                ),
              ),
              Gap(4),
              Text(
                'profile.subscription.referral_days'.tr,
                style: text.mediumTextStyle(
                  fontSize: 12.5,
                  color: AppColors.lime,
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.subscription.section_included'.tr),
        SettingsCardGroup(
          children: _includedKeys
              .map(
                (item) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.h),
                  child: Row(
                    children: [
                      Container(
                        width: 22.r,
                        height: 22.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mintLight,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.hwCheck,
                            width: 12.r,
                            height: 12.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.emerald,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Gap.h(12),
                      Expanded(
                        child: Text(
                          item.tr,
                          style: text.regularTextStyle(
                            fontSize: 14,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        Gap(22),
        SettingsSectionLabel('profile.subscription.section_manage'.tr),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.nutRefresh,
              title: 'profile.subscription.change_plan'.tr,
              subtitle: 'profile.subscription.change_plan_subtitle'.tr,
              onTap: controller.openPaywall,
            ),
            SettingsNavRow(
              iconPath: IconPath.prStore,
              title: 'profile.subscription.manage_app_store'.tr,
              subtitle: 'profile.subscription.manage_app_store_subtitle'.tr,
              onTap: () => AppHelperFunctions.showSnackBar(
                'profile.subscription.opening_app_store'.tr,
              ),
            ),
            SettingsNavRow(
              iconPath: IconPath.nutRefresh,
              title: 'profile.subscription.restore_purchases'.tr,
              subtitle: 'profile.subscription.restore_purchases_subtitle'.tr,
              onTap: () => AppHelperFunctions.showSnackBar(
                'profile.subscription.purchases_restored'.tr,
              ),
            ),
          ],
        ),
        Gap(22),
        SettingsSectionLabel('profile.subscription.section_promo_code'.tr),
        Container(
          padding: EdgeInsets.fromLTRB(14.w, 6.h, 6.w, 6.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            children: [
              SvgPicture.asset(IconPath.prTag, width: 17.r, height: 17.r),
              Gap.h(10),
              Expanded(
                child: TextField(
                  controller: controller.promoCodeController,
                  style: text.regularTextStyle(
                    fontSize: 14,
                    color: AppColors.ink,
                  ),
                  decoration: InputDecoration(
                    hintText: 'profile.subscription.enter_code'.tr,
                    hintStyle: text.regularTextStyle(
                      fontSize: 14,
                      color: AppColors.subtle,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              Material(
                color: AppColors.ink,
                borderRadius: BorderRadius.circular(12.r),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => AppHelperFunctions.showSnackBar(
                    'profile.subscription.promo_code_applied'.tr,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: Text(
                      'profile.subscription.apply'.tr,
                      style: text.semiBoldTextStyle(
                        fontSize: 13.5,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(16),
        OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text: 'profile.subscription.cancel_info'.tr,
        ),
      ],
    );
  }
}
