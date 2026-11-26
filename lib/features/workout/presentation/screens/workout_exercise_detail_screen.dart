import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Figma "07 · Workout — Exercise Detail & Anatomy".
class WorkoutExerciseDetailScreen extends GetView<WorkoutController> {
  const WorkoutExerciseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Obx(() {
          final ex = controller.currentExercise;

          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 36.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video player hero
                SizedBox(
                  height: 295.h,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(ex.imagePath, fit: BoxFit.cover),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.ink.withValues(alpha: 0.25),
                              AppColors.ink.withValues(alpha: 0.12),
                              AppColors.ink.withValues(alpha: 0.65),
                            ],
                          ),
                        ),
                      ),
                      // Center play button
                      Center(
                        child: GestureDetector(
                          onTap: controller.openActiveSet,
                          child: Container(
                            width: 68.r,
                            height: 68.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.ink.withValues(alpha: 0.45),
                              border: Border.all(
                                color: AppColors.white.withValues(alpha: 0.7),
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.hwPlay,
                                width: 26.r,
                                height: 26.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Top controls & bottom scrub bar
                      SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _OverlayButton(
                                    onTap: Get.back,
                                    child: SvgPicture.asset(
                                      IconPath.chevLeft,
                                      width: 20.r,
                                      height: 20.r,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.ink,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: controller.toggleSpeed,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 9.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white.withValues(
                                          alpha: 0.85,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          99.r,
                                        ),
                                      ),
                                      child: Text(
                                        '${controller.playbackSpeed.value}×',
                                        style: text.boldTextStyle(
                                          fontSize: 13,
                                          lineHeight: 16,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap.h(8),
                                  _OverlayButton(
                                    onTap: controller.openActiveSet,
                                    child: SvgPicture.asset(
                                      IconPath.hwMore,
                                      width: 18.r,
                                      height: 18.r,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.ink,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(99.r),
                                child: LinearProgressIndicator(
                                  value: 0.28,
                                  minHeight: 4.h,
                                  backgroundColor: AppColors.white.withValues(
                                    alpha: 0.35,
                                  ),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        AppColors.coral,
                                      ),
                                ),
                              ),
                              Gap(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '0:12',
                                    style: text.mediumTextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    'home_workout.exercise_detail.demo'
                                        .trParams({'duration': '0:45'}),
                                    style: text.mediumTextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(6),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ex.name,
                        style: text.boldTextStyle(
                          fontSize: 26,
                          lineHeight: 30,
                          letterSpacing: -0.4,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(12),
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: [
                          ...ex.primaryMuscles.map(
                            (m) => _DetailTag(
                              label: m.tr,
                              bg: AppColors.peach,
                              fg: AppColors.cta,
                            ),
                          ),
                          _DetailTag(
                            label: ex.equipmentLabel.tr,
                            bg: AppColors.pearl,
                            fg: AppColors.ink,
                          ),
                          _DetailTag(
                            label: ex.shortTarget.tr,
                            bg: AppColors.pearl,
                            fg: AppColors.ink,
                          ),
                        ],
                      ),
                      Gap(18),
                      // PRO TIP limeSoft card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          color: AppColors.limeSoft,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 36.r,
                              height: 36.r,
                              decoration: BoxDecoration(
                                color: AppColors.lime,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  IconPath.hwBolt,
                                  width: 18.r,
                                  height: 18.r,
                                ),
                              ),
                            ),
                            Gap.h(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'home_workout.exercise_detail.pro_tip'.tr,
                                    style: text.boldTextStyle(
                                      fontSize: 11,
                                      letterSpacing: 0.6,
                                      color: AppColors.emerald,
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    ex.proTip.tr,
                                    style: text.regularTextStyle(
                                      fontSize: 13.5,
                                      lineHeight: 19,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(24),
                      Text(
                        'home_workout.exercise_detail.how_to'.tr,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          lineHeight: 22,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(14),
                      ...List.generate(ex.steps.length, (i) {
                        final numStr = (i + 1).toString().padLeft(2, '0');
                        return Padding(
                          padding: EdgeInsets.only(bottom: 14.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 32.w,
                                child: Text(
                                  numStr,
                                  style: text.boldTextStyle(
                                    fontSize: 16,
                                    lineHeight: 20,
                                    color: AppColors.coral,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  ex.steps[i].tr,
                                  style: text.regularTextStyle(
                                    fontSize: 14,
                                    lineHeight: 20,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      Gap(10),
                      Text(
                        'home_workout.exercise_detail.muscles_worked'.tr,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          lineHeight: 22,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(12),
                      Row(
                        children: [
                          Expanded(
                            child: _AnatomyCard(
                              title: 'home_workout.exercise_detail.front'.tr,
                              svgPath: IconPath.obBodyMapFront,
                            ),
                          ),
                          Gap.h(12),
                          Expanded(
                            child: _AnatomyCard(
                              title: 'home_workout.exercise_detail.back'.tr,
                              svgPath: IconPath.obBodyMapBack,
                            ),
                          ),
                        ],
                      ),
                      Gap(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 9.r,
                            height: 9.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.coral,
                            ),
                          ),
                          Gap.h(6),
                          Text(
                            'home_workout.exercise_detail.primary'.tr,
                            style: text.regularTextStyle(
                              fontSize: 12,
                              color: AppColors.muted,
                            ),
                          ),
                          Gap.h(14),
                          Container(
                            width: 9.r,
                            height: 9.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.coral.withValues(alpha: 0.45),
                            ),
                          ),
                          Gap.h(6),
                          Text(
                            'home_workout.exercise_detail.assisted'.tr,
                            style: text.regularTextStyle(
                              fontSize: 12,
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
          );
        }),
      ),
    );
  }
}

class _OverlayButton extends StatelessWidget {
  const _OverlayButton({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white.withValues(alpha: 0.85),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(dimension: 40.r, child: Center(child: child)),
      ),
    );
  }
}

class _DetailTag extends StatelessWidget {
  const _DetailTag({required this.label, required this.bg, required this.fg});

  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: Text(
        label,
        style: AppTextStyle(context).semiBoldTextStyle(
          fontSize: 12.5,
          lineHeight: 16,
          color: fg,
        ),
      ),
    );
  }
}

class _AnatomyCard extends StatelessWidget {
  const _AnatomyCard({required this.title, required this.svgPath});

  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.pearl,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyle(context).boldTextStyle(
              fontSize: 11,
              letterSpacing: 0.8,
              color: AppColors.muted,
            ),
          ),
          Gap(8),
          Expanded(child: SvgPicture.asset(svgPath, fit: BoxFit.contain)),
        ],
      ),
    );
  }
}
