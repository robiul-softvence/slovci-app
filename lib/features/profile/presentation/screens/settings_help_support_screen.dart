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

/// Figma "19o · Settings — Help & Support".
class SettingsHelpSupportScreen extends GetView<ProfileController> {
  const SettingsHelpSupportScreen({super.key});

  static const _faqKeys = [
    ('profile.help_support.faq1_q', 'profile.help_support.faq1_a'),
    ('profile.help_support.faq2_q', 'profile.help_support.faq2_a'),
    ('profile.help_support.faq3_q', 'profile.help_support.faq3_a'),
    ('profile.help_support.faq4_q', 'profile.help_support.faq4_a'),
  ];

  static const _topicKeys = [
    'profile.help_support.topic_account',
    'profile.help_support.topic_billing',
    'profile.help_support.topic_workouts',
    'profile.help_support.topic_nutrition',
    'profile.help_support.topic_report_bug',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'profile.help_support.title'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'profile.help_support.send_message'.tr,
          onPressed: () {
            Get.back();
            AppHelperFunctions.showSnackBar(
              'profile.help_support.message_sent'.tr,
            );
          },
        ),
      ),
      children: [
        // Search box
        TextField(
          controller: controller.helpSearchController,
          style: text.regularTextStyle(fontSize: 14, color: AppColors.ink),
          decoration: InputDecoration(
            hintText: 'profile.help_support.search_hint'.tr,
            hintStyle: text.regularTextStyle(
              fontSize: 14,
              color: AppColors.subtle,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(13.r),
              child: SvgPicture.asset(
                IconPath.prSearch,
                width: 17.r,
                height: 17.r,
              ),
            ),
            filled: true,
            fillColor: AppColors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.line),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.coral),
            ),
          ),
        ),
        Gap(22),
        SettingsSectionLabel('profile.help_support.section_popular'.tr),
        SettingsCardGroup(
          children: List.generate(_faqKeys.length, (i) {
            final (q, a) = _faqKeys[i];
            return Obx(() {
              final expanded = controller.expandedFaqIndex.value == i;
              return GestureDetector(
                onTap: () =>
                    controller.expandedFaqIndex.value = expanded ? -1 : i,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              q.tr,
                              style: text.semiBoldTextStyle(
                                fontSize: 14,
                                color: AppColors.ink,
                              ),
                            ),
                          ),
                          Gap.h(8),
                          SvgPicture.asset(
                            IconPath.hwChevDown,
                            width: 15.r,
                            height: 15.r,
                          ),
                        ],
                      ),
                      if (expanded) ...[
                        Gap(8),
                        Text(
                          a.tr,
                          style: text.regularTextStyle(
                            fontSize: 13,
                            lineHeight: 19,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            });
          }),
        ),
        Gap(22),
        SettingsSectionLabel('profile.help_support.section_contact'.tr),
        Text(
          'profile.help_support.topic'.tr,
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(8),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: List.generate(_topicKeys.length, (i) {
              return OnboardingTagChip(
                label: _topicKeys[i].tr,
                selected: controller.supportTopicIndex.value == i,
                unselectedBg: AppColors.white,
                onTap: () => controller.supportTopicIndex.value = i,
              );
            }),
          ),
        ),
        Gap(16),
        Text(
          'profile.help_support.message'.tr,
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(8),
        Container(
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(
            children: [
              TextField(
                controller: controller.supportMessageController,
                maxLines: 4,
                style: text.regularTextStyle(
                  fontSize: 14,
                  lineHeight: 20,
                  color: AppColors.ink,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.pearl,
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          IconPath.nutImage,
                          width: 14.r,
                          height: 14.r,
                        ),
                        Gap.h(6),
                        Text(
                          'profile.help_support.attach_screenshot'.tr,
                          style: text.mediumTextStyle(
                            fontSize: 12.5,
                            color: AppColors.ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '64 / 1000',
                    style: text.regularTextStyle(
                      fontSize: 12,
                      color: AppColors.subtle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(12),
        Row(
          children: [
            SvgPicture.asset(IconPath.hwClock, width: 15.r, height: 15.r),
            Gap.h(8),
            Expanded(
              child: Text(
                'profile.help_support.reply_info'.tr,
                style: text.regularTextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
