import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Figma "06 · Workout — Session Overview".
class WorkoutSessionOverviewScreen extends GetView<WorkoutController> {
  const WorkoutSessionOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 112.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Banner with top controls & overlay badge/title
              SizedBox(
                height: 290.h,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      ImagePath.workoutBanner,
                      fit: BoxFit.cover,
                    ),
                    // Bottom dark gradient scrim
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.ink.withValues(alpha: 0.15),
                            AppColors.ink.withValues(alpha: 0.2),
                            AppColors.ink.withValues(alpha: 0.82),
                          ],
                          stops: const [0.0, 0.45, 1.0],
                        ),
                      ),
                    ),
                    // Top bar buttons
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _HeroCircleButton(
                                  iconPath: IconPath.chevLeft,
                                  onTap: () {
                                    if (Get.isRegistered<
                                        BottomNavController>()) {
                                      Get.find<BottomNavController>()
                                          .goToHome();
                                    } else {
                                      Get.back();
                                    }
                                  },
                                ),
                                _HeroCircleButton(
                                  iconPath: IconPath.hwMore,
                                  onTap: controller.openTimedCircuit,
                                ),
                              ],
                            ),
                            const Spacer(),
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
                                  Gap.h(5),
                                  Text(
                                    'home_workout.overview.plan_badge'
                                        .trParams({'week': '2', 'day': '3'}),
                                    style: text.boldTextStyle(
                                      fontSize: 10.5,
                                      lineHeight: 13,
                                      letterSpacing: 0.5,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(8),
                            Text(
                              'Full Body Strength',
                              style: text.boldTextStyle(
                                fontSize: 28,
                                lineHeight: 32,
                                letterSpacing: -0.5,
                                color: AppColors.white,
                              ),
                            ),
                            Gap(10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 7.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.ink.withValues(alpha: 0.48),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                'home_workout.overview.meta'.tr,
                                style: text.mediumTextStyle(
                                  fontSize: 12.5,
                                  lineHeight: 16,
                                  color: AppColors.white.withValues(alpha: 0.9),
                                ),
                              ),
                            ),
                            Gap(14),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'home_workout.overview.targeted_muscles'.tr,
                      style: text.boldTextStyle(
                        fontSize: 17,
                        lineHeight: 22,
                        color: AppColors.ink,
                      ),
                    ),
                    Gap(12),
                    // Segmented muscle distribution bar
                    Row(
                      children: [
                        Expanded(
                          flex: 45,
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: AppColors.coral,
                              borderRadius: BorderRadius.circular(99.r),
                            ),
                          ),
                        ),
                        Gap.h(4),
                        Expanded(
                          flex: 25,
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: AppColors.ink,
                              borderRadius: BorderRadius.circular(99.r),
                            ),
                          ),
                        ),
                        Gap.h(4),
                        Expanded(
                          flex: 15,
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: AppColors.amber,
                              borderRadius: BorderRadius.circular(99.r),
                            ),
                          ),
                        ),
                        Gap.h(4),
                        Expanded(
                          flex: 15,
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: AppColors.line,
                              borderRadius: BorderRadius.circular(99.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(12),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: const [
                        _MuscleLegendPill(
                          color: AppColors.coral,
                          muscleKey: 'home_workout.muscles.quadriceps',
                          percent: 45,
                        ),
                        _MuscleLegendPill(
                          color: AppColors.ink,
                          muscleKey: 'home_workout.muscles.core',
                          percent: 25,
                        ),
                        _MuscleLegendPill(
                          color: AppColors.amber,
                          muscleKey: 'home_workout.muscles.glutes',
                          percent: 15,
                        ),
                        _MuscleLegendPill(
                          color: AppColors.line,
                          muscleKey: 'home_workout.muscles.other',
                          percent: 15,
                        ),
                      ],
                    ),
                    Gap(16),
                    // Peach wrist adaptation banner
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(14.r),
                      decoration: BoxDecoration(
                        color: AppColors.peach,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 36.r,
                            height: 36.r,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(11.r),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.hwShield,
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
                                  'home_workout.overview.wrist_title'.tr,
                                  style: text.boldTextStyle(
                                    fontSize: 14,
                                    lineHeight: 18,
                                    color: AppColors.ink,
                                  ),
                                ),
                                Gap(3),
                                Text(
                                  'home_workout.overview.wrist_body'.tr,
                                  style: text.regularTextStyle(
                                    fontSize: 12.5,
                                    lineHeight: 17,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(22),
                    // Exercises list header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'home_workout.overview.exercises'.tr,
                          style: text.boldTextStyle(
                            fontSize: 18,
                            lineHeight: 22,
                            color: AppColors.ink,
                          ),
                        ),
                        Text(
                          'home_workout.overview.moves_sets'.trParams({
                            'moves': '6',
                            'sets': '18',
                          }),
                          style: text.regularTextStyle(
                            fontSize: 12.5,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                    Gap(12),
                    ...List.generate(controller.exercises.length, (i) {
                      final ex = controller.exercises[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: GestureDetector(
                          onTap: () => controller.openExerciseDetail(i),
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(18.r),
                              border: Border.all(color: AppColors.line),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    ex.imagePath,
                                    width: 62.r,
                                    height: 62.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Gap.h(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ex.indexLabel,
                                        style: text.mediumTextStyle(
                                          fontSize: 11.5,
                                          lineHeight: 14,
                                          color: AppColors.subtle,
                                        ),
                                      ),
                                      Gap(2),
                                      Text(
                                        ex.name,
                                        style: text.boldTextStyle(
                                          fontSize: 14.5,
                                          lineHeight: 19,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                      Gap(2),
                                      Text(
                                        ex.setsRepsLabel.tr,
                                        style: text.regularTextStyle(
                                          fontSize: 12.5,
                                          lineHeight: 16,
                                          color: AppColors.muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 30.r,
                                  height: 30.r,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.pearl,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconPath.hwChevRight,
                                      width: 14.r,
                                      height: 14.r,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    Gap(12),
                    AppPrimaryButton(
                      label: 'home_workout.overview.start_workout'.tr,
                      onPressed: controller.openActiveSet,
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

class _HeroCircleButton extends StatelessWidget {
  const _HeroCircleButton({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white.withValues(alpha: 0.85),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 40.r,
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

class _MuscleLegendPill extends StatelessWidget {
  const _MuscleLegendPill({
    required this.color,
    required this.muscleKey,
    required this.percent,
  });

  final Color color;
  final String muscleKey;
  final int percent;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.pearl,
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7.r,
            height: 7.r,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          Gap.h(6),
          Text(
            'home_workout.overview.muscle_share'.trParams({
              'muscle': muscleKey.tr,
              'percent': '$percent',
            }),
            style: text.mediumTextStyle(
              fontSize: 12,
              lineHeight: 15,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}
