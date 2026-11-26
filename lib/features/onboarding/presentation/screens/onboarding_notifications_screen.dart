import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/domain/entities/onboarding_models.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "04d · Onboarding — Notifications & Apple Health".
class OnboardingNotificationsScreen extends GetView<OnboardingController> {
  const OnboardingNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      showHeader: false,
      eyebrow: 'onboarding.notifications.eyebrow'.tr,
      title: 'onboarding.notifications.title'.tr,
      subtitle: 'onboarding.notifications.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'onboarding.notifications.cta'.tr,
          onPressed: controller.finishOnboarding,
        ),
        secondary: GestureDetector(
          onTap: controller.finishOnboarding,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Text(
              'onboarding.notifications.not_now'.tr,
              style: text.semiBoldTextStyle(
                fontSize: AppTextStyle.md,
                lineHeight: 20,
                color: AppColors.ink,
              ),
            ),
          ),
        ),
      ),
      children: [
        Gap(20),
        // Peach push notification preview container
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: AppColors.peach,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: [
              Obx(
                () => _NotificationPreviewCard(
                  title: 'MILON',
                  time: controller.reminderTimeLabel,
                  body: 'onboarding.notifications.preview_workout'.trParams({
                    'minutes': '${controller.sessionLengthMinutes.value}',
                    'place': controller.environmentPlaceLabel,
                  }),
                ),
              ),
              Gap(10),
              _NotificationPreviewCard(
                title: 'onboarding.notifications.preview_checkin_title'.tr,
                body: 'onboarding.notifications.preview_checkin_body'.tr,
              ),
            ],
          ),
        ),
        Gap(22),
        // 3 reminder rows
        Obx(
          () => _ReminderRow(
            iconPath: IconPath.obDumbbellCoral,
            title: 'onboarding.notifications.workout_reminders'.tr,
            subtitle:
                '${controller.selectedDaysSummary} · ${controller.reminderTimeLabel}',
          ),
        ),
        Gap(14),
        _ReminderRow(
          iconPath: IconPath.obFood,
          title: 'onboarding.notifications.meal_nudges'.tr,
          subtitle: 'onboarding.notifications.meal_nudges_subtitle'.tr,
        ),
        Gap(14),
        _ReminderRow(
          iconPath: IconPath.obCalendar,
          title: 'onboarding.notifications.weekly_checkin'.tr,
          subtitle: 'onboarding.notifications.weekly_checkin_subtitle'.tr,
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'onboarding.notifications.motivation_title'.tr,
        ),
        Gap(12),
        Obx(
          () => OnboardingSegmentedControl<MotivationFrequency>(
            items: MotivationFrequency.values,
            selected: controller.motivationFrequency.value,
            onSelect: (v) => controller.motivationFrequency.value = v,
            labelBuilder: (f) {
              switch (f) {
                case MotivationFrequency.daily:
                  return 'onboarding.notifications.frequency_daily'.tr;
                case MotivationFrequency.threePerWeek:
                  return 'onboarding.notifications.frequency_three_per_week'.tr;
                case MotivationFrequency.weekly:
                  return 'onboarding.notifications.frequency_weekly'.tr;
                case MotivationFrequency.off:
                  return 'onboarding.notifications.frequency_off'.tr;
              }
            },
          ),
        ),
        Gap(10),
        Text(
          'onboarding.notifications.motivation_note'.tr,
          style: text.regularTextStyle(
            fontSize: AppTextStyle.sm,
            lineHeight: 17,
            color: AppColors.muted,
          ),
        ),
        Gap(20),
        // Connect Apple Health card
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            children: [
              Container(
                width: 42.r,
                height: 42.r,
                decoration: BoxDecoration(
                  color: AppColors.peach,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.obHeart,
                    width: 20.r,
                    height: 20.r,
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
                      'onboarding.notifications.apple_health_title'.tr,
                      style: text.boldTextStyle(
                        fontSize: 14.5,
                        lineHeight: 19,
                        color: AppColors.ink,
                      ),
                    ),
                    Gap(2),
                    Text(
                      'onboarding.notifications.apple_health_subtitle'.tr,
                      style: text.regularTextStyle(
                        fontSize: 12,
                        lineHeight: 16,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              Gap.h(10),
              Obx(() {
                final connected = controller.appleHealthConnected.value;
                return GestureDetector(
                  onTap: () => controller.appleHealthConnected.toggle(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 9.h,
                    ),
                    decoration: BoxDecoration(
                      color: connected ? AppColors.emerald : AppColors.ink,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      connected
                          ? 'onboarding.notifications.connected'.tr
                          : 'onboarding.notifications.connect'.tr,
                      style: text.semiBoldTextStyle(
                        fontSize: 13,
                        lineHeight: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotificationPreviewCard extends StatelessWidget {
  const _NotificationPreviewCard({
    required this.title,
    required this.body,
    this.time,
  });

  final String title;
  final String body;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: AppColors.coral,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                'M',
                style: text.boldTextStyle(
                  fontSize: 16,
                  lineHeight: 18,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Gap.h(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: text.boldTextStyle(
                        fontSize: 13.5,
                        lineHeight: 17,
                        color: AppColors.ink,
                      ),
                    ),
                    if (time != null)
                      Text(
                        time!,
                        style: text.regularTextStyle(
                          fontSize: 12,
                          lineHeight: 15,
                          color: AppColors.muted,
                        ),
                      ),
                  ],
                ),
                Gap(4),
                Text(
                  body,
                  style: text.regularTextStyle(
                    fontSize: 13,
                    lineHeight: 18,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReminderRow extends StatelessWidget {
  const _ReminderRow({
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  final String iconPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Row(
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            color: AppColors.pearl,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 20.r,
              height: 20.r,
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
                title,
                style: text.boldTextStyle(
                  fontSize: 14.5,
                  lineHeight: 19,
                  color: AppColors.ink,
                ),
              ),
              Gap(2),
              Text(
                subtitle,
                style: text.regularTextStyle(
                  fontSize: 12.5,
                  lineHeight: 16,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
