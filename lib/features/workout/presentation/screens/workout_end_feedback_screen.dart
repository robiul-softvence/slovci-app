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

  static const _feelOptions = [
    'Too easy',
    'Easy',
    'Just right',
    'Hard',
    'Too hard',
  ];

  static const _enjoyOptions = ['Loved it', 'It was OK', 'Not really'];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      showHeader: false,
      eyebrow: 'SESSION COMPLETE · FULL BODY A',
      title: 'How was your session?',
      subtitle:
          'Your feedback helps MILON Coach adjust your next workouts.',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'See my session summary',
          onPressed: controller.openSessionSummary,
        ),
      ),
      children: [
        Gap(20),
        Row(
          children: const [
            Expanded(child: _PeachStatBox(value: '45', label: 'min')),
            Gap.h(10),
            Expanded(child: _PeachStatBox(value: '18', label: 'sets')),
            Gap.h(10),
            Expanded(child: _PeachStatBox(value: '6', label: 'exercises')),
          ],
        ),
        Gap(24),
        const OnboardingSectionTitle(title: 'How did it feel overall?'),
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
                        _feelOptions[i],
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
        const OnboardingSectionTitle(title: 'Any pain or discomfort?'),
        Gap(12),
        Obx(
          () => Wrap(
            spacing: 10.w,
            children: [
              OnboardingTagChip(
                label: 'No, all good',
                selected: !controller.hadPain.value,
                onTap: () => controller.hadPain.value = false,
              ),
              OnboardingTagChip(
                label: 'Yes, somewhere',
                selected: controller.hadPain.value,
                onTap: () => controller.hadPain.value = true,
              ),
            ],
          ),
        ),
        Gap(8),
        Text(
          'If yes, we will ask where and adapt your next session.',
          style: text.regularTextStyle(
            fontSize: 12.5,
            color: AppColors.muted,
          ),
        ),
        Gap(24),
        const OnboardingSectionTitle(title: 'Did you enjoy it?'),
        Gap(12),
        Obx(
          () => Wrap(
            spacing: 10.w,
            children: List.generate(_enjoyOptions.length, (i) {
              return OnboardingTagChip(
                label: _enjoyOptions[i],
                selected: controller.enjoymentIndex.value == i,
                onTap: () => controller.enjoymentIndex.value = i,
              );
            }),
          ),
        ),
        Gap(24),
        const OnboardingSectionTitle(title: 'A word for your coach? (optional)'),
        Gap(12),
        TextField(
          controller: controller.coachNoteController,
          style: text.regularTextStyle(fontSize: 14, color: AppColors.ink),
          decoration: InputDecoration(
            hintText: 'e.g. The lunges were hard on my knees',
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
  const _PeachStatBox({required this.value, required this.label});

  final String value;
  final String label;

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
            label,
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
