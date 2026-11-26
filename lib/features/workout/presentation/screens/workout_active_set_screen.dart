import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_rest_time_sheet.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_rpe_feedback_sheet.dart';

/// Figma "08 · Workout — Active Set Logging & Rest Timer".
class WorkoutActiveSetScreen extends GetView<WorkoutController> {
  const WorkoutActiveSetScreen({super.key});

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
              // Top bar: minimize + EXERCISE 1 OF 6 + elapsed dark pill
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 10.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Material(
                          color: AppColors.pearl,
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: Get.back,
                            child: SizedBox.square(
                              dimension: 40.r,
                              child: Center(
                                child: SvgPicture.asset(
                                  IconPath.hwChevDown,
                                  width: 18.r,
                                  height: 18.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Obx(() {
                            final idx = controller.activeExerciseIdx.value;
                            final ex = controller.exercises[idx];
                            return Column(
                              children: [
                                Text(
                                  'home_workout.active_set.exercise_of'
                                      .trParams({
                                        'current': '${idx + 1}',
                                        'total':
                                            '${controller.exercises.length}',
                                      }),
                                  style: text.boldTextStyle(
                                    fontSize: 10.5,
                                    letterSpacing: 0.7,
                                    color: AppColors.muted,
                                  ),
                                ),
                                Gap(2),
                                Text(
                                  ex.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: text.boldTextStyle(
                                    fontSize: 17,
                                    lineHeight: 21,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.ink,
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 7.r,
                                height: 7.r,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.coral,
                                ),
                              ),
                              Gap.h(6),
                              Text(
                                '12:34',
                                style: text.boldTextStyle(
                                  fontSize: 13,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(12),
                    // 6-segment exercise progress bar
                    Obx(
                      () => Row(
                        children: List.generate(
                          controller.exercises.length,
                          (i) => Expanded(
                            child: Container(
                              height: 3.5.h,
                              margin: EdgeInsets.only(
                                right: i == controller.exercises.length - 1
                                    ? 0
                                    : 5.w,
                              ),
                              decoration: BoxDecoration(
                                color: i <= controller.activeExerciseIdx.value
                                    ? AppColors.coral
                                    : AppColors.line,
                                borderRadius: BorderRadius.circular(99.r),
                              ),
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
                  padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Exercise preview + recommendation
                      Obx(() {
                        final ex =
                            controller.exercises[controller
                                .activeExerciseIdx
                                .value];
                        final recommendedValue = ex.recommendedKg > 0
                            ? 'home_workout.active_set.recommended_kg'
                                  .trParams({'kg': '${ex.recommendedKg}'})
                            : 'home_workout.active_set.bodyweight'.tr;
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => controller.openExerciseDetail(
                                controller.activeExerciseIdx.value,
                              ),
                              child: SizedBox.square(
                                dimension: 92.r,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18.r),
                                      child: Image.asset(
                                        ex.imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        width: 34.r,
                                        height: 34.r,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.white,
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            IconPath.hwPlay,
                                            width: 14.r,
                                            height: 14.r,
                                            colorFilter: const ColorFilter.mode(
                                              AppColors.cta,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Gap.h(14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'home_workout.active_set.target'.tr,
                                    style: text.regularTextStyle(
                                      fontSize: 12.5,
                                      color: AppColors.muted,
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    'home_workout.active_set.recommended'
                                        .trParams({'value': recommendedValue}),
                                    style: text.boldTextStyle(
                                      fontSize: 19,
                                      lineHeight: 23,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  Gap(8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.peach,
                                      borderRadius: BorderRadius.circular(99.r),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          IconPath.hwSpark,
                                          width: 13.r,
                                          height: 13.r,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.cta,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Gap.h(5),
                                        Flexible(
                                          child: Text(
                                            'home_workout.active_set.milon_tip'
                                                .tr,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: text.semiBoldTextStyle(
                                              fontSize: 11.5,
                                              color: AppColors.cta,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                      Gap(22),
                      Text(
                        'home_workout.active_set.log_sets'.tr,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          lineHeight: 22,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(12),
                      // Sets table card
                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 30.w,
                                    child: Text(
                                      'home_workout.active_set.col_set'.tr,
                                      style: text.boldTextStyle(
                                        fontSize: 10.5,
                                        color: AppColors.subtle,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'home_workout.active_set.col_previous'
                                          .tr,
                                      style: text.boldTextStyle(
                                        fontSize: 10.5,
                                        color: AppColors.subtle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 64.w,
                                    child: Text(
                                      'home_workout.active_set.col_kg'.tr,
                                      textAlign: TextAlign.center,
                                      style: text.boldTextStyle(
                                        fontSize: 10.5,
                                        color: AppColors.subtle,
                                      ),
                                    ),
                                  ),
                                  Gap.h(8),
                                  SizedBox(
                                    width: 64.w,
                                    child: Text(
                                      'home_workout.active_set.col_reps'.tr,
                                      textAlign: TextAlign.center,
                                      style: text.boldTextStyle(
                                        fontSize: 10.5,
                                        color: AppColors.subtle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 44.w),
                                ],
                              ),
                            ),
                            Gap(8),
                            Obx(
                              () => Column(
                                children: List.generate(
                                  controller.activeSets.length,
                                  (i) {
                                    final s = controller.activeSets[i];
                                    final isNextActive =
                                        !s.completed &&
                                        (i == 0 ||
                                            controller
                                                .activeSets[i - 1]
                                                .completed);
                                    final rowBg = s.completed
                                        ? AppColors.mintRow
                                        : (isNextActive
                                              ? AppColors.peach
                                              : AppColors.pearl);

                                    return Container(
                                      margin: EdgeInsets.only(bottom: 8.h),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: rowBg,
                                        borderRadius: BorderRadius.circular(
                                          14.r,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 24.w,
                                            child: Text(
                                              '${s.setNumber}',
                                              style: text.boldTextStyle(
                                                fontSize: 15,
                                                color: s.completed
                                                    ? AppColors.emerald
                                                    : AppColors.ink,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              s.previousLabel,
                                              style: text.regularTextStyle(
                                                fontSize: 12.5,
                                                color: AppColors.muted,
                                              ),
                                            ),
                                          ),
                                          _SetValueBox(
                                            value: '${s.kg}',
                                            highlighted: isNextActive,
                                          ),
                                          Gap.h(8),
                                          _SetValueBox(
                                            value: '${s.reps}',
                                            highlighted: isNextActive,
                                          ),
                                          Gap.h(10),
                                          GestureDetector(
                                            onTap: () => controller
                                                .toggleSetCompleted(i),
                                            child: Container(
                                              width: 34.r,
                                              height: 34.r,
                                              decoration: BoxDecoration(
                                                color: s.completed
                                                    ? AppColors.emerald
                                                    : AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                border: s.completed
                                                    ? null
                                                    : Border.all(
                                                        color: AppColors.coral,
                                                        width: 1.5,
                                                      ),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  IconPath.hwCheck,
                                                  width: 16.r,
                                                  height: 16.r,
                                                  colorFilter: ColorFilter.mode(
                                                    s.completed
                                                        ? AppColors.white
                                                        : AppColors.coral,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Gap(4),
                            GestureDetector(
                              onTap: controller.addSet,
                              behavior: HitTestBehavior.opaque,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      IconPath.hwPlus,
                                      width: 14.r,
                                      height: 14.r,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.cta,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Gap.h(6),
                                    Text(
                                      'home_workout.active_set.add_set'.tr,
                                      style: text.semiBoldTextStyle(
                                        fontSize: 13.5,
                                        color: AppColors.cta,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(16),
                      // Rest timer card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.pearl,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      IconPath.hwClock,
                                      width: 16.r,
                                      height: 16.r,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.ink,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Gap.h(6),
                                    Text(
                                      'home_workout.active_set.rest_timer'
                                          .tr,
                                      style: text.boldTextStyle(
                                        fontSize: 14.5,
                                        color: AppColors.ink,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => WorkoutRestTimeSheet.show(context),
                                  child: Text(
                                    'home_workout.active_set.per_set_custom'
                                        .tr,
                                    style: text.mediumTextStyle(
                                      fontSize: 12,
                                      color: AppColors.muted,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(16),
                            Obx(() {
                              final secs = controller.restSecondsLeft.value;
                              final total = controller.restTotalSeconds.value;
                              final ratio = total > 0
                                  ? (secs / total).clamp(0.0, 1.0)
                                  : 0.0;

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _RestStepChip(
                                    label: 'home_workout.common.minus_15s'.tr,
                                    onTap: () => controller.adjustRestTimer(-15),
                                  ),
                                  SizedBox.square(
                                    dimension: 120.r,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CustomPaint(
                                          size: Size.square(120.r),
                                          painter: _RestRingPainter(
                                            progress: ratio,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              controller.formatMmSs(secs),
                                              style: text.boldTextStyle(
                                                fontSize: 24,
                                                lineHeight: 28,
                                                color: AppColors.ink,
                                              ),
                                            ),
                                            Text(
                                              'home_workout.common.rest'.tr,
                                              style: text.boldTextStyle(
                                                fontSize: 10,
                                                letterSpacing: 0.8,
                                                color: AppColors.muted,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  _RestStepChip(
                                    label: 'home_workout.common.plus_15s'.tr,
                                    onTap: () => controller.adjustRestTimer(15),
                                  ),
                                ],
                              );
                            }),
                            Gap(12),
                            GestureDetector(
                              onTap: controller.skipRest,
                              child: Text(
                                'home_workout.active_set.skip_rest'.tr,
                                style: text.semiBoldTextStyle(
                                  fontSize: 13.5,
                                  color: AppColors.cta,
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
              // Bottom playback control bar
              Container(
                color: AppColors.white,
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  10.h,
                  20.w,
                  math.max(MediaQuery.viewPaddingOf(context).bottom, 20.0),
                ),
                child: Row(
                  children: [
                    _SquareIconBtn(
                      iconPath: IconPath.hwBack,
                      onTap: controller.prevExercise,
                    ),
                    Gap.h(12),
                    Expanded(
                      child: AppPrimaryButton(
                        label: 'home_workout.active_set.complete_set'
                            .trParams({'number': '3'}),
                        onPressed: () => WorkoutRpeFeedbackSheet.show(context),
                      ),
                    ),
                    Gap.h(12),
                    _SquareIconBtn(
                      iconPath: IconPath.hwSkip,
                      onTap: controller.nextExerciseOrCircuit,
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

class _SetValueBox extends StatelessWidget {
  const _SetValueBox({required this.value, required this.highlighted});

  final String value;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 36.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(11.r),
        border: highlighted
            ? Border.all(color: AppColors.coral, width: 1.5)
            : null,
      ),
      child: Text(
        value,
        style: AppTextStyle(context).boldTextStyle(
          fontSize: 15,
          color: AppColors.ink,
        ),
      ),
    );
  }
}

class _RestStepChip extends StatelessWidget {
  const _RestStepChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          label,
          style: AppTextStyle(context).semiBoldTextStyle(
            fontSize: 13.5,
            color: AppColors.ink,
          ),
        ),
      ),
    );
  }
}

class _SquareIconBtn extends StatelessWidget {
  const _SquareIconBtn({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.pearl,
      borderRadius: BorderRadius.circular(16.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 52.r,
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 20.r,
              height: 20.r,
              colorFilter: const ColorFilter.mode(
                AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RestRingPainter extends CustomPainter {
  _RestRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 5;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.line
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7,
    );

    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi * 2 * progress.clamp(0.0, 1.0),
      false,
      Paint()
        ..color = AppColors.coral
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _RestRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
