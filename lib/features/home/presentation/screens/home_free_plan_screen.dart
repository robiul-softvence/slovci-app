import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentaion/UI/bottom_nav_screen.dart';
import 'package:flutter_tamplate/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

/// Figma "05b · Home — Free Plan (Locked Content)".
class HomeFreePlanScreen extends GetView<HomeController> {
  const HomeFreePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final navController = Get.isRegistered<BottomNavController>()
        ? Get.find<BottomNavController>()
        : Get.put(BottomNavController());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        bottomNavigationBar: MilonFloatingNavBar(controller: navController),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 110.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with FREE PLAN badge
                Row(
                  children: [
                    GestureDetector(
                      onTap: Get.back,
                      child: Container(
                        width: 44.r,
                        height: 44.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.peach,
                        ),
                        child: Center(
                          child: Text(
                            'S',
                            style: text.boldTextStyle(
                              fontSize: 18,
                              color: AppColors.cta,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap.h(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.todayDateLabel.value,
                            style: text.regularTextStyle(
                              fontSize: 13,
                              color: AppColors.muted,
                            ),
                          ),
                          Gap(2),
                          Text(
                            'Hello, ${controller.userName.value}',
                            style: text.boldTextStyle(
                              fontSize: 22,
                              lineHeight: 26,
                              letterSpacing: -0.4,
                              color: AppColors.ink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 7.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pearl,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: Text(
                        'FREE PLAN',
                        style: text.boldTextStyle(
                          fontSize: 11,
                          letterSpacing: 0.6,
                          color: AppColors.muted,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(18),
                // 2 free photo scans left banner
                Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42.r,
                        height: 42.r,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.hwCamera,
                            width: 20.r,
                            height: 20.r,
                          ),
                        ),
                      ),
                      Gap.h(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2 free photo scans left',
                              style: text.boldTextStyle(
                                fontSize: 14.5,
                                lineHeight: 19,
                                color: AppColors.ink,
                              ),
                            ),
                            Gap(2),
                            Text(
                              'Snap your plate to get calories & macros',
                              style: text.regularTextStyle(
                                fontSize: 12.5,
                                lineHeight: 16,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        IconPath.hwChevRight,
                        width: 16.r,
                        height: 16.r,
                      ),
                    ],
                  ),
                ),
                Gap(16),
                // Peach YOUR FREE SESSION card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18.r),
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'YOUR FREE SESSION',
                            style: text.boldTextStyle(
                              fontSize: 11,
                              letterSpacing: 0.7,
                              color: AppColors.cta,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(99.r),
                            ),
                            child: Text(
                              'Included',
                              style: text.boldTextStyle(
                                fontSize: 11.5,
                                color: AppColors.emerald,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Text(
                        'Full Body A · 45 min · Home',
                        style: text.boldTextStyle(
                          fontSize: 19,
                          lineHeight: 24,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(4),
                      Text(
                        'Wrist-safe · 6 exercises',
                        style: text.regularTextStyle(
                          fontSize: 13,
                          color: AppColors.muted,
                        ),
                      ),
                      Gap(16),
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: Material(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(14.r),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => Get.toNamed(
                              AppRoute.workoutActiveSetScreen,
                            ),
                            child: Center(
                              child: Text(
                                'Start Free Session',
                                style: text.boldTextStyle(
                                  fontSize: 15,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(18),
                // Locked program card with subtle outer preview frame
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.pearl,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 22.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.ink.withValues(alpha: 0.06),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 48.r,
                          height: 48.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.peach,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.hwLock,
                              width: 22.r,
                              height: 22.r,
                            ),
                          ),
                        ),
                        Gap(14),
                        Text(
                          'Your full program is waiting',
                          textAlign: TextAlign.center,
                          style: text.boldTextStyle(
                            fontSize: 19,
                            lineHeight: 24,
                            color: AppColors.ink,
                          ),
                        ),
                        Gap(8),
                        Text(
                          'Meal plan, grocery list, all 4 weekly sessions and your MILON Coach.',
                          textAlign: TextAlign.center,
                          style: text.regularTextStyle(
                            fontSize: 13.5,
                            lineHeight: 19,
                            color: AppColors.muted,
                          ),
                        ),
                        Gap(18),
                        AppPrimaryButton(
                          label: 'Try 7 Days Free',
                          onPressed: Get.back,
                        ),
                        Gap(12),
                        Text(
                          'Then annual price (TBC) · cancel anytime',
                          style: text.regularTextStyle(
                            fontSize: 12,
                            color: AppColors.muted,
                          ),
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
    );
  }
}
