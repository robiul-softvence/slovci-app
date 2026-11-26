import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19p · Settings — Invite Friends".
class SettingsInviteFriendsScreen extends GetView<ProfileController> {
  const SettingsInviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.invite_friends.title'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'profile.invite_friends.invite_friend'.tr,
          onPressed: controller.copyReferralCode,
        ),
      ),
      children: [
        // Peach hero card
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.peach,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: [
              Container(
                width: 48.r,
                height: 48.r,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.prGift,
                    width: 22.r,
                    height: 22.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.cta,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Gap(14),
              Text(
                'profile.invite_friends.hero_title'.tr,
                textAlign: TextAlign.center,
                style: text.boldTextStyle(
                  fontSize: 22,
                  lineHeight: 28,
                  color: AppColors.ink,
                ),
              ),
              Gap(8),
              Text(
                'profile.invite_friends.hero_subtitle'.tr,
                textAlign: TextAlign.center,
                style: text.regularTextStyle(
                  fontSize: 13.5,
                  lineHeight: 19,
                  color: AppColors.muted,
                ),
              ),
              Gap(16),
              ClipRRect(
                borderRadius: BorderRadius.circular(99.r),
                child: LinearProgressIndicator(
                  value: 0.33,
                  minHeight: 7.h,
                  backgroundColor: AppColors.white,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.coral,
                  ),
                ),
              ),
              Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'profile.invite_friends.friends_joined'.tr,
                    style: text.mediumTextStyle(
                      fontSize: 12,
                      color: AppColors.ink,
                    ),
                  ),
                  Text(
                    'profile.invite_friends.days_progress'.tr,
                    style: text.boldTextStyle(
                      fontSize: 12,
                      color: AppColors.cta,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.invite_friends.section_share_code'.tr),
        Container(
          padding: EdgeInsets.fromLTRB(14.w, 10.h, 8.w, 10.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'profile.invite_friends.your_code'.tr,
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
                          'profile.invite_friends.copy'.tr,
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
        Gap(10),
        Row(
          children: [
            Expanded(
              child: _ShareChannelBtn(
                iconPath: IconPath.hwSend,
                label: 'profile.invite_friends.share_message'.tr,
                onTap: controller.copyReferralCode,
              ),
            ),
            Gap.h(10),
            Expanded(
              child: _ShareChannelBtn(
                iconPath: IconPath.prLink,
                label: 'profile.invite_friends.share_copy_link'.tr,
                onTap: controller.copyReferralCode,
              ),
            ),
            Gap.h(10),
            Expanded(
              child: _ShareChannelBtn(
                iconPath: IconPath.hwShare,
                label: 'profile.invite_friends.share_more'.tr,
                onTap: controller.copyReferralCode,
              ),
            ),
          ],
        ),
        Gap(22),
        SettingsSectionLabel('profile.invite_friends.section_how_it_works'.tr),
        SettingsCardGroup(
          children: [
            _HowStepRow(
              num: '1',
              title: 'profile.invite_friends.step1_title'.tr,
              subtitle: 'profile.invite_friends.step1_subtitle'.tr,
            ),
            _HowStepRow(
              num: '2',
              title: 'profile.invite_friends.step2_title'.tr,
              subtitle: 'profile.invite_friends.step2_subtitle'.tr,
            ),
            _HowStepRow(
              num: '3',
              title: 'profile.invite_friends.step3_title'.tr,
              subtitle: 'profile.invite_friends.step3_subtitle'.tr,
            ),
          ],
        ),
        Gap(22),
        SettingsSectionLabel('profile.invite_friends.section_your_invites'.tr),
        SettingsCardGroup(
          children: [
            _InviteRow(
              name: 'Emma D.',
              meta: 'profile.invite_friends.invite_emma_meta'.tr,
              badge: 'profile.invite_friends.badge_days_earned'.tr,
              earned: true,
            ),
            _InviteRow(
              name: 'Lucas B.',
              meta: 'profile.invite_friends.invite_lucas_meta'.tr,
              badge: 'profile.invite_friends.badge_pending'.tr,
            ),
            _InviteRow(
              name: 'Chloé M.',
              meta: 'profile.invite_friends.invite_chloe_meta'.tr,
              badge: 'profile.invite_friends.badge_pending'.tr,
            ),
          ],
        ),
      ],
    );
  }
}

class _ShareChannelBtn extends StatelessWidget {
  const _ShareChannelBtn({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.line),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 19.r,
              height: 19.r,
              colorFilter: const ColorFilter.mode(
                AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
            Gap(6),
            Text(
              label,
              style: AppTextStyle(
                context,
              ).mediumTextStyle(fontSize: 12.5, color: AppColors.ink),
            ),
          ],
        ),
      ),
    );
  }
}

class _HowStepRow extends StatelessWidget {
  const _HowStepRow({
    required this.num,
    required this.title,
    required this.subtitle,
  });

  final String num;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Container(
            width: 30.r,
            height: 30.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.peach,
            ),
            child: Center(
              child: Text(
                num,
                style: text.boldTextStyle(fontSize: 13, color: AppColors.cta),
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
                  style: text.boldTextStyle(fontSize: 14, color: AppColors.ink),
                ),
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
        ],
      ),
    );
  }
}

class _InviteRow extends StatelessWidget {
  const _InviteRow({
    required this.name,
    required this.meta,
    required this.badge,
    this.earned = false,
  });

  final String name;
  final String meta;
  final String badge;
  final bool earned;

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
                  name,
                  style: text.boldTextStyle(
                    fontSize: 14.5,
                    color: AppColors.ink,
                  ),
                ),
                Gap(2),
                Text(
                  meta,
                  style: text.regularTextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: earned ? AppColors.mintLight : AppColors.pearl,
              borderRadius: BorderRadius.circular(99.r),
            ),
            child: Text(
              badge,
              style: text.boldTextStyle(
                fontSize: 12,
                color: earned ? AppColors.emerald : AppColors.muted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
