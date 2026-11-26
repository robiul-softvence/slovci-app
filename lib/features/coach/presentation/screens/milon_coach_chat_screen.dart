import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/coach/presentation/controllers/coach_controller.dart';

/// Figma "18 · MILON Coach — Actionable Chat".
class MilonCoachChatScreen extends GetView<CoachController> {
  const MilonCoachChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                      Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.coral,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.milonMarkWhite,
                            width: 22.r,
                            height: 22.r,
                          ),
                        ),
                      ),
                      Gap.h(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MILON Coach',
                              style: text.boldTextStyle(
                                fontSize: 18,
                                lineHeight: 22,
                                color: AppColors.ink,
                              ),
                            ),
                            Gap(2),
                            Row(
                              children: [
                                Container(
                                  width: 7.r,
                                  height: 7.r,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.emerald,
                                  ),
                                ),
                                Gap.h(6),
                                Text(
                                  'Fitness · Recovery · Nutrition',
                                  style: text.regularTextStyle(
                                    fontSize: 12,
                                    color: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: AppColors.pearl,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox.square(
                            dimension: 38.r,
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.hwMore,
                                width: 18.r,
                                height: 18.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Guardrail pill
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 7.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        IconPath.hwShield,
                        width: 14.r,
                        height: 14.r,
                        colorFilter: const ColorFilter.mode(
                          AppColors.muted,
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap.h(6),
                      Flexible(
                        child: Text(
                          'I only answer fitness, recovery & nutrition questions',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: text.regularTextStyle(
                            fontSize: 11.5,
                            color: AppColors.muted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Messages list
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 12.h),
                      itemCount: controller.messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 14.h),
                            child: Center(
                              child: Text(
                                'Today · 7:42 AM',
                                style: text.regularTextStyle(
                                  fontSize: 11.5,
                                  color: AppColors.subtle,
                                ),
                              ),
                            ),
                          );
                        }
                        final msg = controller.messages[index - 1];
                        if (msg.isUser) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 270.w),
                              margin: EdgeInsets.only(bottom: 14.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 13.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.ink,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                msg.text,
                                style: text.regularTextStyle(
                                  fontSize: 14,
                                  lineHeight: 20,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(bottom: 14.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 32.r,
                                height: 32.r,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.coral,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    IconPath.milonMarkWhite,
                                    width: 18.r,
                                    height: 18.r,
                                  ),
                                ),
                              ),
                              Gap.h(8),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(14.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.pearl,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        msg.text,
                                        style: text.regularTextStyle(
                                          fontSize: 14,
                                          lineHeight: 20,
                                          color: AppColors.ink,
                                        ),
                                      ),
                                      if (msg.hasWorkoutPlan) ...[
                                        Gap(12),
                                        _ActionableWorkoutCard(
                                          controller: controller,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Quick prompt pills
                SizedBox(
                  height: 36.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: controller.quickPrompts.length,
                    separatorBuilder: (_, _) => Gap.h(8),
                    itemBuilder: (context, i) {
                      final prompt = controller.quickPrompts[i];
                      return GestureDetector(
                        onTap: () => controller.sendMessage(prompt),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(99.r),
                            border: Border.all(color: AppColors.line),
                          ),
                          child: Text(
                            prompt,
                            style: text.mediumTextStyle(
                              fontSize: 12.5,
                              color: AppColors.ink,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Input composer above floating bottom nav
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 96.h),
                  child: Row(
                    children: [
                      Material(
                        color: AppColors.pearl,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox.square(
                            dimension: 42.r,
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.hwPlus,
                                width: 18.r,
                                height: 18.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.ink,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap.h(8),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: AppColors.pearl,
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                          child: TextField(
                            controller: controller.inputController,
                            onSubmitted: (_) => controller.sendMessage(),
                            style: text.regularTextStyle(
                              fontSize: 14,
                              color: AppColors.ink,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Ask your coach...',
                              hintStyle: text.regularTextStyle(
                                fontSize: 14,
                                color: AppColors.subtle,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap.h(8),
                      Material(
                        color: AppColors.cta,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () => controller.sendMessage(),
                          child: SizedBox.square(
                            dimension: 42.r,
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.nutMic,
                                width: 18.r,
                                height: 18.r,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionableWorkoutCard extends StatelessWidget {
  const _ActionableWorkoutCard({required this.controller});

  final CoachController controller;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  ImagePath.pcCoachWorkoutThumb,
                  width: 44.r,
                  height: 44.r,
                  fit: BoxFit.cover,
                ),
              ),
              Gap.h(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Body Gym · Wrist-Safe',
                      style: text.boldTextStyle(
                        fontSize: 14,
                        color: AppColors.ink,
                      ),
                    ),
                    Gap(2),
                    Text(
                      '45 min · 5 exercises · Gym',
                      style: text.regularTextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(12),
          ...controller.generatedWorkoutExercises.map((item) {
            final (num, name, detail) = item;
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24.w,
                    child: Text(
                      num,
                      style: text.boldTextStyle(
                        fontSize: 13,
                        color: AppColors.coral,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: text.boldTextStyle(
                            fontSize: 13.5,
                            color: AppColors.ink,
                          ),
                        ),
                        Text(
                          detail,
                          style: text.regularTextStyle(
                            fontSize: 12,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          Gap(4),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: Material(
                    color: AppColors.cta,
                    borderRadius: BorderRadius.circular(14.r),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: controller.startGeneratedSession,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            IconPath.hwPlay,
                            width: 14.r,
                            height: 14.r,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap.h(6),
                          Text(
                            'Start Session',
                            style: text.boldTextStyle(
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Gap.h(8),
              Obx(
                () => Material(
                  color: controller.savedWorkout.value
                      ? AppColors.peach
                      : AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    side: const BorderSide(color: AppColors.line),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: controller.toggleBookmark,
                    child: SizedBox.square(
                      dimension: 44.r,
                      child: Center(
                        child: SvgPicture.asset(
                          IconPath.pcBookmark,
                          width: 18.r,
                          height: 18.r,
                          colorFilter: ColorFilter.mode(
                            controller.savedWorkout.value
                                ? AppColors.cta
                                : AppColors.ink,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
