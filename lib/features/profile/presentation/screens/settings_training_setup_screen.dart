import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_scaffold.dart';
import 'package:flutter_tamplate/features/profile/presentation/widgets/settings_widgets.dart';

/// Figma "19g · Settings — Training Setup".
class SettingsTrainingSetupScreen extends GetView<ProfileController> {
  const SettingsTrainingSetupScreen({super.key});

  static const _equipList = [
    'Bodyweight',
    'Dumbbells',
    'Kettlebells',
    'Resistance Bands',
    'Pull-up Bar',
    'Bench',
  ];
  static const _days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return SettingsScaffold(
      title: 'Training Setup',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Save & Update Plan',
          onPressed: () {
            Get.back();
            AppHelperFunctions.showSnackBar('Training setup saved!');
          },
        ),
      ),
      children: [
        const SettingsSectionLabel('WHERE YOU TRAIN'),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: _EnvTile(
                  iconPath: IconPath.obBuilding,
                  label: 'Gym',
                  selected: controller.trainEnvIdx.value == 0,
                  onTap: () => controller.trainEnvIdx.value = 0,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _EnvTile(
                  iconPath: IconPath.obHome,
                  label: 'Home',
                  selected: controller.trainEnvIdx.value == 1,
                  onTap: () => controller.trainEnvIdx.value = 1,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: _EnvTile(
                  iconPath: IconPath.obRefresh,
                  label: 'Hybrid',
                  selected: controller.trainEnvIdx.value == 2,
                  onTap: () => controller.trainEnvIdx.value = 2,
                ),
              ),
            ],
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('EQUIPMENT'),
        Obx(
          () => Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: _equipList.map((eq) {
              return OnboardingTagChip(
                label: eq,
                selected: controller.trainEquipment.contains(eq),
                unselectedBg: AppColors.white,
                onTap: () => controller.toggleEquipment(eq),
              );
            }).toList(),
          ),
        ),
        Gap(14),
        Text(
          'Dumbbell weights available',
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(6),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Text(
            '2 – 12 kg (pairs)',
            style: text.mediumTextStyle(fontSize: 14.5, color: AppColors.ink),
          ),
        ),
        Gap(22),
        const SettingsSectionLabel('SCHEDULE'),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (i) {
              final selected = controller.trainDays.contains(i);
              return GestureDetector(
                onTap: () => controller.toggleTrainDay(i),
                child: Container(
                  width: 42.r,
                  height: 42.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.ink : AppColors.white,
                    border: selected ? null : Border.all(color: AppColors.line),
                  ),
                  child: Text(
                    _days[i],
                    style: text.boldTextStyle(
                      fontSize: 13.5,
                      color: selected ? AppColors.white : AppColors.muted,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Gap(14),
        Row(
          children: [
            Expanded(
              child: _ReadOnlyBox(label: 'Session length', value: '45 min'),
            ),
            Gap.h(12),
            Expanded(
              child: _ReadOnlyBox(
                label: 'Preferred time',
                value: 'Morning · 7:00 AM',
              ),
            ),
          ],
        ),
        Gap(22),
        const SettingsSectionLabel('OPTIONS'),
        SettingsCardGroup(
          children: [
            Obx(
              () => SettingsToggleRow(
                title: 'Cardio finisher',
                subtitle: 'Add 9 min of low-impact cardio to sessions',
                value: controller.cardioFinisher.value,
                onChanged: (v) => controller.cardioFinisher.value = v,
              ),
            ),
            Obx(
              () => SettingsToggleRow(
                title: 'Warm-up',
                subtitle: '5-min mobility warm-up before each session',
                value: controller.warmUpEnabled.value,
                onChanged: (v) => controller.warmUpEnabled.value = v,
              ),
            ),
          ],
        ),
        Gap(16),
        const OnboardingInfoBanner(
          backgroundColor: AppColors.infoSoft,
          textColor: AppColors.ink,
          text:
              'Changes apply from your next session. Completed workouts are not affected.',
        ),
      ],
    );
  }
}

class _EnvTile extends StatelessWidget {
  const _EnvTile({
    required this.iconPath,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22.r,
              height: 22.r,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.cta : AppColors.ink,
                BlendMode.srcIn,
              ),
            ),
            Gap(8),
            Text(
              label,
              style: AppTextStyle(context).boldTextStyle(
                fontSize: 14,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadOnlyBox extends StatelessWidget {
  const _ReadOnlyBox({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: text.mediumTextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        Gap(6),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.line),
          ),
          child: Text(
            value,
            style: text.mediumTextStyle(fontSize: 14, color: AppColors.ink),
          ),
        ),
      ],
    );
  }
}
