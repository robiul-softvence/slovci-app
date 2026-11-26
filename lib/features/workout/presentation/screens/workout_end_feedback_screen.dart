import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Figma "11b · Workout — End-of-Session Feedback".
class WorkoutEndFeedbackScreen extends GetView<WorkoutController> {
  const WorkoutEndFeedbackScreen({super.key});

  // Translation keys — resolved with `.tr` at build time.
  static const _feelOptions = [
    'home_workout.end_feedback.feel_too_easy',
    'home_workout.end_feedback.feel_easy',
    'home_workout.end_feedback.feel_just_right',
    'home_workout.end_feedback.feel_hard',
    'home_workout.end_feedback.feel_too_hard',
  ];

  static const _enjoyOptions = [
    'home_workout.end_feedback.enjoy_loved',
    'home_workout.end_feedback.enjoy_ok',
    'home_workout.end_feedback.enjoy_not_really',
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      showHeader: false,
      eyebrow: 'home_workout.end_feedback.eyebrow'.trParams({
        'workout': 'FULL BODY A',
      }),
      title: 'home_workout.end_feedback.title'.tr,
      subtitle: 'home_workout.end_feedback.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'home_workout.end_feedback.see_summary'.tr,
          onPressed: controller.openSessionSummary,
        ),
      ),
      children: [
        Gap(20),
        Row(
          children: const [
            Expanded(child: _PeachStatBox(
                value: '45',
                labelKey: 'home_workout.common.min',
              )),
            Gap.h(10),
            Expanded(child: _PeachStatBox(
                value: '18',
                labelKey: 'home_workout.common.sets',
              )),
            Gap.h(10),
            Expanded(child: _PeachStatBox(
                value: '6',
                labelKey: 'home_workout.common.exercises',
              )),
          ],
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'home_workout.end_feedback.feel_title'.tr,
        ),
        Gap(12),
        Obx(
          () => Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: AppColors.pearl,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: List.generate(_feelOptions.length, (i) {
                final selected = controller.overallFeelIndex.value == i;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.overallFeelIndex.value = i,
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: EdgeInsets.symmetric(
                        vertical: 11.h,
                        horizontal: 2.w,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.white : AppColors.transparent,
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: Text(
                        _feelOptions[i].tr,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: text.semiBoldTextStyle(
                          fontSize: 11.5,
                          color: selected ? AppColors.cta : AppColors.ink,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'home_workout.end_feedback.pain_title'.tr,
        ),
        Gap(12),
        Obx(
          () => Wrap(
            spacing: 10.w,
            children: [
              OnboardingTagChip(
                label: 'home_workout.end_feedback.pain_no'.tr,
                selected: !controller.hadPain.value,
                onTap: () => controller.hadPain.value = false,
              ),
              OnboardingTagChip(
                label: 'home_workout.end_feedback.pain_yes'.tr,
                selected: controller.hadPain.value,
                onTap: () => controller.hadPain.value = true,
              ),
            ],
          ),
        ),
        Gap(8),
        Text(
          'home_workout.end_feedback.pain_hint'.tr,
          style: text.regularTextStyle(
            fontSize: 12.5,
            color: AppColors.muted,
          ),
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'home_workout.end_feedback.enjoy_title'.tr,
        ),
        Gap(12),
        Obx(
          () => Wrap(
            spacing: 10.w,
            children: List.generate(_enjoyOptions.length, (i) {
              return OnboardingTagChip(
                label: _enjoyOptions[i].tr,
                selected: controller.enjoymentIndex.value == i,
                onTap: () => controller.enjoymentIndex.value = i,
              );
            }),
          ),
        ),
        Gap(24),
        OnboardingSectionTitle(
          title: 'home_workout.end_feedback.coach_note_title'.tr,
        ),
        Gap(12),
        TextField(
          controller: controller.coachNoteController,
          style: text.regularTextStyle(fontSize: 14, color: AppColors.ink),
          decoration: InputDecoration(
            hintText: 'home_workout.end_feedback.coach_note_hint'.tr,
            hintStyle: text.regularTextStyle(
              fontSize: 14,
              color: AppColors.subtle,
            ),
            filled: true,
            fillColor: AppColors.pearl,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 16.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _PeachStatBox extends StatelessWidget {
  const _PeachStatBox({required this.value, required this.labelKey});

  final String value;

  /// Translation key, resolved at build time.
  final String labelKey;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.peach,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: text.boldTextStyle(
              fontSize: 24,
              lineHeight: 28,
              color: AppColors.ink,
            ),
          ),
          Gap(2),
          Text(
            labelKey.tr,
            style: text.regularTextStyle(
              fontSize: 12.5,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}
