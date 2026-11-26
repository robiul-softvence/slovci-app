import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentaion/UI/bottom_nav_screen.dart';

/// Figma "S3 · State — Empty".
/// Reusable empty state for Progress (before first workout is completed).
class StateEmptyScreen extends StatelessWidget {
  /// String defaults are translation keys; every text is resolved with `.tr`
  /// at build time (plain strings passed by callers are shown unchanged).
  const StateEmptyScreen({
    super.key,
    this.headerTitle = 'system_states.empty.header_title',
    this.title = 'system_states.empty.title',
    this.subtitle = 'system_states.empty.subtitle',
    this.upNextTitle = 'system_states.empty.up_next_title',
    this.upNextSubtitle = 'system_states.empty.up_next_subtitle',
    this.ctaLabel = 'system_states.empty.cta',
    this.showBottomNav = true,
    this.onUpNextTap,
    this.onCtaTap,
  });

  final String headerTitle;
  final String title;
  final String subtitle;
  final String upNextTitle;
  final String upNextSubtitle;
  final String ctaLabel;
  final bool showBottomNav;
  final VoidCallback? onUpNextTap;
  final VoidCallback? onCtaTap;

  void _goToWorkout() {
    if (Get.isRegistered<BottomNavController>()) {
      Get.find<BottomNavController>().changeIndex(1);
    }
    if (Get.key.currentState?.canPop() ?? false) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Text(
                  headerTitle.tr,
                  style: text.boldTextStyle(
                    fontSize: 26,
                    lineHeight: 32,
                    color: AppColors.ink,
                  ),
                ),
              ),

              // State Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(32.w, 120.h, 32.w, 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 96.r,
                        height: 96.r,
                        decoration: BoxDecoration(
                          color: AppColors.peach,
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.sysDumbbellCoral,
                            width: 44.r,
                            height: 44.r,
                          ),
                        ),
                      ),
                      Gap(16),
                      Text(
                        title.tr,
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 22,
                          lineHeight: 28,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(16),
                      Text(
                        subtitle.tr,
                        textAlign: TextAlign.center,
                        style: text.regularTextStyle(
                          fontSize: 14,
                          lineHeight: 20,
                          color: AppColors.muted,
                        ),
                      ),
                      Gap(16),
                      // Up next workout card
                      Material(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          side: const BorderSide(color: AppColors.line),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: onUpNextTap ?? _goToWorkout,
                          child: Padding(
                            padding: EdgeInsets.all(14.r),
                            child: Row(
                              children: [
                                Container(
                                  width: 40.r,
                                  height: 40.r,
                                  decoration: BoxDecoration(
                                    color: AppColors.coral,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconPath.sysDumbbellWhite,
                                      width: 20.r,
                                      height: 20.r,
                                    ),
                                  ),
                                ),
                                Gap.h(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        upNextTitle.tr,
                                        style: text.boldTextStyle(
                                          fontSize: 14,
                                          lineHeight: 20,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                      Text(
                                        upNextSubtitle.tr,
                                        style: text.mediumTextStyle(
                                          fontSize: 12,
                                          lineHeight: 16,
                                          color: AppColors.muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  IconPath.sysChevR,
                                  width: 18.r,
                                  height: 18.r,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Footer CTA (sits right above the floating pill nav bar)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  12.h,
                  20.w,
                  showBottomNav ? 98.h : 24.h,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: AppColors.cta,
                    borderRadius: BorderRadius.circular(16.r),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: onCtaTap ?? _goToWorkout,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 16.h,
                        ),
                        child: Center(
                          child: Text(
                            ctaLabel.tr,
                            style: text.boldTextStyle(
                              fontSize: 16,
                              lineHeight: 20,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: showBottomNav
            ? const _EmptyStateNavBar(activeIndex: 3)
            : null,
      ),
    );
  }
}

class _EmptyStateNavBar extends StatelessWidget {
  const _EmptyStateNavBar({required this.activeIndex});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<BottomNavController>()) {
      return MilonFloatingNavBar(controller: Get.find<BottomNavController>());
    }
    final text = AppTextStyle(context);
    final bottomInset = math.max(
      MediaQuery.viewPaddingOf(context).bottom,
      14.0,
    );
    const tabs = [
      (IconPath.hwHome, 'system_states.nav.home'),
      (IconPath.hwDumbbell, 'system_states.nav.workout'),
      (IconPath.hwFood, 'system_states.nav.nutrition'),
      (IconPath.hwChart, 'system_states.nav.progress'),
      (IconPath.hwSpark, 'system_states.nav.ai_coach'),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, bottomInset),
      child: Container(
        height: 64.h,
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: AppColors.pearl,
          borderRadius: BorderRadius.circular(999.r),
          border: Border.all(color: AppColors.line),
          boxShadow: [
            BoxShadow(
              color: AppColors.ink.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(tabs.length, (i) {
            final isSelected = i == activeIndex;
            return Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 14.w : 10.w,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.cta : AppColors.transparent,
                borderRadius: BorderRadius.circular(999.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    tabs[i].$1,
                    width: 20.r,
                    height: 20.r,
                    colorFilter: ColorFilter.mode(
                      isSelected ? AppColors.white : AppColors.muted,
                      BlendMode.srcIn,
                    ),
                  ),
                  if (isSelected) ...[
                    Gap.h(6),
                    Text(
                      tabs[i].$2.tr,
                      style: text.boldTextStyle(
                        fontSize: 13,
                        lineHeight: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
