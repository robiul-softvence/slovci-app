import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Figma "Checkbox/On" + "I agree to the Terms of Use and Privacy Policy."
class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: value ? AppColors.cta : AppColors.white,
              borderRadius: BorderRadius.circular(7),
              border: value
                  ? null
                  : Border.all(color: AppColors.line, width: 1.5),
            ),
            child: value
                ? SvgPicture.asset(IconPath.check, width: 14, height: 14)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'auth.sign_up.terms'.tr,
              style: AppTextStyle(context).regularTextStyle(
                fontSize: AppTextStyle.md,
                lineHeight: 20,
                color: AppColors.muted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
