import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentaion/UI/bottom_nav_screen.dart';

/// Figma "S1 · State — Loading (Skeleton)".
/// Reusable skeleton placeholder matching the Home Daily Planner layout.
class StateLoadingSkeletonScreen extends StatelessWidget {
  /// String defaults are translation keys; every text is resolved with `.tr`
  /// at build time (plain strings passed by callers are shown unchanged).
  const StateLoadingSkeletonScreen({
    super.key,
    this.message = 'system_states.loading.message',
    this.showBottomNav = true,
  });

  final String message;
  final bool showBottomNav;

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
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 120.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header skeleton: avatar circle + two text lines
                Row(
                  children: [
                    Container(
                      width: 44.r,
                      height: 44.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.skeleton,
                      ),
                    ),
                    Gap.h(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SkeletonBox(width: 120.w, height: 12.h, radius: 6),
                          Gap(8),
                          _SkeletonBox(width: 180.w, height: 20.h, radius: 8),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(16),

                // 7-day strip skeleton
                Row(
                  children: List.generate(7, (i) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: i == 6 ? 0 : 6.w),
                        child: _SkeletonBox(height: 68.h, radius: 16),
                      ),
                    );
                  }),
                ),
                Gap(16),

                // Full-width CTA / banner skeleton
                _SkeletonBox(width: double.infinity, height: 52.h, radius: 16),
                Gap(20),

                // Two side-by-side summary card skeletons
                Row(
                  children: [
                    Expanded(child: _SkeletonBox(height: 220.h, radius: 24)),
                    Gap.h(12),
                    Expanded(child: _SkeletonBox(height: 220.h, radius: 24)),
                  ],
                ),
                Gap(20),

                // Meals section title + 2 meal cards skeleton
                _SkeletonBox(width: 140.w, height: 18.h, radius: 8),
                Gap(10),
                _SkeletonBox(width: double.infinity, height: 64.h, radius: 16),
                Gap(10),
                _SkeletonBox(width: double.infinity, height: 64.h, radius: 16),
                Gap(20),

                // Loading caption
                Center(
                  child: Text(
                    message.tr,
                    style: text.mediumTextStyle(
                      fontSize: 12,
                      lineHeight: 16,
                      color: AppColors.subtle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: showBottomNav
            ? _SystemStateNavBar(activeIndex: 0)
            : null,
      ),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({this.width, required this.height, required this.radius});

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.skeleton,
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }
}

/// Renders the live [MilonFloatingNavBar] if [BottomNavController] is
/// registered, or a matching standalone floating pill nav bar otherwise.
class _SystemStateNavBar extends StatelessWidget {
  const _SystemStateNavBar({required this.activeIndex});

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
