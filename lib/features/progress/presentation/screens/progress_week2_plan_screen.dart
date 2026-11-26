import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';

/// Figma "17d · Progress — Week 2 Plan Adjustments".
class ProgressWeek2PlanScreen extends GetView<ProgressController> {
  const ProgressWeek2PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
                child: Row(
                  children: [
                    Material(
                      color: AppColors.pearl,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: Get.back,
                        child: SizedBox.square(
                          dimension: 40.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.chevLeft,
                              width: 20.r,
                              height: 20.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Your Week 2 Plan',
                        textAlign: TextAlign.center,
                        style: text.boldTextStyle(
                          fontSize: 18,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    SizedBox(width: 40.r),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Dark WEEK 1 RECAP card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(18.r),
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WEEK 1 RECAP',
                              style: text.boldTextStyle(
                                fontSize: 11,
                                letterSpacing: 0.7,
                                color: AppColors.white.withValues(alpha: 0.7),
                              ),
                            ),
                            Gap(6),
                            Text(
                              'Solid first week!',
                              style: text.boldTextStyle(
                                fontSize: 24,
                                lineHeight: 28,
                                color: AppColors.white,
                              ),
                            ),
                            Gap(14),
                            Row(
                              children: const [
                                Expanded(
                                  child: _DarkRecapTile(
                                    value: '3/4',
                                    label: 'workouts',
                                  ),
                                ),
                                Gap.h(8),
                                Expanded(
                                  child: _DarkRecapTile(
                                    value: '−0.4 kg',
                                    label: 'weight',
                                  ),
                                ),
                                Gap.h(8),
                                Expanded(
                                  child: _DarkRecapTile(
                                    value: '79%',
                                    label: 'meals followed',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      Text(
                        'What changes next week',
                        style: text.boldTextStyle(
                          fontSize: 18,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(12),
                      const _AdjustmentCard(
                        iconPath: IconPath.hwDumbbell,
                        iconBg: AppColors.peach,
                        iconColor: AppColors.cta,
                        category: 'TRAINING',
                        headline: 'Goblet Squat 15 → 17 kg · RDL stays 20 kg',
                        reason:
                            'Workouts felt "just right" and you finished all sets, so we add a small, steady progression.',
                      ),
                      Gap(12),
                      const _AdjustmentCard(
                        iconPath: IconPath.hwFood,
                        iconBg: AppColors.mintSoft,
                        iconColor: AppColors.emerald,
                        category: 'NUTRITION',
                        headline:
                            '+1 high-fibre snack on training days (+120 kcal)',
                        reason:
                            'You felt hungry often. Daily average stays ≈1,485 kcal, so your −0.4 kg/week pace is unchanged.',
                      ),
                      Gap(12),
                      const _AdjustmentCard(
                        iconPath: IconPath.nutCal,
                        iconBg: AppColors.infoSoft,
                        iconColor: AppColors.carbsBlue,
                        category: 'SCHEDULE',
                        headline:
                            'Saturday cardio → 30 min, or move it to Sunday',
                        reason:
                            "You missed 1 session, that's normal. A shorter option makes it easier to fit in.",
                      ),
                      Gap(12),
                      const _AdjustmentCard(
                        iconPath: IconPath.pcMoon,
                        iconBg: AppColors.pearl,
                        iconColor: AppColors.ink,
                        category: 'RECOVERY',
                        headline: 'No change · sleep 7h10 is on track',
                        reason:
                            'Keep your evening routine; recovery is supporting your progress.',
                      ),
                    ],
                  ),
                ),
              ),
              BottomActionBar(
                primary: AppPrimaryButton(
                  label: 'Accept Week 2 Plan',
                  onPressed: controller.acceptWeek2Plan,
                ),
                secondary: GestureDetector(
                  onTap: controller.discussWithCoach,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          IconPath.pcChat,
                          width: 16.r,
                          height: 16.r,
                        ),
                        Gap.h(6),
                        Text(
                          'Discuss with Coach',
                          style: text.semiBoldTextStyle(
                            fontSize: 14,
                            color: AppColors.ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DarkRecapTile extends StatelessWidget {
  const _DarkRecapTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: text.boldTextStyle(fontSize: 17, color: AppColors.white),
          ),
          Gap(2),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: text.regularTextStyle(
              fontSize: 11,
              color: AppColors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _AdjustmentCard extends StatelessWidget {
  const _AdjustmentCard({
    required this.iconPath,
    required this.iconBg,
    required this.iconColor,
    required this.category,
    required this.headline,
    required this.reason,
  });

  final String iconPath;
  final Color iconBg;
  final Color iconColor;
  final String category;
  final String headline;
  final String reason;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38.r,
                height: 38.r,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 19.r,
                    height: 19.r,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                ),
              ),
              Gap.h(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: text.boldTextStyle(
                        fontSize: 10.5,
                        letterSpacing: 0.6,
                        color: AppColors.muted,
                      ),
                    ),
                    Gap(3),
                    Text(
                      headline,
                      style: text.boldTextStyle(
                        fontSize: 14.5,
                        lineHeight: 20,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.pearl,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  IconPath.hwSpark,
                  width: 15.r,
                  height: 15.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.cta,
                    BlendMode.srcIn,
                  ),
                ),
                Gap.h(8),
                Expanded(
                  child: Text(
                    reason,
                    style: text.regularTextStyle(
                      fontSize: 12.5,
                      lineHeight: 18,
                      color: AppColors.muted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
