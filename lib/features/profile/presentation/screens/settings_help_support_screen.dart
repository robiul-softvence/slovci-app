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

  static const _faqs = [
    (
      'How does MILON adapt to my injuries?',
      'MILON excludes movements that load flagged joints and swaps in safe alternatives automatically.',
    ),
    (
      'Why are only lunch and dinner planned?',
      'Most users prefer keeping breakfast and snacks flexible while getting structured macros for main meals.',
    ),
    (
      'How do I cancel my subscription?',
      'Go to Settings › Subscription › Manage in App Store to cancel anytime before renewal.',
    ),
    (
      'Can I change my grocery budget?',
      'Yes! Open Diet & Grocery Budget anytime to adjust your weekly budget between €20 and €150.',
    ),
  ];

  static const _topics = [
    'Account',
    'Billing',
    'Workouts',
    'Nutrition',
    'Report a bug',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Help & Support',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Send Message',
          onPressed: () {
            Get.back();
            AppHelperFunctions.showSnackBar(
              'Support message sent! We will reply within 24 hours.',
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
            hintText: 'How can we help?',
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
        const SettingsSectionLabel('POPULAR QUESTIONS'),
        SettingsCardGroup(
          children: List.generate(_faqs.length, (i) {
            final (q, a) = _faqs[i];
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
                              q,
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
                          a,
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
        const SettingsSectionLabel('CONTACT US'),
        Text(
          'Topic',
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(8),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: List.generate(_topics.length, (i) {
              return OnboardingTagChip(
                label: _topics[i],
                selected: controller.supportTopicIndex.value == i,
                unselectedBg: AppColors.white,
                onTap: () => controller.supportTopicIndex.value = i,
              );
            }),
          ),
        ),
        Gap(16),
        Text(
          'Message',
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
                          'Attach screenshot',
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
            Text(
              'We usually reply within 24 hours, in English or French.',
              style: text.regularTextStyle(fontSize: 12, color: AppColors.muted),
            ),
          ],
        ),
      ],
    );
  }
}
