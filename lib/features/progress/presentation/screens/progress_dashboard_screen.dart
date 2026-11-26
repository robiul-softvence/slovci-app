import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';

/// Figma "16 · Progress — Consistency, Recovery & Hydration".
class ProgressDashboardScreen extends GetView<ProgressController> {
  const ProgressDashboardScreen({super.key});

  Color _heatmapColor(int level) {
    switch (level) {
      case 1:
        return AppColors.heatmap1;
      case 2:
        return AppColors.heatmap2;
      case 3:
        return AppColors.coral;
      case 4:
        return AppColors.cta;
      default:
        return AppColors.line;
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 114.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Progress + Week/Month/Year pill
                Row(
                  children: [
                    Text(
                      'progress_coach.dashboard.title'.tr,
                      style: text.boldTextStyle(
                        fontSize: 28,
                        lineHeight: 34,
                        letterSpacing: -0.5,
                        color: AppColors.ink,
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: BoxDecoration(
                          color: AppColors.pearl,
                          borderRadius: BorderRadius.circular(99.r),
                        ),
                        child: Row(
                          children: List.generate(
                            ProgressController.periodTabs.length,
                            (i) {
                              final selected =
                                  controller.selectedPeriod.value == i;
                              return GestureDetector(
                                onTap: () =>
                                    controller.selectedPeriod.value = i,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 7.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? AppColors.ink
                                        : AppColors.transparent,
                                    borderRadius: BorderRadius.circular(99.r),
                                  ),
                                  child: Text(
                                    ProgressController.periodTabs[i].tr,
                                    style: text.semiBoldTextStyle(
                                      fontSize: 12,
                                      color: selected
                                          ? AppColors.white
                                          : AppColors.muted,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(16),
                // 3 KPI summary tiles
                Row(
                  children: [
                    Expanded(
                      child: _KpiTile(
                        bg: AppColors.peach,
                        iconPath: IconPath.hwDumbbell,
                        iconColor: AppColors.cta,
                        value: '14',
                        label: 'progress_coach.dashboard.kpi_workouts'.tr,
                      ),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _KpiTile(
                        bg: AppColors.limeSoft,
                        iconPath: IconPath.hwFlame,
                        iconColor: AppColors.emerald,
                        value: '5',
                        label: 'progress_coach.dashboard.kpi_day_streak'.tr,
                      ),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _KpiTile(
                        bg: AppColors.pearl,
                        iconPath: IconPath.hwBolt,
                        iconColor: AppColors.ink,
                        value: '6,280',
                        label: 'progress_coach.dashboard.kpi_kcal_burned'.tr,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                // Body & weight + Weekly review quick links
                Row(
                  children: [
                    Expanded(
                      child: _QuickLinkCard(
                        title: 'progress_coach.dashboard.body_weight_title'.tr,
                        subtitle: '62.4 kg · −0.6 kg',
                        onTap: controller.openBodyWeight,
                      ),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _QuickLinkCard(
                        title:
                            'progress_coach.dashboard.weekly_review_title'.tr,
                        subtitle:
                            'progress_coach.dashboard.weekly_review_subtitle'
                                .tr,
                        onTap: controller.openWeeklyReview,
                      ),
                    ),
                  ],
                ),
                Gap(16),
                // Consistency heatmap card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'progress_coach.dashboard.consistency_title'.tr,
                                style: text.boldTextStyle(
                                  fontSize: 17,
                                  color: AppColors.ink,
                                ),
                              ),
                              Gap(2),
                              Text(
                                'progress_coach.dashboard.consistency_period'
                                    .tr,
                                style: text.regularTextStyle(
                                  fontSize: 12,
                                  color: AppColors.muted,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lime,
                              borderRadius: BorderRadius.circular(99.r),
                            ),
                            child: Text(
                              'progress_coach.dashboard.consistency_badge'.tr,
                              style: text.boldTextStyle(
                                fontSize: 11.5,
                                color: AppColors.ink,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(14),
                      // 7 rows × 12 cols heatmap
                      ...List.generate(controller.heatmapMatrix.length, (r) {
                        const rowLabels = [
                          'progress_coach.dashboard.day_mon_short',
                          '',
                          'progress_coach.dashboard.day_wed_short',
                          '',
                          'progress_coach.dashboard.day_fri_short',
                          '',
                          'progress_coach.dashboard.day_sun_short',
                        ];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.w,
                                child: Text(
                                  rowLabels[r].isEmpty ? '' : rowLabels[r].tr,
                                  style: text.mediumTextStyle(
                                    fontSize: 10.5,
                                    color: AppColors.subtle,
                                  ),
                                ),
                              ),
                              ...List.generate(
                                controller.heatmapMatrix[r].length,
                                (c) => Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: c == 11 ? 0 : 4.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _heatmapColor(
                                          controller.heatmapMatrix[r][c],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'progress_coach.dashboard.legend_less'.tr,
                            style: text.regularTextStyle(
                              fontSize: 11,
                              color: AppColors.muted,
                            ),
                          ),
                          Gap.h(6),
                          ...List.generate(
                            5,
                            (lv) => Container(
                              width: 11.r,
                              height: 11.r,
                              margin: EdgeInsets.only(right: 4.w),
                              decoration: BoxDecoration(
                                color: _heatmapColor(lv),
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                            ),
                          ),
                          Gap.h(2),
                          Text(
                            'progress_coach.dashboard.legend_more'.tr,
                            style: text.regularTextStyle(
                              fontSize: 11,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(22),
                // Most practiced horizontal list
                Text(
                  'progress_coach.dashboard.most_practiced'.tr,
                  style: text.boldTextStyle(fontSize: 18, color: AppColors.ink),
                ),
                Gap(12),
                SizedBox(
                  height: 184.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _PracticedCard(
                        imagePath: ImagePath.exGobletSquat,
                        title: 'Goblet Squat',
                        subtitle: 'progress_coach.dashboard.practiced_subtitle'
                            .trParams({'count': '24', 'load': '15 kg'}),
                      ),
                      Gap.h(12),
                      _PracticedCard(
                        imagePath: ImagePath.exGluteBridge,
                        title: 'Glute Bridge',
                        subtitle: 'progress_coach.dashboard.practiced_subtitle'
                            .trParams({'count': '19', 'load': '15 kg'}),
                      ),
                      Gap.h(12),
                      _PracticedCard(
                        imagePath: ImagePath.exForearmPlank,
                        title: 'Forearm Plank',
                        subtitle: 'progress_coach.dashboard.practiced_subtitle'
                            .trParams({'count': '17', 'load': '45 sec'}),
                      ),
                    ],
                  ),
                ),
                Gap(22),
                // Muscle recovery readiness
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'progress_coach.dashboard.recovery_title'.tr,
                      style: text.boldTextStyle(
                        fontSize: 17,
                        color: AppColors.ink,
                      ),
                    ),
                    Text(
                      'progress_coach.dashboard.recovery_updated'.trParams({
                        'time': '9:00 AM',
                      }),
                      style: text.regularTextStyle(
                        fontSize: 11.5,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                Row(
                  children: [
                    Expanded(
                      child: _RecoveryCard(
                        bg: AppColors.mintSoft,
                        ringSvg: IconPath.pcReadiness0,
                        muscle: 'progress_coach.dashboard.muscle_calves'.tr,
                        status: 'progress_coach.dashboard.status_ready'.tr,
                        statusColor: AppColors.emerald,
                      ),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _RecoveryCard(
                        bg: AppColors.mintSoft,
                        ringSvg: IconPath.pcReadiness1,
                        muscle: 'progress_coach.dashboard.muscle_quads'.tr,
                        status: 'progress_coach.dashboard.status_ready'.tr,
                        statusColor: AppColors.emerald,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: _RecoveryCard(
                        bg: AppColors.amberSoft,
                        ringSvg: IconPath.pcReadiness2,
                        muscle: 'progress_coach.dashboard.muscle_biceps'.tr,
                        status: 'progress_coach.dashboard.status_recovering'
                            .trParams({'time': '21h'}),
                        statusColor: AppColors.amber,
                      ),
                    ),
                    Gap.h(10),
                    Expanded(
                      child: _RecoveryCard(
                        bg: AppColors.amberSoft,
                        ringSvg: IconPath.pcReadiness3,
                        muscle: 'progress_coach.dashboard.muscle_shoulders'.tr,
                        status: 'progress_coach.dashboard.status_recovering'
                            .trParams({'time': '9h'}),
                        statusColor: AppColors.amber,
                      ),
                    ),
                  ],
                ),
                Gap(18),
                // DAILY HYDRATION interactive card
                Obx(() {
                  final glasses = controller.waterGlasses.value;
                  final liters = controller.waterLiters;
                  final fillRatio =
                      glasses / ProgressController.maxWaterGlasses;

                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: AppColors.waterBg,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Water vessel visual
                            Container(
                              width: 74.w,
                              height: 102.h,
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.65),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8.r),
                                  bottom: Radius.circular(18.r),
                                ),
                                border: Border.all(
                                  color: AppColors.carbsBlue,
                                  width: 2,
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 240),
                                  height: 98.h * fillRatio,
                                  width: double.infinity,
                                  color: AppColors.carbsBlue.withValues(
                                    alpha: 0.35,
                                  ),
                                ),
                              ),
                            ),
                            Gap.h(16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'progress_coach.dashboard.hydration_eyebrow'
                                        .tr,
                                    style: text.boldTextStyle(
                                      fontSize: 11,
                                      letterSpacing: 0.7,
                                      color: AppColors.carbsBlue,
                                    ),
                                  ),
                                  Gap(6),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        liters == 0
                                            ? '0'
                                            : liters.toStringAsFixed(2),
                                        style: text.boldTextStyle(
                                          fontSize: 30,
                                          lineHeight: 34,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                      Gap.h(5),
                                      Text(
                                        '/ 2.0 L',
                                        style: text.mediumTextStyle(
                                          fontSize: 14,
                                          color: AppColors.muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(4),
                                  Text(
                                    'progress_coach.dashboard.hydration_hint'
                                        .tr,
                                    style: text.regularTextStyle(
                                      fontSize: 12,
                                      color: AppColors.muted,
                                    ),
                                  ),
                                  Gap(10),
                                  Row(
                                    children: List.generate(8, (i) {
                                      final filled = i < glasses;
                                      return Expanded(
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.setWaterGlass(i + 1),
                                          child: Container(
                                            height: 26.h,
                                            margin: EdgeInsets.only(
                                              right: i == 7 ? 0 : 4.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: filled
                                                  ? AppColors.carbsBlue
                                                  : AppColors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              border: Border.all(
                                                color: filled
                                                    ? AppColors.carbsBlue
                                                    : AppColors.waterBorder,
                                                width: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(16),
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: Material(
                            color: AppColors.carbsBlue,
                            borderRadius: BorderRadius.circular(14.r),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: controller.drinkWater,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    IconPath.pcDrop,
                                    width: 16.r,
                                    height: 16.r,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  Gap.h(8),
                                  Text(
                                    'progress_coach.dashboard.hydration_button'
                                        .tr,
                                    style: text.boldTextStyle(
                                      fontSize: 14.5,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _KpiTile extends StatelessWidget {
  const _KpiTile({
    required this.bg,
    required this.iconPath,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  final Color bg;
  final String iconPath;
  final Color iconColor;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 18.r,
            height: 18.r,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          Gap(10),
          Text(
            value,
            style: text.boldTextStyle(
              fontSize: 22,
              lineHeight: 26,
              color: AppColors.ink,
            ),
          ),
          Gap(2),
          Text(
            label,
            style: text.regularTextStyle(fontSize: 12, color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class _QuickLinkCard extends StatelessWidget {
  const _QuickLinkCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.pearl,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: text.boldTextStyle(
                      fontSize: 14,
                      color: AppColors.ink,
                    ),
                  ),
                  Gap(2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: text.regularTextStyle(
                      fontSize: 12,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(IconPath.hwChevRight, width: 15.r, height: 15.r),
          ],
        ),
      ),
    );
  }
}

class _PracticedCard extends StatelessWidget {
  const _PracticedCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      width: 154.w,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 102.h,
              fit: BoxFit.cover,
            ),
          ),
          Gap(10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: text.boldTextStyle(fontSize: 14, color: AppColors.ink),
          ),
          Gap(2),
          Text(
            subtitle,
            style: text.regularTextStyle(
              fontSize: 11.5,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecoveryCard extends StatelessWidget {
  const _RecoveryCard({
    required this.bg,
    required this.ringSvg,
    required this.muscle,
    required this.status,
    required this.statusColor,
  });

  final Color bg;
  final String ringSvg;
  final String muscle;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(ringSvg, width: 34.r, height: 34.r),
          Gap.h(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  muscle,
                  style: text.boldTextStyle(fontSize: 14, color: AppColors.ink),
                ),
                Gap(2),
                Text(
                  status,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.mediumTextStyle(
                    fontSize: 11.5,
                    color: statusColor,
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
