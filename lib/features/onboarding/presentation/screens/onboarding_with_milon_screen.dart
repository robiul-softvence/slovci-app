import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "01c · Onboarding — With MILON" (Step 2/6).
class OnboardingWithMilonScreen extends GetView<OnboardingController> {
  const OnboardingWithMilonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      stepIndex: 2,
      eyebrow: 'YOUR GOAL, MADE REAL',
      titleWidget: Obx(
        () => RichText(
          text: TextSpan(
            style: text.boldTextStyle(
              fontSize: 28,
              lineHeight: 34,
              letterSpacing: -0.5,
              color: AppColors.ink,
            ),
            children: [
              TextSpan(
                text: '${controller.firstName.value}, with MILON you can reach ',
              ),
              TextSpan(
                text: '${controller.targetWeightKg.value} kg',
                style: text.boldTextStyle(
                  fontSize: 28,
                  lineHeight: 34,
                  letterSpacing: -0.5,
                  color: AppColors.cta,
                ),
              ),
              TextSpan(text: ' by ${controller.targetDateFormatted}'),
            ],
          ),
        ),
      ),
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: "Let's do it",
          onPressed: controller.goToHealthScreening,
        ),
      ),
      children: [
        Gap(22),
        // Peach comparison summary card
        Obx(
          () => Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: AppColors.peach,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today',
                      style: text.mediumTextStyle(
                        fontSize: 13,
                        lineHeight: 16,
                        color: AppColors.muted,
                      ),
                    ),
                    Gap(4),
                    Text(
                      '${controller.currentWeightKg.value} kg',
                      style: text.boldTextStyle(
                        fontSize: 26,
                        lineHeight: 30,
                        letterSpacing: -0.5,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  IconPath.obArrowRight,
                  width: 24.r,
                  height: 24.r,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      controller.targetDateFormatted,
                      style: text.mediumTextStyle(
                        fontSize: 13,
                        lineHeight: 16,
                        color: AppColors.muted,
                      ),
                    ),
                    Gap(4),
                    Text(
                      '${controller.targetWeightKg.value} kg',
                      style: text.boldTextStyle(
                        fontSize: 26,
                        lineHeight: 30,
                        letterSpacing: -0.5,
                        color: AppColors.cta,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Gap(16),
        Obx(() {
          final pace = controller.weeklyPaceKg;
          final weeks = controller.estimatedWeeks;
          return Text(
            'A steady ${pace < 0 ? '−' : '+'}${pace.abs().toStringAsFixed(1)} kg per week, about $weeks weeks. Slow and safe, so the results last.',
            style: text.regularTextStyle(
              fontSize: AppTextStyle.md,
              lineHeight: 21,
              color: AppColors.muted,
            ),
          );
        }),
        Gap(26),
        const OnboardingSectionTitle(title: 'With MILON, you get'),
        Gap(16),
        const _FeatureBenefitRow(
          iconPath: IconPath.obDumbbellCoral,
          title: 'Workouts built around you',
          subtitle: 'Adapted to your body, injuries, equipment and schedule',
        ),
        Gap(16),
        const _FeatureBenefitRow(
          iconPath: IconPath.obForkKnife,
          title: 'Meals that fit your budget',
          subtitle: 'A weekly meal plan and grocery list, ready to go',
        ),
        Gap(16),
        const _FeatureBenefitRow(
          iconPath: IconPath.obChatBubble,
          title: 'A coach by your side',
          subtitle: 'MILON Coach checks in and adjusts your plan every week',
        ),
      ],
    );
  }
}

class _FeatureBenefitRow extends StatelessWidget {
  const _FeatureBenefitRow({
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44.r,
          height: 44.r,
          decoration: BoxDecoration(
            color: AppColors.peach,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 22.r,
              height: 22.r,
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
                  fontSize: 15,
                  lineHeight: 20,
                  color: AppColors.ink,
                ),
              ),
              Gap(3),
              Text(
                subtitle,
                style: text.regularTextStyle(
                  fontSize: 13,
                  lineHeight: 19,
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
