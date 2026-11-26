import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Interactive radial arc dial for "04 · Nutrition & Budget" (€20 – €150).
class BudgetArcDial extends StatelessWidget {
  const BudgetArcDial({
    super.key,
    required this.budgetEur,
    required this.costPerMealEur,
    required this.onDecrease,
    required this.onIncrease,
    this.minEur = 20,
    this.maxEur = 150,
  });

  final int budgetEur;
  final double costPerMealEur;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final int minEur;
  final int maxEur;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final fraction = ((budgetEur - minEur) / (maxEur - minEur)).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 22.h, 14.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CircleStepButton(
                iconPath: IconPath.obMinus,
                onTap: onDecrease,
              ),
              SizedBox(
                width: 214.r,
                height: 204.r,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size.square(204.r),
                      painter: _BudgetArcPainter(progress: fraction),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'WEEKLY BUDGET',
                          style: text.boldTextStyle(
                            fontSize: 11,
                            lineHeight: 14,
                            letterSpacing: 0.7,
                            color: AppColors.muted,
                          ),
                        ),
                        Gap(4),
                        Text(
                          '€$budgetEur',
                          style: text.boldTextStyle(
                            fontSize: 44,
                            lineHeight: 48,
                            letterSpacing: -1.2,
                            color: AppColors.ink,
                          ),
                        ),
                        Gap(10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lime,
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                          child: Text(
                            '≈ €${costPerMealEur.toStringAsFixed(2)} / meal',
                            style: text.semiBoldTextStyle(
                              fontSize: 13,
                              lineHeight: 16,
                              color: AppColors.ink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _CircleStepButton(
                iconPath: IconPath.obPlus,
                onTap: onIncrease,
              ),
            ],
          ),
          Gap(4),
          Text(
            '€$minEur ———————— €$maxEur',
            style: text.mediumTextStyle(
              fontSize: 12,
              lineHeight: 16,
              color: AppColors.subtle,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleStepButton extends StatelessWidget {
  const _CircleStepButton({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.pearl,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 42.r,
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 18.r,
              height: 18.r,
            ),
          ),
        ),
      ),
    );
  }
}

class _BudgetArcPainter extends CustomPainter {
  _BudgetArcPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 + 8);
    final radius = size.width * 0.43;
    const startAngle = math.pi * 0.75; // 135°
    const sweepAngle = math.pi * 1.5; // 270°
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = AppColors.line
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(rect, startAngle, sweepAngle, false, trackPaint);

    final activeSweep = sweepAngle * progress;
    final activePaint = Paint()
      ..color = AppColors.coral
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(rect, startAngle, activeSweep, false, activePaint);

    // Knob at active end
    final knobAngle = startAngle + activeSweep;
    final knobCenter = Offset(
      center.dx + radius * math.cos(knobAngle),
      center.dy + radius * math.sin(knobAngle),
    );
    canvas.drawCircle(knobCenter, 12, Paint()..color = AppColors.white);
    canvas.drawCircle(
      knobCenter,
      12,
      Paint()
        ..color = AppColors.coral
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5,
    );
  }

  @override
  bool shouldRepaint(covariant _BudgetArcPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
