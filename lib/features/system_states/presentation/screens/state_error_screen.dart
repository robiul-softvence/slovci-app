import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

/// Figma "S2 · State — Error".
/// Reusable full-screen error state with retry CTA and support link.
class StateErrorScreen extends StatelessWidget {
  /// String defaults are translation keys; every text is resolved with `.tr`
  /// at build time (plain strings passed by callers are shown unchanged).
  const StateErrorScreen({
    super.key,
    this.headerTitle = 'system_states.error.header_title',
    this.title = 'system_states.error.title',
    this.subtitle = 'system_states.error.subtitle',
    this.errorCode = 'system_states.error.error_code',
    this.primaryLabel = 'system_states.error.try_again',
    this.secondaryLabel = 'system_states.error.contact_support',
    this.onBack,
    this.onTryAgain,
    this.onContactSupport,
  });

  final String headerTitle;
  final String title;
  final String subtitle;
  final String errorCode;
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback? onBack;
  final VoidCallback? onTryAgain;
  final VoidCallback? onContactSupport;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final bottomInset = math.max(
      MediaQuery.viewPaddingOf(context).bottom,
      20.0,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
                              IconPath.sysChevL,
                              width: 20.r,
                              height: 20.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap.h(12),
                    Expanded(
                      child: Text(
                        headerTitle.tr,
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          lineHeight: 24,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    Gap.h(12),
                    SizedBox.square(dimension: 40.r),
                  ],
                ),
              ),

              // Center State Content
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
                          color: AppColors.coralSoft,
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.sysWifi,
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
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.pearl,
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              IconPath.sysInfo,
                              width: 14.r,
                              height: 14.r,
                            ),
                            Gap.h(6),
                            Text(
                              errorCode.tr,
                              style: text.mediumTextStyle(
                                fontSize: 12,
                                lineHeight: 16,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Footer CTA
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, bottomInset),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Material(
                        color: AppColors.cta,
                        borderRadius: BorderRadius.circular(16.r),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: onTryAgain ?? Get.back,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 16.h,
                            ),
                            child: Center(
                              child: Text(
                                primaryLabel.tr,
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
                    Gap(12),
                    GestureDetector(
                      onTap:
                          onContactSupport ??
                          () => Get.toNamed(AppRoute.settingsHelpSupportScreen),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        child: Text(
                          secondaryLabel.tr,
                          style: text.semiBoldTextStyle(
                            fontSize: 14,
                            lineHeight: 20,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
