import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Figma "S4 · State — Success".
/// Reusable full-screen success confirmation state (e.g. meal logged).
class StateSuccessScreen extends StatelessWidget {
  const StateSuccessScreen({
    super.key,
    this.title = 'Lunch logged!',
    this.subtitle = 'Grilled Tofu & Egg Salad · 423 kcal',
    this.remainingLabel = 'Remaining today',
    this.remainingValue = '1,062 kcal',
    this.progress = 0.28,
    this.proteinText = 'P 32 / 125g',
    this.carbsText = 'C 28 / 145g',
    this.fatText = 'F 19 / 45g',
    this.primaryLabel = 'Done',
    this.secondaryLabel = 'Undo',
    this.onClose,
    this.onDone,
    this.onUndo,
  });

  final String title;
  final String subtitle;
  final String remainingLabel;
  final String remainingValue;
  final double progress;
  final String proteinText;
  final String carbsText;
  final String fatText;
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback? onClose;
  final VoidCallback? onDone;
  final VoidCallback? onUndo;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final bottomInset = math.max(
      MediaQuery.viewPaddingOf(context).bottom,
      20.0,
    );
    final clampedProgress = progress.clamp(0.0, 1.0);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header with close button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Row(
                  children: [
                    Material(
                      color: AppColors.pearl,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: onClose ?? Get.back,
                        child: SizedBox.square(
                          dimension: 40.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.sysClose,
                              width: 20.r,
                              height: 20.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
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
                          color: AppColors.mintLight,
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.sysCheckEmerald,
                            width: 44.r,
                            height: 44.r,
                          ),
                        ),
                      ),
                      Gap(16),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 22,
                          lineHeight: 28,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(16),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: text.regularTextStyle(
                          fontSize: 14,
                          lineHeight: 20,
                          color: AppColors.muted,
                        ),
                      ),
                      Gap(16),

                      // Remaining calories & macros card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.pearl,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  remainingLabel,
                                  style: text.mediumTextStyle(
                                    fontSize: 12,
                                    lineHeight: 16,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Text(
                                  remainingValue,
                                  style: text.boldTextStyle(
                                    fontSize: 14,
                                    lineHeight: 20,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ],
                            ),
                            Gap(10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Container(
                                width: double.infinity,
                                height: 8.h,
                                color: AppColors.white,
                                alignment: Alignment.centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: clampedProgress,
                                  child: Container(
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.coral,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  proteinText,
                                  style: text.mediumTextStyle(
                                    fontSize: 12,
                                    lineHeight: 16,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Text(
                                  carbsText,
                                  style: text.mediumTextStyle(
                                    fontSize: 12,
                                    lineHeight: 16,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Text(
                                  fatText,
                                  style: text.mediumTextStyle(
                                    fontSize: 12,
                                    lineHeight: 16,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
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
                          onTap: onDone ?? Get.back,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 16.h,
                            ),
                            child: Center(
                              child: Text(
                                primaryLabel,
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
                      onTap: onUndo ?? Get.back,
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        child: Text(
                          secondaryLabel,
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
