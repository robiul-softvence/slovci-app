import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Figma "10 · Workout — Timed Circuit Player".
class WorkoutTimedCircuitScreen extends GetView<WorkoutController> {
  const WorkoutTimedCircuitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    _CircleIconBtn(
                      iconPath: IconPath.hwClose,
                      onTap: Get.back,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'HIIT CIRCUIT · LOW IMPACT',
                            style: text.boldTextStyle(
                              fontSize: 10.5,
                              letterSpacing: 0.7,
                              color: AppColors.muted,
                            ),
                          ),
                          Gap(2),
                          Text(
                            'Cardio Burn',
                            style: text.boldTextStyle(
                              fontSize: 18,
                              lineHeight: 22,
                              color: AppColors.ink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _CircleIconBtn(
                      iconPath: IconPath.hwMore,
                      onTap: controller.openRestCountdown,
                    ),
                  ],
                ),
                Gap(14),
                // ROUND 1 / 4 + dots
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.peach,
                          borderRadius: BorderRadius.circular(99.r),
                        ),
                        child: Text(
                          'ROUND ${controller.circuitRound.value} / 4',
                          style: text.boldTextStyle(
                            fontSize: 11,
                            letterSpacing: 0.6,
                            color: AppColors.cta,
                          ),
                        ),
                      ),
                      Gap.h(10),
                      ...List.generate(4, (i) {
                        final active = i + 1 == controller.circuitRound.value;
                        return Container(
                          width: active ? 24.w : 8.r,
                          height: 8.r,
                          margin: EdgeInsets.only(right: i == 3 ? 0 : 6.w),
                          decoration: BoxDecoration(
                            color: active ? AppColors.coral : AppColors.line,
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Gap(14),
                Text(
                  'TOTAL TIME',
                  style: text.boldTextStyle(
                    fontSize: 11,
                    letterSpacing: 0.8,
                    color: AppColors.muted,
                  ),
                ),
                Gap(2),
                Text(
                  '08:42',
                  style: text.boldTextStyle(
                    fontSize: 52,
                    lineHeight: 56,
                    letterSpacing: -1.5,
                    color: AppColors.ink,
                  ),
                ),
                Gap(14),
                // Exercise demo video card
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          ImagePath.exCircuitDemo,
                          fit: BoxFit.cover,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.ink.withValues(alpha: 0.1),
                                AppColors.ink.withValues(alpha: 0.12),
                                AppColors.ink.withValues(alpha: 0.62),
                              ],
                            ),
                          ),
                        ),
                        // Top pills
                        Positioned(
                          top: 14.h,
                          left: 14.w,
                          right: 14.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withValues(
                                    alpha: 0.92,
                                  ),
                                  borderRadius: BorderRadius.circular(99.r),
                                ),
                                child: Text(
                                  'NOW · WORK',
                                  style: text.boldTextStyle(
                                    fontSize: 11,
                                    letterSpacing: 0.6,
                                    color: AppColors.cta,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: controller.toggleSpeed,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white.withValues(
                                      alpha: 0.92,
                                    ),
                                    borderRadius: BorderRadius.circular(99.r),
                                  ),
                                  child: Obx(
                                    () => Text(
                                      '${controller.playbackSpeed.value}×',
                                      style: text.boldTextStyle(
                                        fontSize: 12,
                                        color: AppColors.ink,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Center play icon
                        Center(
                          child: Container(
                            width: 62.r,
                            height: 62.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.ink.withValues(alpha: 0.42),
                              border: Border.all(
                                color: AppColors.white.withValues(alpha: 0.75),
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.hwPlay,
                                width: 22.r,
                                height: 22.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Bottom dark frosted card
                        Positioned(
                          left: 14.w,
                          right: 14.w,
                          bottom: 14.h,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.ink.withValues(alpha: 0.68),
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jumping Jacks',
                                        style: text.boldTextStyle(
                                          fontSize: 20,
                                          lineHeight: 24,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Gap(3),
                                      Text(
                                        'Step-out variation · no wrist load',
                                        style: text.regularTextStyle(
                                          fontSize: 12,
                                          color: AppColors.white.withValues(
                                            alpha: 0.8,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.formatShortMmSs(
                                      controller.circuitWorkSeconds.value,
                                    ),
                                    style: text.boldTextStyle(
                                      fontSize: 28,
                                      lineHeight: 32,
                                      color: AppColors.white,
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
                Gap(14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99.r),
                  child: LinearProgressIndicator(
                    value: 0.70,
                    minHeight: 6.h,
                    backgroundColor: AppColors.line,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.coral,
                    ),
                  ),
                ),
                Gap(14),
                // UP NEXT card
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          ImagePath.exForearmPlank,
                          width: 54.r,
                          height: 54.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gap.h(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UP NEXT',
                              style: text.boldTextStyle(
                                fontSize: 10.5,
                                letterSpacing: 0.6,
                                color: AppColors.muted,
                              ),
                            ),
                            Gap(2),
                            Text(
                              'Mountain Climbers · Forearms',
                              style: text.boldTextStyle(
                                fontSize: 14,
                                lineHeight: 18,
                                color: AppColors.ink,
                              ),
                            ),
                            Gap(2),
                            Text(
                              '40 sec work · 20 sec rest',
                              style: text.regularTextStyle(
                                fontSize: 12,
                                color: AppColors.muted,
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
                      Gap.h(6),
                    ],
                  ),
                ),
                Gap(20),
                // Playback controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CircleIconBtn(
                      iconPath: IconPath.hwBack,
                      size: 52,
                      onTap: () {},
                    ),
                    Gap.h(22),
                    Obx(() {
                      final paused = controller.circuitPaused.value;
                      return Material(
                        color: AppColors.cta,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () => controller.circuitPaused.toggle(),
                          child: SizedBox.square(
                            dimension: 68.r,
                            child: Center(
                              child: SvgPicture.asset(
                                paused ? IconPath.hwPlay : IconPath.hwPause,
                                width: 24.r,
                                height: 24.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    Gap.h(22),
                    _CircleIconBtn(
                      iconPath: IconPath.hwSkip,
                      size: 52,
                      onTap: controller.openRestCountdown,
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

class _CircleIconBtn extends StatelessWidget {
  const _CircleIconBtn({
    required this.iconPath,
    required this.onTap,
    this.size = 40,
  });

  final String iconPath;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.pearl,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: size.r,
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 18.r,
              height: 18.r,
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
