import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19l · Settings — Connected Apps".
class SettingsConnectedAppsScreen extends GetView<ProfileController> {
  const SettingsConnectedAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Connected Apps',
      children: [
        SettingsCardGroup(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                      color: AppColors.peach,
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.pcHeart,
                        width: 22.r,
                        height: 22.r,
                        colorFilter: const ColorFilter.mode(
                          AppColors.cta,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Gap.h(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apple Health',
                          style: text.boldTextStyle(
                            fontSize: 16,
                            color: AppColors.ink,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.appleHealthConnected.value
                                ? 'Connected · last sync 2 min ago'
                                : 'Disconnected',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: text.mediumTextStyle(
                              fontSize: 12,
                              color: controller.appleHealthConnected.value
                                  ? AppColors.emerald
                                  : AppColors.muted,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap.h(8),
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.appleHealthConnected.toggle(),
                      child: Text(
                        controller.appleHealthConnected.value
                            ? 'Disconnect'
                            : 'Connect',
                        style: text.semiBoldTextStyle(
                          fontSize: 13.5,
                          color: AppColors.cta,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.prRun,
                title: 'Workouts',
                subtitle: 'MILON writes your sessions',
                value: controller.syncWorkouts.value,
                onChanged: (v) => controller.syncWorkouts.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwFlame,
                title: 'Active energy',
                subtitle: 'Read · used for calorie targets',
                value: controller.syncActiveEnergy.value,
                onChanged: (v) => controller.syncActiveEnergy.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.prActivity,
                title: 'Steps',
                subtitle: 'Read · activity level',
                value: controller.syncSteps.value,
                onChanged: (v) => controller.syncSteps.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcScale,
                title: 'Weight',
                subtitle: 'Read & write · weekly trend',
                value: controller.syncWeight.value,
                onChanged: (v) => controller.syncWeight.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcMoon,
                title: 'Sleep',
                subtitle: 'Read · recovery readiness',
                value: controller.syncSleep.value,
                onChanged: (v) => controller.syncSleep.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcHeart,
                title: 'Heart rate',
                subtitle: 'Read · workout intensity',
                value: controller.syncHeartRate.value,
                onChanged: (v) => controller.syncHeartRate.value = v,
              ),
            ),
          ],
        ),
        Gap(22),
        const SettingsSectionLabel('MORE CONNECTIONS'),
        SettingsCardGroup(
          children: [
            _ConnectionRow(
              title: 'Smart scale',
              subtitle: 'Sync weight from Withings & others',
            ),
            _ConnectionRow(
              title: 'Strava',
              subtitle: 'Import runs and rides',
            ),
            _ConnectionRow(
              title: 'Google Calendar',
              subtitle: 'Add sessions to your calendar',
            ),
          ],
        ),
        Gap(16),
        const OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text:
              'MILON only reads the data you allow and never sells it. You can revoke access anytime in iOS Settings › Health.',
        ),
      ],
    );
  }
}

class _ConnectionRow extends StatelessWidget {
  const _ConnectionRow({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: text.boldTextStyle(fontSize: 14.5, color: AppColors.ink),
                ),
                Gap(2),
                Text(
                  subtitle,
                  style: text.regularTextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
          Gap.h(10),
          OutlinedButton(
            onPressed: () => AppHelperFunctions.showSnackBar(
              'Connecting $title...',
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.line),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            ),
            child: Text(
              'Connect',
              style: text.semiBoldTextStyle(fontSize: 13, color: AppColors.ink),
            ),
          ),
        ],
      ),
    );
  }
}
