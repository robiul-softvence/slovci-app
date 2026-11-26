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
      title: 'profile.connected_apps.title'.tr,
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
                          'profile.connected_apps.apple_health'.tr,
                          style: text.boldTextStyle(
                            fontSize: 16,
                            color: AppColors.ink,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.appleHealthConnected.value
                                ? 'profile.connected_apps.status_connected'.tr
                                : 'profile.connected_apps.status_disconnected'
                                      .tr,
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
                            ? 'profile.connected_apps.disconnect'.tr
                            : 'profile.connected_apps.connect'.tr,
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
                title: 'profile.connected_apps.workouts'.tr,
                subtitle: 'profile.connected_apps.workouts_subtitle'.tr,
                value: controller.syncWorkouts.value,
                onChanged: (v) => controller.syncWorkouts.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.hwFlame,
                title: 'profile.connected_apps.active_energy'.tr,
                subtitle: 'profile.connected_apps.active_energy_subtitle'.tr,
                value: controller.syncActiveEnergy.value,
                onChanged: (v) => controller.syncActiveEnergy.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.prActivity,
                title: 'profile.connected_apps.steps'.tr,
                subtitle: 'profile.connected_apps.steps_subtitle'.tr,
                value: controller.syncSteps.value,
                onChanged: (v) => controller.syncSteps.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcScale,
                title: 'profile.connected_apps.weight'.tr,
                subtitle: 'profile.connected_apps.weight_subtitle'.tr,
                value: controller.syncWeight.value,
                onChanged: (v) => controller.syncWeight.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcMoon,
                title: 'profile.connected_apps.sleep'.tr,
                subtitle: 'profile.connected_apps.sleep_subtitle'.tr,
                value: controller.syncSleep.value,
                onChanged: (v) => controller.syncSleep.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                iconPath: IconPath.pcHeart,
                title: 'profile.connected_apps.heart_rate'.tr,
                subtitle: 'profile.connected_apps.heart_rate_subtitle'.tr,
                value: controller.syncHeartRate.value,
                onChanged: (v) => controller.syncHeartRate.value = v,
              ),
            ),
          ],
        ),
        Gap(22),
        SettingsSectionLabel('profile.connected_apps.section_more'.tr),
        SettingsCardGroup(
          children: [
            _ConnectionRow(
              title: 'profile.connected_apps.smart_scale'.tr,
              subtitle: 'profile.connected_apps.smart_scale_subtitle'.tr,
            ),
            _ConnectionRow(
              title: 'Strava',
              subtitle: 'profile.connected_apps.strava_subtitle'.tr,
            ),
            _ConnectionRow(
              title: 'Google Calendar',
              subtitle: 'profile.connected_apps.google_calendar_subtitle'.tr,
            ),
          ],
        ),
        Gap(16),
        OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text: 'profile.connected_apps.privacy_info'.tr,
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
                  style: text.boldTextStyle(
                    fontSize: 14.5,
                    color: AppColors.ink,
                  ),
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
              'profile.connected_apps.connecting'.trParams({'name': title}),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.line),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            ),
            child: Text(
              'profile.connected_apps.connect'.tr,
              style: text.semiBoldTextStyle(fontSize: 13, color: AppColors.ink),
            ),
          ),
        ],
      ),
    );
  }
}
