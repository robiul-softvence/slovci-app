import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/profile_dialogs.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19 · Profile — Settings & Referral".
class ProfileMainScreen extends GetView<ProfileController> {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.main.title'.tr,
      backgroundColor: AppColors.white,
      trailing: Material(
        color: AppColors.pearl,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: controller.openSettings,
          child: SizedBox.square(
            dimension: 40.r,
            child: Center(
              child: SvgPicture.asset(
                IconPath.prSettings,
                width: 20.r,
                height: 20.r,
              ),
            ),
          ),
        ),
      ),
      children: [
        // Peach Profile Hero Card
        GestureDetector(
          onTap: controller.openEditProfile,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 16.h),
            decoration: BoxDecoration(
              color: AppColors.peach,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              children: [
                Container(
                  width: 76.r,
                  height: 76.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.coral,
                    border: Border.all(color: AppColors.white, width: 3.5),
                  ),
                  child: Center(
                    child: Text(
                      'S',
                      style: text.blackTextStyle(
                        fontSize: 30,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Solène Martin',
                      style: text.boldTextStyle(
                        fontSize: 22,
                        color: AppColors.ink,
                      ),
                    ),
                    Gap.h(8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 9.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.ink,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            IconPath.hwSpark,
                            width: 11.r,
                            height: 11.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.lime,
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap.h(4),
                          Text(
                            'PRO',
                            style: text.boldTextStyle(
                              fontSize: 10.5,
                              color: AppColors.lime,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(4),
                Text(
                  'profile.main.member_since'.tr,
                  style: text.regularTextStyle(
                    fontSize: 12.5,
                    color: AppColors.muted,
                  ),
                ),
                Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: _ProfileStatTile(
                        value: '48',
                        label: 'profile.main.stat_sessions'.tr,
                      ),
                    ),
                    const Gap.h(10),
                    Expanded(
                      child: _ProfileStatTile(
                        value: '12',
                        label: 'profile.main.stat_weeks'.tr,
                      ),
                    ),
                    const Gap.h(10),
                    Expanded(
                      child: _ProfileStatTile(
                        value: '5',
                        label: 'profile.main.stat_day_streak'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Gap(22),
        Text(
          'profile.main.coaching_style'.tr,
          style: text.boldTextStyle(fontSize: 17, color: AppColors.ink),
        ),
        Gap(12),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: _StyleCard(
                  iconPath: IconPath.pcHeart,
                  title: 'profile.main.style_supportive'.tr,
                  subtitle: 'profile.main.style_supportive_subtitle'.tr,
                  selected: !controller.motivatingStyle.value,
                  onTap: () => controller.motivatingStyle.value = false,
                ),
              ),
              Gap.h(12),
              Expanded(
                child: _StyleCard(
                  iconPath: IconPath.hwFlame,
                  title: 'profile.main.style_motivating'.tr,
                  subtitle: 'profile.main.style_motivating_subtitle'.tr,
                  selected: controller.motivatingStyle.value,
                  onTap: () => controller.motivatingStyle.value = true,
                ),
              ),
            ],
          ),
        ),
        Gap(16),
        // Coral Referral Banner
        GestureDetector(
          onTap: controller.openInviteFriends,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.coral, AppColors.cta],
              ),
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42.r,
                      height: 42.r,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(13.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          IconPath.prGift,
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
                            'profile.main.referral_title'.tr,
                            style: text.boldTextStyle(
                              fontSize: 14.5,
                              color: AppColors.white,
                            ),
                          ),
                          Gap(2),
                          Text(
                            'profile.main.referral_subtitle'.tr,
                            style: text.regularTextStyle(
                              fontSize: 12,
                              lineHeight: 16,
                              color: AppColors.white.withValues(alpha: 0.88),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(14),
                Container(
                  padding: EdgeInsets.fromLTRB(14.w, 10.h, 8.w, 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'profile.main.your_code'.tr,
                              style: text.boldTextStyle(
                                fontSize: 10,
                                letterSpacing: 0.6,
                                color: AppColors.muted,
                              ),
                            ),
                            Text(
                              controller.referralCode,
                              style: text.boldTextStyle(
                                fontSize: 18,
                                color: AppColors.ink,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: AppColors.ink,
                        borderRadius: BorderRadius.circular(12.r),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: controller.copyReferralCode,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 9.h,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  IconPath.prCopy,
                                  width: 14.r,
                                  height: 14.r,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Gap.h(6),
                                Text(
                                  'profile.main.copy'.tr,
                                  style: text.semiBoldTextStyle(
                                    fontSize: 13,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'profile.main.friends_joined'.tr,
                      style: text.mediumTextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'profile.main.days_earned'.tr,
                      style: text.mediumTextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Gap(8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.lime,
                          borderRadius: BorderRadius.circular(99.r),
                        ),
                      ),
                    ),
                    Gap.h(6),
                    Expanded(
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(99.r),
                        ),
                      ),
                    ),
                    Gap.h(6),
                    Expanded(
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(99.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Gap(22),
        Text(
          'profile.main.training_nutrition'.tr,
          style: text.boldTextStyle(fontSize: 17, color: AppColors.ink),
        ),
        Gap(12),
        SettingsCardGroup(
          children: [
            SettingsNavRow(
              iconPath: IconPath.hwDumbbell,
              title: 'profile.main.equipment'.tr,
              subtitle: 'profile.main.equipment_subtitle'.tr,
              onTap: controller.openTrainingSetup,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwShield,
              title: 'profile.main.injuries'.tr,
              subtitle: 'profile.main.injuries_subtitle'.tr,
              onTap: controller.openInjuries,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwHome,
              title: 'profile.main.training_environment'.tr,
              subtitle: 'profile.main.training_environment_subtitle'.tr,
              onTap: controller.openTrainingSetup,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwFood,
              title: 'profile.main.diet_budget'.tr,
              subtitle: 'profile.main.diet_budget_subtitle'.tr,
              onTap: controller.openDietBudget,
            ),
            SettingsNavRow(
              iconPath: IconPath.hwBell,
              title: 'profile.main.notifications'.tr,
              subtitle: 'profile.main.notifications_subtitle'.tr,
              onTap: controller.openNotifications,
            ),
            SettingsNavRow(
              iconPath: IconPath.prGlobe,
              title: 'profile.main.language'.tr,
              subtitle: 'profile.main.language_subtitle'.tr,
              onTap: controller.openUnitsLanguage,
              trailing: Obx(
                () => Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: AppLanguage.values.map((lang) {
                      final active = controller.appLanguage.value == lang;
                      return GestureDetector(
                        onTap: () => controller.setLanguage(lang),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: active
                                ? AppColors.ink
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                          child: Text(
                            lang.name.toUpperCase(),
                            style: text.boldTextStyle(
                              fontSize: 11.5,
                              color: active ? AppColors.white : AppColors.muted,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(16),
        // Lime MILON Pro Annual Card
        GestureDetector(
          onTap: controller.openSubscription,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: AppColors.lime,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      IconPath.prCard,
                      width: 19.r,
                      height: 19.r,
                      colorFilter: const ColorFilter.mode(
                        AppColors.lime,
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
                        'profile.main.pro_annual'.tr,
                        style: text.boldTextStyle(
                          fontSize: 14.5,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(2),
                      Text(
                        'profile.main.pro_renews'.tr,
                        style: text.regularTextStyle(
                          fontSize: 12,
                          color: AppColors.ink.withValues(alpha: 0.78),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  IconPath.hwChevRight,
                  width: 16.r,
                  height: 16.r,
                ),
              ],
            ),
          ),
        ),
        Gap(20),
        Center(
          child: GestureDetector(
            onTap: () => LogOutConfirmDialog.show(context),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    IconPath.prLogout,
                    width: 18.r,
                    height: 18.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.cta,
                      BlendMode.srcIn,
                    ),
                  ),
                  Gap.h(8),
                  Text(
                    'profile.main.log_out'.tr,
                    style: text.semiBoldTextStyle(
                      fontSize: 14.5,
                      color: AppColors.cta,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileStatTile extends StatelessWidget {
  const _ProfileStatTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: text.boldTextStyle(fontSize: 19, color: AppColors.ink),
          ),
          Gap(2),
          Text(
            label,
            style: text.regularTextStyle(
              fontSize: 11.5,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _StyleCard extends StatelessWidget {
  const _StyleCard({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String iconPath;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: selected ? AppColors.ink : AppColors.pearl,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20.r,
              height: 20.r,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.lime : AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
            Gap(12),
            Text(
              title,
              style: text.boldTextStyle(
                fontSize: 15,
                color: selected ? AppColors.white : AppColors.ink,
              ),
            ),
            Gap(2),
            Text(
              subtitle,
              style: text.regularTextStyle(
                fontSize: 12,
                color: selected
                    ? AppColors.white.withValues(alpha: 0.72)
                    : AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
