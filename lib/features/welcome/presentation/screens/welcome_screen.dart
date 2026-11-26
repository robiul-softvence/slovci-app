import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/welcome/presentation/controllers/welcome_controller.dart';
import 'package:flutter_tamplate/features/welcome/presentation/widgets/language_toggle.dart';
import 'package:flutter_tamplate/features/welcome/presentation/widgets/welcome_hero.dart';

/// Figma "00a · Welcome".
class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WelcomeHero(languageToggle: LanguageToggle()),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 28, 24.w, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'common.welcome.eyebrow'.tr,
                            style: text.boldTextStyle(
                              fontSize: 11,
                              lineHeight: 14,
                              letterSpacing: 0.88,
                              color: AppColors.cta,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'common.welcome.title'.tr,
                            style: text.getTextStyle(
                              fontFamily: AppTextStyle.brandFont,
                              fontSize: 44,
                              lineHeight: 48,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'common.welcome.subtitle'.tr,
                            style: text.regularTextStyle(
                              fontSize: AppTextStyle.lg,
                              lineHeight: 24,
                              color: AppColors.muted,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const _PageDots(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomActionBar(
              primary: AppPrimaryButton(
                label: 'common.welcome.get_started'.tr,
                onPressed: controller.getStarted,
              ),
              secondary: GestureDetector(
                onTap: controller.openSignIn,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    'common.welcome.have_account'.tr,
                    style: text.semiBoldTextStyle(
                      fontSize: AppTextStyle.md,
                      lineHeight: 20,
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

/// Page indicator: active pill (24 × 6, coral) + two inactive dots.
class _PageDots extends StatelessWidget {
  const _PageDots();

  @override
  Widget build(BuildContext context) {
    Widget dot({required bool active}) => Container(
      width: active ? 24 : 6,
      height: 6,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.coral : AppColors.line,
        borderRadius: BorderRadius.circular(3),
      ),
    );

    return Row(
      children: [dot(active: true), dot(active: false), dot(active: false)],
    );
  }
}
