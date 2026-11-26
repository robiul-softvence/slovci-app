import 'package:flutter/material.dart';
import 'package:flutter_tamplate/core/common/styles/global_text_style.dart';
import 'package:flutter_tamplate/core/utils/constants/colors.dart';
import 'package:flutter_tamplate/core/utils/constants/sizer.dart';

/// Figma "Button / Primary": coral CTA, 16 px radius, 16 px vertical padding,
/// Plus Jakarta Sans Bold 16 white label.
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    return SizedBox(
      width: double.infinity,
      height: 52.r,
      child: Material(
        color: enabled ? AppColors.cta : AppColors.cta.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          child: Center(
            child: isLoading
                ? SizedBox.square(
                    dimension: 22.r,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white,
                    ),
                  )
                : Text(
                    label,
                    style: AppTextStyle(context).boldTextStyle(
                      fontSize: AppTextStyle.lg,
                      lineHeight: 20,
                      color: AppColors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
