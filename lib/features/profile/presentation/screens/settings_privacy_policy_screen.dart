import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';

/// Figma "19q · Settings — Privacy Policy".
class SettingsPrivacyPolicyScreen extends StatelessWidget {
  const SettingsPrivacyPolicyScreen({super.key});

  static const _sections = [
    (
      '1. Data we collect',
      'Account details, profile information (age, height, weight, goal), training and nutrition logs, and, with your consent, health data such as injuries, sleep and data from Apple Health.',
    ),
    (
      '2. How we use it',
      'To generate and adapt your workout and meal plans, power the MILON Coach, send the reminders you choose, and improve MILON using anonymous analytics.',
    ),
    (
      '3. Health data',
      'Health data is processed only with your explicit consent, encrypted at rest and in transit, and never used for advertising. You can withdraw consent anytime in Privacy & Data.',
    ),
    (
      '4. Your rights',
      'You can access, correct, export or delete your data at any time from Settings, or by contacting privacy@example.com.',
    ),
    (
      '5. Retention',
      'We keep your data while your account is active. MILON Coach chats are kept for 90 days. Deleted accounts are erased within 30 days.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Privacy Policy',
      backgroundColor: AppColors.white,
      trailing: Material(
        color: AppColors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => AppHelperFunctions.showSnackBar('Privacy Policy shared'),
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
                'Last updated November 1, 2026',
                style: text.regularTextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
              Gap(6),
              Text(
                'Summary: we use your data only to personalize your training and nutrition. We never sell it.',
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
        ..._sections.map((pair) {
          final (heading, body) = pair;
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: text.boldTextStyle(
                    fontSize: 17,
                    color: AppColors.ink,
                  ),
                ),
                Gap(8),
                Text(
                  body,
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
