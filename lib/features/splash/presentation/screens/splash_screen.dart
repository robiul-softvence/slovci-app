import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter_tamplate/features/splash/presentation/widgets/splash_logo.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.cta,
        body: Center(
          child: Padding(
            // Figma content block sits 12 px above the vertical centre.
            padding: EdgeInsets.only(bottom: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: controller.logoOpacity,
                  child: ScaleTransition(
                    scale: controller.logoScale,
                    child: const SplashLogo(),
                  ),
                ),
                const Gap(24),
                AnimatedBuilder(
                  animation: controller.textOffset,
                  builder: (_, child) => Transform.translate(
                    offset: Offset(0, controller.textOffset.value.h),
                    child: child,
                  ),
                  child: FadeTransition(
                    opacity: controller.textOpacity,
                    child: Column(
                      children: [
                        Text(
                          AppText.appName,
                          style: textStyle.getTextStyle(
                            fontFamily: AppTextStyle.brandFont,
                            fontSize: 40,
                            letterSpacing: 1.6,
                            color: AppColors.white,
                          ),
                        ),
                        const Gap(12),
                        Text(
                          'common.app.tagline'.tr,
                          style: textStyle.mediumTextStyle(
                            fontSize: AppTextStyle.lg,
                            color: AppColors.white.withValues(alpha: 0.85),
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
