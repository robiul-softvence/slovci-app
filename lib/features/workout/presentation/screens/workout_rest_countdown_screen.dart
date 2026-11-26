import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Figma "11 · Workout — Rest Countdown Between Rounds".
class WorkoutRestCountdownScreen extends GetView<WorkoutController> {
  const WorkoutRestCountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.peach,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
            child: Column(
              children: [
                Text(
                  'ROUND 1 COMPLETE',
                  style: text.boldTextStyle(
                    fontSize: 11.5,
                    letterSpacing: 0.8,
                    color: AppColors.cta,
                  ),
                ),
                Gap(6),
                Text(
                  "Breathe. You're doing great.",
                  textAlign: TextAlign.center,
                  style: text.boldTextStyle(
                    fontSize: 22,
                    lineHeight: 28,
                    color: AppColors.ink,
                  ),
                ),
                const Spacer(),
                // Large circular countdown ring
                Obx(() {
                  final secs = controller.roundRestSeconds.value;
                  final total = controller.roundRestTotal.value;
                  final ratio = total > 0 ? (secs / total).clamp(0.0, 1.0) : 0.0;

                  return SizedBox.square(
                    dimension: 256.r,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: Size.square(256.r),
                          painter: _CountdownRingPainter(progress: ratio),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'REST',
                              style: text.boldTextStyle(
                                fontSize: 12,
                                letterSpacing: 1.0,
                                color: AppColors.cta,
                              ),
                            ),
                            Gap(6),
                            Text(
                              controller.formatShortMmSs(secs),
                              style: text.boldTextStyle(
                                fontSize: 64,
                                lineHeight: 68,
                                letterSpacing: -2,
                                color: AppColors.ink,
                              ),
                            ),
                            Gap(4),
                            Text(
                              'of ${controller.formatShortMmSs(total)}',
                              style: text.mediumTextStyle(
                                fontSize: 14,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                const Spacer(),
                // 3 stat cards
                Row(
                  children: const [
                    Expanded(
                      child: _RoundStatCard(value: '142', label: 'avg bpm'),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _RoundStatCard(value: '96', label: 'kcal'),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _RoundStatCard(value: '4:00', label: 'round'),
                    ),
                  ],
                ),
                Gap(12),
                // Next round preview card
                Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42.r,
                        height: 42.r,
                        decoration: BoxDecoration(
                          color: AppColors.peach,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.hwFlame,
                            width: 20.r,
                            height: 20.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.cta,
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
                              'NEXT · ROUND 2 OF 4',
                              style: text.boldTextStyle(
                                fontSize: 10.5,
                                letterSpacing: 0.6,
                                color: AppColors.muted,
                              ),
                            ),
                            Gap(2),
                            Text(
                              'Squat Jumps → Mountain Climbers',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: text.boldTextStyle(
                                fontSize: 14,
                                color: AppColors.ink,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        IconPath.hwChevDown,
                        width: 16.r,
                        height: 16.r,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Bottom actions: +15s & Skip Rest
                Row(
                  children: [
                    SizedBox(
                      width: 96.w,
                      height: 52.h,
                      child: Material(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () => controller.addRoundRestSeconds(15),
                          child: Center(
                            child: Text(
                              '+15s',
                              style: text.boldTextStyle(
                                fontSize: 15,
                                color: AppColors.ink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap.h(12),
                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        child: Material(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(16.r),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: controller.openEndFeedback,
                            child: Center(
                              child: Text(
                                'Skip Rest',
                                style: text.boldTextStyle(
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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

class _RoundStatCard extends StatelessWidget {
  const _RoundStatCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: text.boldTextStyle(
              fontSize: 20,
              lineHeight: 24,
              color: AppColors.ink,
            ),
          ),
          Gap(3),
          Text(
            label,
            style: text.regularTextStyle(
              fontSize: 12,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _CountdownRingPainter extends CustomPainter {
  _CountdownRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 8;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12,
    );

    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi * 2 * progress.clamp(0.0, 1.0),
      false,
      Paint()
        ..color = AppColors.coral
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.butt,
    );
  }

  @override
  bool shouldRepaint(covariant _CountdownRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
