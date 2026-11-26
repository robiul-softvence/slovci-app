import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';

/// Figma "16c · Progress — Weekly Review".
class ProgressWeeklyReviewScreen extends GetView<ProgressController> {
  const ProgressWeeklyReviewScreen({super.key});

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
                              IconPath.hwClose,
                              width: 17.r,
                              height: 17.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Weekly Review',
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
                      Text(
                        'WEEK 12 · NOV 16–22',
                        style: text.boldTextStyle(
                          fontSize: 11.5,
                          letterSpacing: 0.7,
                          color: AppColors.cta,
                        ),
                      ),
                      Gap(6),
                      Text(
                        'Your week in review',
                        style: text.boldTextStyle(
                          fontSize: 28,
                          lineHeight: 34,
                          letterSpacing: -0.5,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(6),
                      Text(
                        "Great consistency, Solène. Here's how your week went.",
                        style: text.regularTextStyle(
                          fontSize: 14,
                          lineHeight: 20,
                          color: AppColors.muted,
                        ),
                      ),
                      Gap(18),
                      // Dark WORKOUTS hero card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(18.r),
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WORKOUTS',
                              style: text.boldTextStyle(
                                fontSize: 11,
                                letterSpacing: 0.7,
                                color: AppColors.lime,
                              ),
                            ),
                            Gap(8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '3 / 4',
                                  style: text.boldTextStyle(
                                    fontSize: 32,
                                    lineHeight: 36,
                                    color: AppColors.white,
                                  ),
                                ),
                                Gap.h(10),
                                Text(
                                  'sessions done',
                                  style: text.regularTextStyle(
                                    fontSize: 14,
                                    color: AppColors.white.withValues(
                                      alpha: 0.72,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(99.r),
                              child: LinearProgressIndicator(
                                value: 0.75,
                                minHeight: 7.h,
                                backgroundColor: AppColors.white.withValues(
                                  alpha: 0.16,
                                ),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.lime,
                                ),
                              ),
                            ),
                            Gap(10),
                            Text(
                              '2 h 15 of training · 54 sets · 1,420 kcal burned',
                              style: text.regularTextStyle(
                                fontSize: 12.5,
                                color: AppColors.white.withValues(alpha: 0.72),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(12),
                      // 2x2 stat grid
                      Row(
                        children: const [
                          Expanded(
                            child: _ReviewMetricCard(
                              bg: AppColors.peach,
                              title: 'Weight',
                              value: '−0.5 kg',
                              subtitle: '62.4 → 61.9 kg',
                            ),
                          ),
                          Gap.h(12),
                          Expanded(
                            child: _ReviewMetricCard(
                              bg: AppColors.pearl,
                              title: 'Nutrition',
                              value: '5 / 7',
                              subtitle: 'days on target',
                            ),
                          ),
                        ],
                      ),
                      Gap(12),
                      Row(
                        children: const [
                          Expanded(
                            child: _ReviewMetricCard(
                              bg: AppColors.pearl,
                              title: 'Hydration',
                              value: '1.8 L',
                              subtitle: 'average per day',
                            ),
                          ),
                          Gap.h(12),
                          Expanded(
                            child: _ReviewMetricCard(
                              bg: AppColors.peach,
                              title: 'Streak',
                              value: '5 days',
                              subtitle: 'your best so far',
                            ),
                          ),
                        ],
                      ),
                      Gap(22),
                      Text(
                        'Highlights',
                        style: text.boldTextStyle(
                          fontSize: 18,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(12),
                      const _HighlightRow(
                        title: 'New record',
                        subtitle: 'Goblet Squat: 16 kg × 12 reps',
                      ),
                      Gap(10),
                      const _HighlightRow(
                        title: 'Best day',
                        subtitle: 'Wednesday, 100% of sets completed',
                      ),
                      Gap(10),
                      const _HighlightRow(
                        title: 'Recovery',
                        subtitle: 'Quads and glutes fully recovered',
                      ),
                      Gap(16),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.peach,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MILON COACH',
                              style: text.boldTextStyle(
                                fontSize: 11,
                                letterSpacing: 0.7,
                                color: AppColors.cta,
                              ),
                            ),
                            Gap(6),
                            Text(
                              'Solid week! Next week we keep 3 sessions and add 1 kg on your squats. Try to drink one more glass of water a day.',
                              style: text.regularTextStyle(
                                fontSize: 13.5,
                                lineHeight: 20,
                                color: AppColors.ink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomActionBar(
                primary: AppPrimaryButton(
                  label: 'Start my weekly check-in',
                  onPressed: controller.openWeeklyCheckin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewMetricCard extends StatelessWidget {
  const _ReviewMetricCard({
    required this.bg,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  final Color bg;
  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: text.regularTextStyle(fontSize: 12.5, color: AppColors.muted),
          ),
          Gap(6),
          Text(
            value,
            style: text.boldTextStyle(
              fontSize: 24,
              lineHeight: 28,
              color: AppColors.ink,
            ),
          ),
          Gap(4),
          Text(
            subtitle,
            style: text.regularTextStyle(fontSize: 12, color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class _HighlightRow extends StatelessWidget {
  const _HighlightRow({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          Container(
            width: 8.r,
            height: 8.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cta,
            ),
          ),
          Gap.h(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: text.boldTextStyle(fontSize: 14, color: AppColors.ink),
                ),
                Gap(2),
                Text(
                  subtitle,
                  style: text.regularTextStyle(
                    fontSize: 12.5,
                    color: AppColors.muted,
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
