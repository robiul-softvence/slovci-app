import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Shared scaffold for MILON Onboarding screens (Figma "1 · Onboarding").
/// Supports optional 6-segment progress header, eyebrow label, H1 title,
/// subtitle, scrollable body, and pinned [BottomActionBar].
class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({
    super.key,
    this.stepIndex,
    this.totalSteps = 6,
    this.showHeader = true,
    this.topWidget,
    this.eyebrow,
    this.title,
    this.titleWidget,
    this.subtitle,
    required this.children,
    this.footer,
    this.onBack,
  });

  /// 1-based step index (1..6) for the segmented progress bar.
  final int? stepIndex;
  final int totalSteps;
  final bool showHeader;
  final Widget? topWidget;
  final String? eyebrow;
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final List<Widget> children;
  final BottomActionBar? footer;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                if (showHeader && stepIndex != null)
                  OnboardingStepHeader(
                    stepIndex: stepIndex!,
                    totalSteps: totalSteps,
                    onBack: onBack,
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      20.w,
                      showHeader && stepIndex != null ? 10.h : 14.h,
                      20.w,
                      24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (topWidget != null) ...[
                          topWidget!,
                          Gap(14),
                        ],
                        if (eyebrow != null) ...[
                          Text(
                            eyebrow!,
                            style: text.boldTextStyle(
                              fontSize: AppTextStyle.sm,
                              lineHeight: 16,
                              letterSpacing: 0.6,
                              color: AppColors.cta,
                            ),
                          ),
                          Gap(8),
                        ],
                        if (titleWidget != null)
                          titleWidget!
                        else if (title != null)
                          Text(
                            title!,
                            style: text.boldTextStyle(
                              fontSize: 28,
                              lineHeight: 34,
                              letterSpacing: -0.5,
                              color: AppColors.ink,
                            ),
                          ),
                        if (subtitle != null) ...[
                          Gap(8),
                          Text(
                            subtitle!,
                            style: text.regularTextStyle(
                              fontSize: AppTextStyle.md,
                              lineHeight: 20,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                        ...children,
                      ],
                    ),
                  ),
                ),
                ?footer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Figma "Onboarding Header": 40 px pearl back button, 6-step coral progress
/// bar, and "X / 6" counter on the right.
class OnboardingStepHeader extends StatelessWidget {
  const OnboardingStepHeader({
    super.key,
    required this.stepIndex,
    this.totalSteps = 6,
    this.onBack,
  });

  final int stepIndex;
  final int totalSteps;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
      child: Row(
        children: [
          Material(
            color: AppColors.pearl,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onBack ?? Get.back,
              child: SizedBox.square(
                dimension: 40.r,
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.chevLeft,
                    width: 20.r,
                    height: 20.r,
                  ),
                ),
              ),
            ),
          ),
          Gap.h(14),
          Expanded(
            child: Row(
              children: List.generate(totalSteps, (i) {
                final filled = i < stepIndex;
                return Expanded(
                  child: Container(
                    height: 4.h,
                    margin: EdgeInsets.only(right: i == totalSteps - 1 ? 0 : 6.w),
                    decoration: BoxDecoration(
                      color: filled ? AppColors.coral : AppColors.line,
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                  ),
                );
              }),
            ),
          ),
          Gap.h(14),
          Text(
            '$stepIndex / $totalSteps',
            style: text.semiBoldTextStyle(
              fontSize: 13,
              lineHeight: 16,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}
