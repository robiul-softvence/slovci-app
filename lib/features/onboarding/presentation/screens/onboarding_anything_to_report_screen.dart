import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "02a · Onboarding — Anything to Report?" (Step 3/6).
class OnboardingAnythingToReportScreen extends GetView<OnboardingController> {
  const OnboardingAnythingToReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      stepIndex: 3,
      eyebrow: 'onboarding.report.eyebrow'.tr,
      title: 'onboarding.report.title'.tr,
      subtitle: 'onboarding.report.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'onboarding.common.continue'.tr,
          onPressed: controller.continueFromAnythingToReport,
        ),
      ),
      children: [
        Gap(26),
        Obx(
          () => Column(
            children: [
              _ReportOptionCard(
                title: 'onboarding.report.no_title'.tr,
                subtitle: 'onboarding.report.no_subtitle'.tr,
                iconPath: IconPath.obHeart,
                selected: !controller.hasInjuriesToReport.value,
                onTap: () => controller.hasInjuriesToReport.value = false,
              ),
              Gap(12),
              _ReportOptionCard(
                title: 'onboarding.report.yes_title'.tr,
                subtitle: 'onboarding.report.yes_subtitle'.tr,
                iconPath: IconPath.obHand,
                selected: controller.hasInjuriesToReport.value,
                onTap: () => controller.hasInjuriesToReport.value = true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReportOptionCard extends StatelessWidget {
  const _ReportOptionCard({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 46.r,
              height: 46.r,
              decoration: BoxDecoration(
                color: selected ? AppColors.coral : AppColors.pearl,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 22.r,
                  height: 22.r,
                  colorFilter: ColorFilter.mode(
                    selected ? AppColors.white : AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Gap.h(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: text.boldTextStyle(
                      fontSize: 16,
                      lineHeight: 20,
                      color: AppColors.ink,
                    ),
                  ),
                  Gap(3),
                  Text(
                    subtitle,
                    style: text.regularTextStyle(
                      fontSize: 13,
                      lineHeight: 18,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            Gap.h(8),
            OnboardingCheckBadge(selected: selected),
          ],
        ),
      ),
    );
  }
}
