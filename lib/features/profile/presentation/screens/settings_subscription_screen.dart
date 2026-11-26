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

  static const _included = [
    'Unlimited workout & meal plans',
    'Injury-adaptive programs',
    'Grocery lists within budget',
    'Post-workout analysis & 24/7 MILON Coach',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Subscription',
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
                    'CURRENT PLAN',
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
                      'Active',
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
                'MILON Pro · Annual',
                style: text.boldTextStyle(
                  fontSize: 22,
                  color: AppColors.white,
                ),
              ),
              Gap(6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '€214.90',
                    style: text.boldTextStyle(
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                  Gap.h(6),
                  Text(
                    '/ year',
                    style: text.regularTextStyle(
                      fontSize: 14,
                      color: AppColors.white.withValues(alpha: 0.72),
                    ),
                  ),
                ],
              ),
              Gap(10),
              Text(
                'Renews Sep 12, 2027 · billed by Apple',
                style: text.regularTextStyle(
                  fontSize: 12.5,
                  color: AppColors.white.withValues(alpha: 0.75),
                ),
              ),
              Gap(4),
              Text(
                '+ 30 free days from referrals, applied at renewal',
                style: text.mediumTextStyle(
                  fontSize: 12.5,
                  color: AppColors.lime,
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('INCLUDED'),
        SettingsCardGroup(
          children: _included
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
                          item,
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
        const SettingsSectionLabel('MANAGE'),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.nutRefresh,
              title: 'Change plan',
              subtitle: 'Monthly €19.90 · Quarterly €56.70 · Annual €214.90',
              onTap: controller.openPaywall,
            ),
            SettingsNavRow(
              iconPath: IconPath.prStore,
              title: 'Manage in App Store',
              subtitle: 'Cancel or update payment method',
              onTap: () => AppHelperFunctions.showSnackBar(
                'Opening App Store subscriptions...',
              ),
            ),
            SettingsNavRow(
              iconPath: IconPath.nutRefresh,
              title: 'Restore purchases',
              subtitle: 'If you reinstalled the app',
              onTap: () => AppHelperFunctions.showSnackBar(
                'Purchases restored!',
              ),
            ),
          ],
        ),
        Gap(22),
        const SettingsSectionLabel('PROMO CODE'),
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
                  style: text.regularTextStyle(fontSize: 14, color: AppColors.ink),
                  decoration: InputDecoration(
                    hintText: 'Enter a code',
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
                    'Promo code applied!',
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: Text(
                      'Apply',
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
        const OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text:
              'Cancelling stops renewal at the end of your current period. You keep Pro until Sep 12, 2027.',
        ),
      ],
    );
  }
}
