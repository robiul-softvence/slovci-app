import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/welcome/presentation/controllers/welcome_controller.dart';

/// Figma "Language Toggle EN/FR": frosted pill with the active option in coral.
class LanguageToggle extends GetView<WelcomeController> {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.black.withValues(alpha: 0.06)),
      ),
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _option(context, AppLanguage.en),
            SizedBox(width: 2.w),
            _option(context, AppLanguage.fr),
          ],
        ),
      ),
    );
  }

  Widget _option(BuildContext context, AppLanguage language) {
    final selected = controller.language.value == language;

    return GestureDetector(
      onTap: () => controller.selectLanguage(language),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.cta : AppColors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          language.name.toUpperCase(),
          style: AppTextStyle(context).boldTextStyle(
            fontSize: AppTextStyle.sm,
            color: selected ? AppColors.white : const Color(0xFF404040),
          ),
        ),
      ),
    );
  }
}
