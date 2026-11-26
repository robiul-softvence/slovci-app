import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Figma "Hero Visual" (390 × 470) on "00a · Welcome": peach backdrop with
/// diagonal bands, the coach photo, the app icon badge and a glass preview
/// card. Every coordinate is in design pixels and scales with screen width,
/// so the composition keeps its proportions on any phone.
class WelcomeHero extends StatelessWidget {
  const WelcomeHero({super.key, required this.languageToggle});

  /// Rendered at the top-right, just below the system status bar.
  final Widget languageToggle;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.viewPaddingOf(context).top;

    return Container(
      width: double.infinity,
      height: 470.w,
      color: AppColors.peach,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          const _DiagonalBand(
            left: -60,
            top: 180.87,
            boxWidth: 253.13,
            boxHeight: 206.47,
            length: 260,
            color: AppColors.coral,
          ),
          _DiagonalBand(
            left: 150,
            top: 253.81,
            boxWidth: 220.36,
            boxHeight: 183.53,
            length: 220,
            color: AppColors.white.withValues(alpha: 0.7),
          ),
          _DiagonalBand(
            left: 250,
            top: 150.87,
            boxWidth: 253.13,
            boxHeight: 206.47,
            length: 260,
            color: AppColors.coral.withValues(alpha: 0.35),
          ),
          Positioned(
            left: 103.w,
            top: 92.w,
            width: 184.w,
            height: 204.w,
            child: const _CoachPhoto(),
          ),
          Positioned(left: 253.w, top: 236.w, child: const _AppIconBadge()),
          Positioned(
            left: 45.w,
            top: 300.w,
            width: 300.w,
            child: const _GlassPreviewCard(),
          ),
          Positioned(top: topInset + 10, right: 20.w, child: languageToggle),
        ],
      ),
    );
  }
}

/// A 70 px tall pill rotated −35°. [left]/[top]/[boxWidth]/[boxHeight] are
/// the rotated bounding box exactly as Figma exports it.
class _DiagonalBand extends StatelessWidget {
  const _DiagonalBand({
    required this.left,
    required this.top,
    required this.boxWidth,
    required this.boxHeight,
    required this.length,
    required this.color,
  });

  final double left;
  final double top;
  final double boxWidth;
  final double boxHeight;
  final double length;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left.w,
      top: top.w,
      width: boxWidth.w,
      height: boxHeight.w,
      child: OverflowBox(
        minWidth: 0,
        minHeight: 0,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: Transform.rotate(
          angle: -35 * math.pi / 180,
          child: Container(
            width: length.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(35.w),
            ),
          ),
        ),
      ),
    );
  }
}

class _CoachPhoto extends StatelessWidget {
  const _CoachPhoto();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 4.w),
        borderRadius: BorderRadius.circular(28.w),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.w),
        child: Image.asset(ImagePath.coachMilon, fit: BoxFit.cover),
      ),
    );
  }
}

class _AppIconBadge extends StatelessWidget {
  const _AppIconBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cta,
        borderRadius: BorderRadius.circular(12.8.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.cta.withValues(alpha: 0.3),
            offset: Offset(0, 6.4.w),
            blurRadius: 8.w,
          ),
        ],
      ),
      child: SvgPicture.asset(
        IconPath.milonMarkWhite,
        width: 30.11.w,
        height: 19.71.w,
      ),
    );
  }
}

/// Figma "Glass/Light": 50 % white, 24 px background blur, soft drop shadow.
class _GlassPreviewCard extends StatelessWidget {
  const _GlassPreviewCard();

  static const Color _inkSoft = Color(0x99111318); // ink @ 60 %

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final radius = BorderRadius.circular(24.w);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.08),
            offset: Offset(0, 8.w),
            blurRadius: 24.w,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.5),
              borderRadius: radius,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.75),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.cta,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: SvgPicture.asset(
                        IconPath.dumbbell,
                        width: 18.w,
                        height: 18.w,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'common.welcome.preview_title'.tr,
                          style: text.boldTextStyle(
                            fontSize: 11,
                            color: _inkSoft,
                          ),
                        ),
                        Text(
                          'common.welcome.preview_session'.tr,
                          style: text.boldTextStyle(
                            fontSize: AppTextStyle.md,
                            color: AppColors.ink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.w),
                Row(
                  children: [
                    _StatTile(
                      value: '1,485',
                      label: 'common.welcome.stat_kcal'.tr,
                    ),
                    SizedBox(width: 8.w),
                    _StatTile(
                      value: '125g',
                      label: 'common.welcome.stat_protein'.tr,
                    ),
                    SizedBox(width: 8.w),
                    _StatTile(
                      value: '2.0 L',
                      label: 'common.welcome.stat_water'.tr,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: text.boldTextStyle(
                fontSize: AppTextStyle.lg,
                letterSpacing: -0.16,
                color: AppColors.ink,
              ),
            ),
            Text(
              label,
              style: text.mediumTextStyle(
                fontSize: 11,
                color: _GlassPreviewCard._inkSoft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
