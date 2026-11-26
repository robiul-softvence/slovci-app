import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

/// Figma "11c · Workout — Session Summary".
class WorkoutSessionSummaryScreen extends GetView<WorkoutController> {
  const WorkoutSessionSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

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
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
                child: Row(
                  children: [
                    Material(
                      color: AppColors.pearl,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => Get.offAllNamed(AppRoute.bottomNavScreen),
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
                    Expanded(
                      child: Text(
                        'home_workout.summary.title'.tr,
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          lineHeight: 22,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    Material(
                      color: AppColors.pearl,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => AppHelperFunctions.showSnackBar(
                          'home_workout.summary.shared'.tr,
                        ),
                        child: SizedBox.square(
                          dimension: 40.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.hwShare,
                              width: 18.r,
                              height: 18.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                  child: Column(
                    children: [
                      // Dark Hero Score Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(26.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'home_workout.summary.eyebrow'.trParams({
                                      'workout': 'FULL BODY STRENGTH',
                                    }),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: text.boldTextStyle(
                                      fontSize: 10.5,
                                      letterSpacing: 0.6,
                                      color: AppColors.white.withValues(
                                        alpha: 0.72,
                                      ),
                                    ),
                                  ),
                                ),
                                Gap.h(8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.lime,
                                    borderRadius: BorderRadius.circular(99.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        IconPath.hwSpark,
                                        width: 12.r,
                                        height: 12.r,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.ink,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      Gap.h(4),
                                      Text(
                                        'home_workout.summary.session_score'
                                            .tr,
                                        style: text.boldTextStyle(
                                          fontSize: 10,
                                          letterSpacing: 0.5,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(22),
                            SizedBox.square(
                              dimension: 136.r,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomPaint(
                                    size: Size.square(136.r),
                                    painter: _ScoreRingPainter(score: 0.98),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '98',
                                        style: text.boldTextStyle(
                                          fontSize: 42,
                                          lineHeight: 44,
                                          letterSpacing: -1,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        '/100',
                                        style: text.mediumTextStyle(
                                          fontSize: 13,
                                          color: AppColors.white.withValues(
                                            alpha: 0.65,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Gap(18),
                            Text(
                              'home_workout.summary.outstanding'.tr,
                              style: text.boldTextStyle(
                                fontSize: 22,
                                lineHeight: 26,
                                color: AppColors.white,
                              ),
                            ),
                            Gap(4),
                            Text(
                              'home_workout.summary.top_percent'.tr,
                              style: text.regularTextStyle(
                                fontSize: 13,
                                color: AppColors.white.withValues(alpha: 0.65),
                              ),
                            ),
                            Gap(18),
                            Divider(
                              height: 1,
                              color: AppColors.white.withValues(alpha: 0.12),
                            ),
                            Gap(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                _HeroMetric(
                                  value: '44:12',
                                  labelKey: 'home_workout.summary.duration',
                                ),
                                _HeroMetric(
                                  value: '18/18',
                                  labelKey: 'home_workout.common.sets',
                                ),
                                _HeroMetric(
                                  value: '3,240',
                                  labelKey: 'home_workout.summary.kg_volume',
                                ),
                                _HeroMetric(
                                  value: '318',
                                  labelKey: 'home_workout.common.kcal',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(14),
                      // Bright lime NEW PERSONAL RECORD banner
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          color: AppColors.lime,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44.r,
                              height: 44.r,
                              decoration: BoxDecoration(
                                color: AppColors.ink,
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  IconPath.hwTrophy,
                                  width: 22.r,
                                  height: 22.r,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.lime,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            Gap.h(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'home_workout.summary.new_record'.tr,
                                    style: text.boldTextStyle(
                                      fontSize: 11,
                                      letterSpacing: 0.6,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  Gap(2),
                                  Text(
                                    'Romanian Deadlift · 22 kg × 10',
                                    style: text.boldTextStyle(
                                      fontSize: 15,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(14),
                      // MILON Coach Analysis card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(22.r),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40.r,
                                  height: 40.r,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.coral,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconPath.milonMarkWhite,
                                      width: 22.r,
                                      height: 22.r,
                                    ),
                                  ),
                                ),
                                Gap.h(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MILON Coach',
                                      style: text.boldTextStyle(
                                        fontSize: 15,
                                        color: AppColors.ink,
                                      ),
                                    ),
                                    Text(
                                      'home_workout.summary.analysis_time'.tr,
                                      style: text.regularTextStyle(
                                        fontSize: 12,
                                        color: AppColors.muted,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gap(16),
                            ...controller.coachAnalysis.map(
                              (item) => Padding(
                                padding: EdgeInsets.only(bottom: 14.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 22.r,
                                      height: 22.r,
                                      margin: EdgeInsets.only(top: 1.h),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.peach,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          IconPath.hwCheck,
                                          width: 12.r,
                                          height: 12.r,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.cta,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap.h(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title.tr,
                                            style: text.boldTextStyle(
                                              fontSize: 14,
                                              color: AppColors.ink,
                                            ),
                                          ),
                                          Gap(2),
                                          Text(
                                            item.body.tr,
                                            style: text.regularTextStyle(
                                              fontSize: 13,
                                              lineHeight: 18,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Reply to coach bar
              Container(
                color: AppColors.white,
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  10.h,
                  20.w,
                  math.max(MediaQuery.viewPaddingOf(context).bottom, 16.0),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.w, 6.h, 6.w, 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.coachReplyController,
                          style: text.regularTextStyle(
                            fontSize: 14,
                            color: AppColors.ink,
                          ),
                          decoration: InputDecoration(
                            hintText: 'home_workout.summary.reply_hint'.tr,
                            hintStyle: text.regularTextStyle(
                              fontSize: 14,
                              color: AppColors.subtle,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                      Material(
                        color: AppColors.cta,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            controller.coachReplyController.clear();
                            Get.offAllNamed(AppRoute.bottomNavScreen);
                          },
                          child: SizedBox.square(
                            dimension: 40.r,
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.hwSend,
                                width: 18.r,
                                height: 18.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({required this.value, required this.labelKey});

  final String value;

  /// Translation key, resolved at build time.
  final String labelKey;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    return Column(
      children: [
        Text(
          value,
          style: text.boldTextStyle(
            fontSize: 17,
            lineHeight: 21,
            color: AppColors.white,
          ),
        ),
        Gap(2),
        Text(
          labelKey.tr,
          style: text.regularTextStyle(
            fontSize: 11.5,
            color: AppColors.white.withValues(alpha: 0.65),
          ),
        ),
      ],
    );
  }
}

class _ScoreRingPainter extends CustomPainter {
  _ScoreRingPainter({required this.score});

  final double score;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 6;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.white.withValues(alpha: 0.14)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9,
    );

    canvas.drawArc(
      rect,
      -math.pi / 2 + 0.08,
      (math.pi * 2 - 0.16) * score,
      false,
      Paint()
        ..color = AppColors.lime
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9
        ..strokeCap = StrokeCap.butt,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter oldDelegate) =>
      oldDelegate.score != score;
}
