import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "01d · Onboarding — Health Screening".
class OnboardingHealthScreeningScreen extends GetView<OnboardingController> {
  const OnboardingHealthScreeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      showHeader: false,
      topWidget: Container(
        width: 48.r,
        height: 48.r,
        decoration: BoxDecoration(
          color: AppColors.peach,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            IconPath.obShield,
            width: 24.r,
            height: 24.r,
          ),
        ),
      ),
      title: 'Your health',
      subtitle:
          "Answer honestly so we can adapt your program. MILON doesn't replace a doctor.",
      footer: BottomActionBar(
        primary: Obx(
          () => AppPrimaryButton(
            label: 'Continue',
            onPressed: controller.healthConsent.value
                ? controller.goToAnythingToReport
                : null,
          ),
        ),
      ),
      children: [
        Gap(20),
        // 8 health screening toggles inside bordered card
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(
            children: List.generate(
              OnboardingController.healthConditionLabels.length,
              (index) {
                final label = OnboardingController.healthConditionLabels[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: text.mediumTextStyle(
                            fontSize: 14,
                            lineHeight: 20,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      Gap.h(12),
                      Obx(
                        () => CupertinoSwitch(
                          value: controller.healthFlags[index],
                          activeTrackColor: AppColors.coral,
                          inactiveTrackColor: AppColors.line,
                          onChanged: (_) => controller.toggleHealthFlag(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Gap(14),
        // Amber adaptation notice card
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: AppColors.amberSoft,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    IconPath.obAlert,
                    width: 18.r,
                    height: 18.r,
                  ),
                  Gap.h(8),
                  Text(
                    'If you switch one on, MILON adapts:',
                    style: text.boldTextStyle(
                      fontSize: 13,
                      lineHeight: 18,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
              Gap(8),
              Text(
                '• Eating disorder → no calorie counting, habit-based coaching only\n'
                '• Pregnancy → no weight-loss target, pregnancy-safe moves\n'
                "• Heart, blood pressure, kidney, diabetes → we ask for your doctor's OK first",
                style: text.regularTextStyle(
                  fontSize: 12.5,
                  lineHeight: 18,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
        Gap(14),
        // Peach consent checkbox card
        Obx(() {
          final consented = controller.healthConsent.value;
          return GestureDetector(
            onTap: () => controller.healthConsent.toggle(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: AppColors.peach,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: consented ? AppColors.coral : AppColors.line,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24.r,
                    height: 24.r,
                    margin: EdgeInsets.only(top: 2.h),
                    decoration: BoxDecoration(
                      color: consented ? AppColors.cta : AppColors.white,
                      borderRadius: BorderRadius.circular(7.r),
                      border: Border.all(
                        color: consented ? AppColors.cta : AppColors.line,
                        width: 1.5,
                      ),
                    ),
                    child: consented
                        ? Center(
                            child: SvgPicture.asset(
                              IconPath.obCheck,
                              width: 14.r,
                              height: 14.r,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        : null,
                  ),
                  Gap.h(12),
                  Expanded(
                    child: Text(
                      'I consent to MILON processing my health data to personalize my plan. I can withdraw anytime.',
                      style: text.mediumTextStyle(
                        fontSize: 13.5,
                        lineHeight: 19,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
