import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/body_map_widget.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/injury_detail_sheet.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "02 · Onboarding — Injury Body Map" (Step 3/6).
class OnboardingInjuryBodyMapScreen extends GetView<OnboardingController> {
  const OnboardingInjuryBodyMapScreen({super.key});

  void _openZoneSheet(
    BuildContext context,
    String zone, {
    String viewLabel = 'Front view · Both sides',
  }) {
    controller.prepareInjurySheet(zone, viewLabel: viewLabel);
    InjuryDetailSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return OnboardingScaffold(
      stepIndex: 3,
      eyebrow: 'STEP 3 · SENSITIVE AREAS',
      title: 'Any injuries or sensitive areas?',
      subtitle:
          'Tap a zone on the body. MILON will automatically adapt every exercise to protect it.',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Continue',
          onPressed: controller.goToEnvironment,
        ),
      ),
      children: [
        Gap(20),
        Obx(
          () => InjuryBodyMapCards(
            selectedZones: controller.selectedInjuries.keys.toSet(),
            onTapZone: (zone, viewLabel) =>
                _openZoneSheet(context, zone, viewLabel: viewLabel),
          ),
        ),
        Gap(14),
        // Legend row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10.r,
              height: 10.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.coral,
              ),
            ),
            Gap.h(6),
            Text(
              'Selected',
              style: text.mediumTextStyle(
                fontSize: AppTextStyle.sm,
                color: AppColors.muted,
              ),
            ),
            Gap.h(18),
            Container(
              width: 10.r,
              height: 10.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(color: AppColors.coral, width: 1.5),
              ),
            ),
            Gap.h(6),
            Text(
              'Tap to flag',
              style: text.mediumTextStyle(
                fontSize: AppTextStyle.sm,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
        Gap(20),
        const OnboardingSectionTitle(title: 'Or choose from the list'),
        Gap(12),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: OnboardingController.injuryZones.map((zone) {
              final isSelected = controller.selectedInjuries.containsKey(zone);
              return OnboardingTagChip(
                label: zone,
                selected: isSelected,
                onTap: () => _openZoneSheet(context, zone),
              );
            }).toList(),
          ),
        ),
        Gap(18),
        const OnboardingInfoBanner(
          text: 'No injuries? Skip this step. You can add them later in Profile.',
        ),
      ],
    );
  }
}
