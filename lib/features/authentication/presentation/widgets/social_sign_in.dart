import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Figma "Continue with Apple / Google" buttons followed by the
/// "or with email" divider.
class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    super.key,
    required this.onApple,
    required this.onGoogle,
  });

  final VoidCallback onApple;
  final VoidCallback onGoogle;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Column(
      children: [
        const SizedBox(height: 24),
        _SocialButton(
          letter: 'A',
          label: 'auth.social.continue_apple'.tr,
          background: AppColors.ink,
          foreground: AppColors.white,
          badge: AppColors.white,
          onTap: onApple,
        ),
        const SizedBox(height: 10),
        _SocialButton(
          letter: 'G',
          label: 'auth.social.continue_google'.tr,
          background: AppColors.white,
          foreground: AppColors.ink,
          badge: AppColors.pearl,
          border: AppColors.line,
          onTap: onGoogle,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Expanded(child: Divider(height: 1, color: AppColors.line)),
            const SizedBox(width: 12),
            Text(
              'auth.social.or_email'.tr,
              style: text.mediumTextStyle(
                fontSize: AppTextStyle.sm,
                lineHeight: 16,
                color: AppColors.subtle,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(child: Divider(height: 1, color: AppColors.line)),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.letter,
    required this.label,
    required this.background,
    required this.foreground,
    required this.badge,
    required this.onTap,
    this.border,
  });

  final String letter;
  final String label;
  final Color background;
  final Color foreground;
  final Color badge;
  final Color? border;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final radius = BorderRadius.circular(16.r);

    return Material(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: border == null ? BorderSide.none : BorderSide(color: border!),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: badge, shape: BoxShape.circle),
                child: Text(
                  letter,
                  style: text.extraBoldTextStyle(
                    fontSize: AppTextStyle.sm,
                    lineHeight: 16,
                    color: AppColors.ink,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: text.boldTextStyle(
                  fontSize: AppTextStyle.lg,
                  lineHeight: 23,
                  color: foreground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
