import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/domain/entities/onboarding_models.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_scaffold.dart';

/// Figma "03 · Onboarding — Environment & Equipment" (Step 4/6).
class OnboardingEnvironmentScreen extends GetView<OnboardingController> {
  const OnboardingEnvironmentScreen({super.key});

  static const _equipmentIcons = <String, String>{
    'Bodyweight Only': IconPath.obUser,
    'Dumbbells': IconPath.obDumbbell,
    'Kettlebells': IconPath.obKettle,
    'Resistance Bands': IconPath.obBand,
    'Pull-up Bar': IconPath.obBar,
    'Bench': IconPath.obBench,
  };

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      stepIndex: 4,
      eyebrow: 'STEP 4 · ENVIRONMENT',
      title: 'Where will you train?',
      subtitle: 'Your program only uses the equipment you actually have.',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Continue',
          onPressed: controller.goToSchedule,
        ),
      ),
      children: [
        Gap(22),
        const OnboardingSectionTitle(title: 'Training environment'),
        Gap(12),
        Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _EnvironmentCard(
                  title: 'Gym',
                  subtitle: 'Full equipment',
                  iconPath: IconPath.obBuilding,
                  selected:
                      controller.trainingEnvironment.value ==
                      TrainingEnvironmentOption.gym,
                  onTap: () => controller.trainingEnvironment.value =
                      TrainingEnvironmentOption.gym,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _EnvironmentCard(
                  title: 'Home',
                  subtitle: 'Minimal setup',
                  iconPath: IconPath.obHome,
                  selected:
                      controller.trainingEnvironment.value ==
                      TrainingEnvironmentOption.home,
                  onTap: () => controller.trainingEnvironment.value =
                      TrainingEnvironmentOption.home,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _EnvironmentCard(
                  title: 'Hybrid',
                  subtitle: 'Mix of both',
                  iconPath: IconPath.obRefresh,
                  selected:
                      controller.trainingEnvironment.value ==
                      TrainingEnvironmentOption.hybrid,
                  onTap: () => controller.trainingEnvironment.value =
                      TrainingEnvironmentOption.hybrid,
                ),
              ),
            ],
          ),
        ),
        Gap(24),
        const OnboardingSectionTitle(title: 'Available equipment'),
        Gap(12),
        Obx(
          () => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: OnboardingController.equipmentOptions.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.85,
            ),
            itemBuilder: (context, index) {
              final item = OnboardingController.equipmentOptions[index];
              final selected = controller.selectedEquipment.contains(item);
              return _EquipmentCard(
                label: item,
                iconPath: _equipmentIcons[item] ?? IconPath.obDumbbell,
                selected: selected,
                onTap: () => controller.toggleEquipment(item),
              );
            },
          ),
        ),
        Gap(16),
        Obx(() {
          final count = controller.selectedEquipment.length;
          return OnboardingInfoBanner(
            text:
                '$count ${count == 1 ? 'item' : 'items'} selected · You can update this anytime in Profile.',
          );
        }),
      ],
    );
  }
}

class _EnvironmentCard extends StatelessWidget {
  const _EnvironmentCard({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        constraints: BoxConstraints(minHeight: 142.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: selected ? AppColors.coral : AppColors.pearl,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    selected ? AppColors.white : AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Gap(14),
            Text(
              title,
              style: text.boldTextStyle(
                fontSize: 14,
                lineHeight: 18,
                color: AppColors.ink,
              ),
            ),
            Gap(4),
            Text(
              subtitle,
              style: text.regularTextStyle(
                fontSize: 12,
                lineHeight: 16,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EquipmentCard extends StatelessWidget {
  const _EquipmentCard({
    required this.label,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    selected ? AppColors.cta : AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
                OnboardingCheckBadge(selected: selected),
              ],
            ),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.semiBoldTextStyle(
                fontSize: 13.5,
                lineHeight: 17,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
