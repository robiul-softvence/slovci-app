import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';

/// Figma "19c · Profile — Log Out Confirm" centered modal dialog.
class LogOutConfirmDialog extends StatelessWidget {
  const LogOutConfirmDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: AppColors.ink.withValues(alpha: 0.45),
      builder: (_) => const LogOutConfirmDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final text = AppTextStyle(context);

    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52.r,
              height: 52.r,
              decoration: BoxDecoration(
                color: AppColors.pearl,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  IconPath.prLogout,
                  width: 24.r,
                  height: 24.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Gap(16),
            Text(
              'Log out of MILON?',
              style: text.boldTextStyle(fontSize: 20, color: AppColors.ink),
            ),
            Gap(8),
            Text(
              "Your plan and progress are saved. You'll need to sign in again.",
              textAlign: TextAlign.center,
              style: text.regularTextStyle(
                fontSize: 13.5,
                lineHeight: 19,
                color: AppColors.muted,
              ),
            ),
            Gap(22),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: Material(
                color: AppColors.ink,
                borderRadius: BorderRadius.circular(14.r),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: controller.performLogOut,
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: text.boldTextStyle(
                        fontSize: 15,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Gap(12),
            GestureDetector(
              onTap: Get.back,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Text(
                  'Cancel',
                  style: text.semiBoldTextStyle(
                    fontSize: 14.5,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Figma "19d · Profile — Delete Account Confirm" modal bottom sheet.
class DeleteAccountConfirmSheet extends StatelessWidget {
  const DeleteAccountConfirmSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => const DeleteAccountConfirmSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final text = AppTextStyle(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 28.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.line,
                  borderRadius: BorderRadius.circular(99.r),
                ),
              ),
            ),
            Gap(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46.r,
                  height: 46.r,
                  decoration: BoxDecoration(
                    color: AppColors.coralSoft,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      IconPath.prTrash,
                      width: 22.r,
                      height: 22.r,
                      colorFilter: const ColorFilter.mode(
                        AppColors.dangerDark,
                        BlendMode.srcIn,
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
                        'Delete your account?',
                        style: text.boldTextStyle(
                          fontSize: 20,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(2),
                      Text(
                        "This is permanent and can't be undone.",
                        style: text.regularTextStyle(
                          fontSize: 13,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: AppColors.pearl,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: Get.back,
                    child: SizedBox.square(
                      dimension: 36.r,
                      child: Center(
                        child: SvgPicture.asset(
                          IconPath.hwClose,
                          width: 16.r,
                          height: 16.r,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: AppColors.pearl,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WHAT WILL BE DELETED',
                    style: text.boldTextStyle(
                      fontSize: 10.5,
                      letterSpacing: 0.6,
                      color: AppColors.muted,
                    ),
                  ),
                  Gap(10),
                  ...[
                    'Workout history, records and progress',
                    'Meal plans and grocery lists',
                    'Health data: injuries, weight, check-ins',
                    'MILON Coach conversations',
                  ].map(
                    (line) => Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: Row(
                        children: [
                          Container(
                            width: 6.r,
                            height: 6.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.dangerDark,
                            ),
                          ),
                          Gap.h(10),
                          Expanded(
                            child: Text(
                              line,
                              style: text.regularTextStyle(
                                fontSize: 13,
                                color: AppColors.ink,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: AppColors.amberSoft,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconPath.nutAlert,
                        width: 17.r,
                        height: 17.r,
                      ),
                      Gap.h(8),
                      Text(
                        'Your Pro subscription is still active',
                        style: text.boldTextStyle(
                          fontSize: 13.5,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                  Gap(6),
                  Text(
                    "It's billed by Apple, so deleting your account doesn't cancel it. Cancel it first in Settings › Apple ID › Subscriptions.",
                    style: text.regularTextStyle(
                      fontSize: 12.5,
                      lineHeight: 17,
                      color: AppColors.ink,
                    ),
                  ),
                  Gap(8),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      controller.openSubscription();
                    },
                    child: Text(
                      'Manage subscription  ›',
                      style: text.semiBoldTextStyle(
                        fontSize: 13,
                        color: AppColors.cta,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(14),
            Row(
              children: [
                SvgPicture.asset(
                  IconPath.prDownload,
                  width: 16.r,
                  height: 16.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.carbsBlue,
                    BlendMode.srcIn,
                  ),
                ),
                Gap.h(8),
                Text(
                  'Download a copy of my data first',
                  style: text.semiBoldTextStyle(
                    fontSize: 13.5,
                    color: AppColors.carbsBlue,
                  ),
                ),
              ],
            ),
            Gap(16),
            Text(
              'Type DELETE to confirm',
              style: text.semiBoldTextStyle(fontSize: 13.5, color: AppColors.ink),
            ),
            Gap(8),
            TextField(
              controller: controller.deleteConfirmController,
              style: text.mediumTextStyle(fontSize: 14.5, color: AppColors.ink),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 14.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: const BorderSide(
                    color: AppColors.dangerDark,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: const BorderSide(
                    color: AppColors.dangerDark,
                    width: 1.8,
                  ),
                ),
              ),
            ),
            Gap(16),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: Material(
                color: AppColors.dangerDark,
                borderRadius: BorderRadius.circular(16.r),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: controller.performDeleteAccount,
                  child: Center(
                    child: Text(
                      'Delete My Account Permanently',
                      style: text.boldTextStyle(
                        fontSize: 15,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Gap(12),
            Center(
              child: GestureDetector(
                onTap: Get.back,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    'Keep My Account',
                    style: text.boldTextStyle(
                      fontSize: 14.5,
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
