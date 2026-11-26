import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Figma "08b · Workout — Rest Time per Set" modal sheet.
class WorkoutRestTimeSheet extends StatelessWidget {
  const WorkoutRestTimeSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => const WorkoutRestTimeSheet(),
    );
  }

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rest time',
                      style: text.boldTextStyle(
                        fontSize: 22,
                        lineHeight: 26,
                        color: AppColors.ink,
                      ),
                    ),
                    Gap(2),
                    Text(
                      'Goblet Squat · 3 sets',
                      style: text.regularTextStyle(
                        fontSize: 13,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: AppColors.pearl,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: Get.back,
                  child: SizedBox.square(
                    dimension: 36.r,
                    child: Center(
                      child: SvgPicture.asset(
                        IconPath.hwClose,
                        width: 16.r,
                        height: 16.r,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(18),
          // Same for all / Per set toggle
          Obx(() {
            final perSet = controller.restPerSetMode.value;
            return Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: AppColors.pearl,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.restPerSetMode.value = false,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 11.h),
                        decoration: BoxDecoration(
                          color: !perSet ? AppColors.ink : AppColors.transparent,
                          borderRadius: BorderRadius.circular(11.r),
                        ),
                        child: Text(
                          'Same for all',
                          textAlign: TextAlign.center,
                          style: text.semiBoldTextStyle(
                            fontSize: 14,
                            color: !perSet ? AppColors.white : AppColors.muted,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.restPerSetMode.value = true,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 11.h),
                        decoration: BoxDecoration(
                          color: perSet ? AppColors.ink : AppColors.transparent,
                          borderRadius: BorderRadius.circular(11.r),
                        ),
                        child: Text(
                          'Per set',
                          textAlign: TextAlign.center,
                          style: text.semiBoldTextStyle(
                            fontSize: 14,
                            color: perSet ? AppColors.white : AppColors.muted,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          Gap(18),
          // Set 1..3 rows
          Obx(
            () => Column(
              children: List.generate(
                controller.perSetRestSeconds.length.clamp(0, 3),
                (i) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 52.w,
                        child: Text(
                          'Set ${i + 1}',
                          style: text.semiBoldTextStyle(
                            fontSize: 14.5,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: AppColors.pearl,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _StepBtn(
                                iconPath: IconPath.hwMinus,
                                onTap: () => controller.adjustPerSetRest(i, -15),
                              ),
                              Text(
                                controller.formatShortMmSs(
                                  controller.perSetRestSeconds[i],
                                ),
                                style: text.boldTextStyle(
                                  fontSize: 18,
                                  color: AppColors.ink,
                                ),
                              ),
                              _StepBtn(
                                iconPath: IconPath.hwPlus,
                                onTap: () => controller.adjustPerSetRest(i, 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Gap(6),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: AppColors.peach,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Gap.h(10),
                Expanded(
                  child: Text(
                    'MILON suggests 1:30–2:00 for strength sets at this effort level.',
                    style: text.mediumTextStyle(
                      fontSize: 13,
                      lineHeight: 18,
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          AppPrimaryButton(
            label: 'Save',
            onPressed: () {
              controller.restSecondsLeft.value =
                  controller.perSetRestSeconds.first;
              controller.restTotalSeconds.value =
                  controller.perSetRestSeconds.first;
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class _StepBtn extends StatelessWidget {
  const _StepBtn({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(11.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 36.r,
          child: Center(
            child: SvgPicture.asset(iconPath, width: 15.r, height: 15.r),
          ),
        ),
      ),
    );
  }
}
