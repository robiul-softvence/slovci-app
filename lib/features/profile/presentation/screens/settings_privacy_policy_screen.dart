import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';

/// Figma "19q · Settings — Privacy Policy".
class SettingsPrivacyPolicyScreen extends StatelessWidget {
  const SettingsPrivacyPolicyScreen({super.key});

  static const _sectionKeys = [
    (
      'profile.privacy_policy.section1_title',
      'profile.privacy_policy.section1_body',
    ),
    (
      'profile.privacy_policy.section2_title',
      'profile.privacy_policy.section2_body',
    ),
    (
      'profile.privacy_policy.section3_title',
      'profile.privacy_policy.section3_body',
    ),
    (
      'profile.privacy_policy.section4_title',
      'profile.privacy_policy.section4_body',
    ),
    (
      'profile.privacy_policy.section5_title',
      'profile.privacy_policy.section5_body',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.privacy_policy.title'.tr,
      backgroundColor: AppColors.white,
      trailing: Material(
        color: AppColors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => AppHelperFunctions.showSnackBar(
            'profile.privacy_policy.shared'.tr,
          ),
          child: SizedBox.square(
            dimension: 40.r,
            child: Center(
              child: SvgPicture.asset(
                IconPath.hwShare,
                width: 19.r,
                height: 19.r,
              ),
            ),
          ),
        ),
      ),
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'profile.privacy_policy.last_updated'.tr,
                style: text.regularTextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
              Gap(6),
              Text(
                'profile.privacy_policy.summary'.tr,
                style: text.mediumTextStyle(
                  fontSize: 14,
                  lineHeight: 20,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        ..._sectionKeys.map((pair) {
          final (headingKey, bodyKey) = pair;
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingKey.tr,
                  style: text.boldTextStyle(fontSize: 17, color: AppColors.ink),
                ),
                Gap(8),
                Text(
                  bodyKey.tr,
                  style: text.regularTextStyle(
                    fontSize: 14,
                    lineHeight: 21,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
