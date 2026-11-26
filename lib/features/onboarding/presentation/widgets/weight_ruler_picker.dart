import 'package:flutter/material.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Interactive horizontal weight ruler for "01b · Target Weight & Pace".
/// Supports horizontal drag and quick tap on visible tick labels.
class WeightRulerPicker extends StatelessWidget {
  const WeightRulerPicker({
    super.key,
    required this.valueKg,
    required this.onChanged,
    this.minKg = 35,
    this.maxKg = 150,
  });

  final int valueKg;
  final ValueChanged<int> onChanged;
  final int minKg;
  final int maxKg;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final visibleValues = List.generate(5, (i) => valueKg - 2 + i);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        final v = details.primaryVelocity ?? 0;
        if (v < -80 && valueKg < maxKg) {
          onChanged(valueKg + 1);
        } else if (v > 80 && valueKg > minKg) {
          onChanged(valueKg - 1);
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: 44.h,
            width: double.infinity,
            child: CustomPaint(
              painter: _RulerTicksPainter(),
            ),
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: visibleValues.map((kg) {
              final isCenter = kg == valueKg;
              final inRange = kg >= minKg && kg <= maxKg;
              return GestureDetector(
                onTap: inRange ? () => onChanged(kg) : null,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  child: Text(
                    inRange ? '$kg' : '',
                    style: isCenter
                        ? text.boldTextStyle(
                            fontSize: 13,
                            lineHeight: 16,
                            color: AppColors.cta,
                          )
                        : text.mediumTextStyle(
                            fontSize: 12,
                            lineHeight: 16,
                            color: AppColors.subtle,
                          ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _RulerTicksPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const totalTicks = 20; // 4 intervals × 5 sub-ticks
    final spacing = size.width / totalTicks;
    final centerIndex = totalTicks ~/ 2;

    for (int i = 0; i <= totalTicks; i++) {
      final x = i * spacing;
      final isCenter = i == centerIndex;
      final isMajor = i % 5 == 0;

      final paint = Paint()
        ..color = isCenter ? AppColors.coral : AppColors.line
        ..strokeWidth = isCenter ? 2.5 : 1.5
        ..strokeCap = StrokeCap.round;

      final topY = isCenter ? 4.0 : (isMajor ? 6.0 : 18.0);
      final bottomY = size.height - 4.0;
      canvas.drawLine(Offset(x, topY), Offset(x, bottomY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Weight trajectory curve chart for "01b · Target Weight & Pace".
class WeightProjectionChart extends StatelessWidget {
  const WeightProjectionChart({
    super.key,
    required this.isLosingWeight,
  });

  final bool isLosingWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82.h,
      width: double.infinity,
      child: CustomPaint(
        painter: _ProjectionChartPainter(isLosingWeight: isLosingWeight),
      ),
    );
  }
}

class _ProjectionChartPainter extends CustomPainter {
  _ProjectionChartPainter({required this.isLosingWeight});

  final bool isLosingWeight;

  @override
  void paint(Canvas canvas, Size size) {
    final startY = isLosingWeight ? size.height * 0.20 : size.height * 0.78;
    final endY = isLosingWeight ? size.height * 0.78 : size.height * 0.22;
    const startX = 8.0;
    final endX = size.width - 14.0;

    // Dashed green horizontal target line
    final dashPaint = Paint()
      ..color = AppColors.emerald.withValues(alpha: 0.45)
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;
    const dashWidth = 4.0;
    const dashSpace = 5.0;
    double x = 0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, endY), Offset(x + dashWidth, endY), dashPaint);
      x += dashWidth + dashSpace;
    }

    // Smooth coral trajectory curve
    final curvePaint = Paint()
      ..color = AppColors.coral
      ..strokeWidth = 2.6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(startX, startY)
      ..cubicTo(
        size.width * 0.35,
        startY + (endY - startY) * 0.25,
        size.width * 0.65,
        startY + (endY - startY) * 0.78,
        endX,
        endY,
      );
    canvas.drawPath(path, curvePaint);

    // Start dot (solid coral)
    canvas.drawCircle(
      Offset(startX, startY),
      5.0,
      Paint()..color = AppColors.coral,
    );

    // End dot (white fill + emerald stroke)
    canvas.drawCircle(
      Offset(endX, endY),
      7.5,
      Paint()..color = AppColors.white,
    );
    canvas.drawCircle(
      Offset(endX, endY),
      7.5,
      Paint()
        ..color = AppColors.emerald
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.8,
    );
  }

  @override
  bool shouldRepaint(covariant _ProjectionChartPainter oldDelegate) =>
      oldDelegate.isLosingWeight != isLosingWeight;
}
