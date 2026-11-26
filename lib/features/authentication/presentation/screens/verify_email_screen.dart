import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/verify_email_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_scaffold.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/otp_code_field.dart';

/// Figma "00e · Verify Your Email".
class VerifyEmailScreen extends GetView<VerifyEmailController> {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final email = controller.args.email;

    return AuthScaffold(
      title: 'Check your email',
      subtitle:
          'We sent a 6-digit code to ${email.isEmpty ? 'your email' : email}. '
          'Enter it below to verify your account.',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Verify Email',
          onPressed: controller.verify,
        ),
        secondary: AuthFooterLink(
          prompt: 'Wrong email?',
          action: 'Change it',
          onTap: controller.changeEmail,
        ),
      ),
      children: [
        const SizedBox(height: 20),
        Text(
          'Verification code',
          style: text.semiBoldTextStyle(
            fontSize: AppTextStyle.md,
            lineHeight: 20,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 6),
        OtpCodeField(
          controller: controller.codeController,
          focusNode: controller.focusNode,
          code: controller.code,
          hasFocus: controller.hasFocus,
          length: VerifyEmailController.codeLength,
        ),
        const SizedBox(height: 6),
        Obx(() {
          final waiting = controller.secondsLeft.value > 0;
          final base = text.regularTextStyle(
            fontSize: AppTextStyle.md,
            lineHeight: 20,
            color: AppColors.muted,
          );
          return GestureDetector(
            onTap: waiting ? null : controller.resendCode,
            behavior: HitTestBehavior.opaque,
            child: Text.rich(
              TextSpan(
                text: "Didn't get it? ",
                style: base,
                children: [
                  waiting
                      ? TextSpan(
                          text: 'Resend code in ${controller.countdownLabel}',
                        )
                      : TextSpan(
                          text: 'Resend code',
                          style: text.semiBoldTextStyle(
                            fontSize: AppTextStyle.md,
                            lineHeight: 20,
                            color: AppColors.cta,
                          ),
                        ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
