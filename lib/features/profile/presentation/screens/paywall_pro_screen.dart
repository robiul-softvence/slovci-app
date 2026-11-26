import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/widgets/onboarding_cards.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';

/// Figma "20 · Paywall — MILON Pro Subscription".
class PaywallProScreen extends GetView<ProfileController> {
  const PaywallProScreen({super.key});

  static const _benefits = [
    'Unlimited workout & meal plans',
    'Injury-adaptive programs that protect your body',
    'Auto grocery lists that fit your budget',
    'Post-workout analysis & 24/7 MILON Coach',
  ];

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
              // Top bar: Restore + Close X
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => AppHelperFunctions.showSnackBar(
                        'Purchases restored!',
                      ),
                      child: Text(
                        'Restore',
                        style: text.semiBoldTextStyle(
                          fontSize: 14.5,
                          color: AppColors.muted,
                        ),
                      ),
                    ),
                    Material(
                      color: AppColors.pearl,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: Get.back,
                        child: SizedBox.square(
                          dimension: 38.r,
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
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
                  child: Column(
                    children: [
                      // MILON Coral App Mark
                      Container(
                        width: 72.r,
                        height: 72.r,
                        decoration: BoxDecoration(
                          color: AppColors.coral,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.milonMarkWhite,
                            width: 38.r,
                            height: 38.r,
                          ),
                        ),
                      ),
                      Gap(16),
                      Text(
                        'Unlock MILON Pro',
                        style: text.boldTextStyle(
                          fontSize: 28,
                          lineHeight: 34,
                          letterSpacing: -0.5,
                          color: AppColors.ink,
                        ),
                      ),
                      Gap(6),
                      Text(
                        'Every day, stronger.',
                        style: text.boldTextStyle(
                          fontSize: 16,
                          color: AppColors.cta,
                        ),
                      ),
                      Gap(20),
                      // 4 lime check benefits
                      ..._benefits.map(
                        (item) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Row(
                            children: [
                              Container(
                                width: 24.r,
                                height: 24.r,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lime,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    IconPath.hwCheck,
                                    width: 13.r,
                                    height: 13.r,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.ink,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              Gap.h(12),
                              Expanded(
                                child: Text(
                                  item,
                                  style: text.mediumTextStyle(
                                    fontSize: 14,
                                    lineHeight: 19,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(12),
                      // 3 Plan options
                      Obx(
                        () => Column(
                          children: [
                            _PaywallPlanCard(
                              title: 'Monthly',
                              subtitle: 'Billed monthly',
                              price: '€19.90',
                              period: 'per month',
                              selected:
                                  controller.selectedPaywallPlan.value == 0,
                              onTap: () =>
                                  controller.selectedPaywallPlan.value = 0,
                            ),
                            Gap(14),
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                _PaywallPlanCard(
                                  title: 'Annual',
                                  subtitle: '€238.80 −10% · €17.91/mo',
                                  price: '€214.90',
                                  period: 'per year',
                                  highlightSubtitle: true,
                                  selected:
                                      controller.selectedPaywallPlan.value == 1,
                                  onTap: () =>
                                      controller.selectedPaywallPlan.value = 1,
                                ),
                                Positioned(
                                  top: -11.h,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.ink,
                                      borderRadius: BorderRadius.circular(99.r),
                                    ),
                                    child: Text(
                                      'BEST OFFER',
                                      style: text.boldTextStyle(
                                        fontSize: 10.5,
                                        letterSpacing: 0.7,
                                        color: AppColors.lime,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(12),
                            _PaywallPlanCard(
                              title: 'Quarterly',
                              subtitle: '€59.70 −5% · €18.90/mo',
                              price: '€56.70',
                              period: 'per 3 months',
                              selected:
                                  controller.selectedPaywallPlan.value == 2,
                              onTap: () =>
                                  controller.selectedPaywallPlan.value = 2,
                            ),
                          ],
                        ),
                      ),
                      Gap(14),
                      // Promo code row
                      Container(
                        padding: EdgeInsets.fromLTRB(14.w, 6.h, 6.w, 6.h),
                        decoration: BoxDecoration(
                          color: AppColors.pearl,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconPath.prTag,
                              width: 17.r,
                              height: 17.r,
                            ),
                            Gap.h(10),
                            Expanded(
                              child: TextField(
                                controller: controller.promoCodeController,
                                style: text.regularTextStyle(
                                  fontSize: 14,
                                  color: AppColors.ink,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Promo code',
                                  hintStyle: text.regularTextStyle(
                                    fontSize: 14,
                                    color: AppColors.subtle,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                            Material(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () => AppHelperFunctions.showSnackBar(
                                  'Promo code applied!',
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 10.h,
                                  ),
                                  child: Text(
                                    'Apply',
                                    style: text.semiBoldTextStyle(
                                      fontSize: 13.5,
                                      color: AppColors.ink,
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
              BottomActionBar(
                primary: AppPrimaryButton(
                  label: 'Start 7-Day Free Trial',
                  onPressed: () {
                    Get.back();
                    AppHelperFunctions.showSnackBar(
                      'Welcome to MILON Pro!',
                    );
                  },
                ),
                secondary: Column(
                  children: [
                    Text(
                      'Cancel anytime.',
                      style: text.regularTextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                    Gap(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Restore Purchase',
                          style: text.boldTextStyle(
                            fontSize: 12,
                            color: AppColors.ink,
                          ),
                        ),
                        Text(
                          '  ·  Terms  ·  Privacy',
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
            ],
          ),
        ),
      ),
    );
  }
}

class _PaywallPlanCard extends StatelessWidget {
  const _PaywallPlanCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.period,
    required this.selected,
    required this.onTap,
    this.highlightSubtitle = false,
  });

  final String title;
  final String subtitle;
  final String price;
  final String period;
  final bool selected;
  final VoidCallback onTap;
  final bool highlightSubtitle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.line,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Row(
          children: [
            OnboardingCheckBadge(selected: selected),
            Gap.h(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: text.boldTextStyle(
                      fontSize: 17,
                      color: AppColors.ink,
                    ),
                  ),
                  Gap(2),
                  Text(
                    subtitle,
                    style: highlightSubtitle
                        ? text.semiBoldTextStyle(
                            fontSize: 12.5,
                            color: AppColors.cta,
                          )
                        : text.regularTextStyle(
                            fontSize: 12.5,
                            color: AppColors.muted,
                          ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: text.boldTextStyle(fontSize: 18, color: AppColors.ink),
                ),
                Text(
                  period,
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
    );
  }
}
