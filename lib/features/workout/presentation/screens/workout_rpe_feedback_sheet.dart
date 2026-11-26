import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Figma "09 · Workout — RPE Feedback Prompt" modal sheet.
class WorkoutRpeFeedbackSheet extends StatelessWidget {
  const WorkoutRpeFeedbackSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => const WorkoutRpeFeedbackSheet(),
    );
  }

  // (score, label key, advice key) — keys are resolved with `.tr` at build.
  static const _rpeOptions = [
    ('1–2', 'home_workout.rpe.easy', 'home_workout.rpe.easy_advice'),
    ('3', 'home_workout.rpe.moderate', 'home_workout.rpe.moderate_advice'),
    ('4', 'home_workout.rpe.hard', 'home_workout.rpe.hard_advice'),
    ('5', 'home_workout.rpe.max_effort', 'home_workout.rpe.max_effort_advice'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WorkoutController>();
    final text = AppTextStyle(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 28.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.line,
                borderRadius: BorderRadius.circular(99.r),
              ),
            ),
          ),
          Gap(16),
          Row(
            children: [
              Container(
                width: 46.r,
                height: 46.r,
                decoration: BoxDecoration(
                  color: AppColors.mintLight,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.hwCheck,
                    width: 22.r,
                    height: 22.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.emerald,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Gap.h(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'home_workout.rpe.set_complete'.trParams({'number': '3'}),
                    style: text.boldTextStyle(
                      fontSize: 11,
                      letterSpacing: 0.7,
                      color: AppColors.emerald,
                    ),
                  ),
                  Gap(2),
                  Text(
                    'home_workout.rpe.reps_kg'.trParams({
                      'reps': '12',
                      'kg': '16',
                    }),
                    style: text.boldTextStyle(
                      fontSize: 20,
                      lineHeight: 24,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(16),
          const Divider(height: 1, color: AppColors.line),
          Gap(16),
          Text(
            'home_workout.rpe.question'.tr,
            style: text.boldTextStyle(
              fontSize: 18,
              lineHeight: 22,
              color: AppColors.ink,
            ),
          ),
          Gap(6),
          Text(
            'home_workout.rpe.description'.tr,
            style: text.regularTextStyle(
              fontSize: 13.5,
              lineHeight: 19,
              color: AppColors.muted,
            ),
          ),
          Gap(16),
          Obx(() {
            final selected = controller.selectedRpeIndex.value;
            return Column(
              children: [
                Row(
                  children: List.generate(_rpeOptions.length, (i) {
                    final (score, labelKey, _) = _rpeOptions[i];
                    final isSelected = i == selected;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: i == _rpeOptions.length - 1 ? 0 : 8.w,
                        ),
                        child: GestureDetector(
                          onTap: () => controller.selectedRpeIndex.value = i,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 160),
                            padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 4.w,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.ink
                                  : AppColors.pearl,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  score,
                                  style: text.boldTextStyle(
                                    fontSize: 22,
                                    lineHeight: 26,
                                    color: isSelected
                                        ? AppColors.lime
                                        : AppColors.ink,
                                  ),
                                ),
                                Gap(4),
                                Text(
                                  labelKey.tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: text.mediumTextStyle(
                                    fontSize: 11.5,
                                    color: isSelected
                                        ? AppColors.white
                                        : AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Gap(16),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconPath.hwSpark,
                        width: 16.r,
                        height: 16.r,
                        colorFilter: const ColorFilter.mode(
                          AppColors.cta,
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap.h(8),
                      Expanded(
                        child: Text(
                          _rpeOptions[selected].$3.tr,
                          style: text.mediumTextStyle(
                            fontSize: 12.5,
                            lineHeight: 17,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
          Gap(18),
          AppPrimaryButton(
            label: 'home_workout.rpe.save_start_rest'.tr,
            onPressed: () {
              Get.back();
              controller.openEndFeedback();
            },
          ),
        ],
      ),
    );
  }
}
