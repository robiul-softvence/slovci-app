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
      title: 'auth.verify_email.title'.tr,
      subtitle: 'auth.verify_email.subtitle'.trParams({
        'email': email.isEmpty ? 'auth.verify_email.your_email'.tr : email,
      }),
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'auth.verify_email.button'.tr,
          onPressed: controller.verify,
        ),
        secondary: AuthFooterLink(
          prompt: 'auth.verify_email.wrong_email_prompt'.tr,
          action: 'auth.verify_email.change_link'.tr,
          onTap: controller.changeEmail,
        ),
      ),
      children: [
        const SizedBox(height: 20),
        Text(
          'auth.verify_email.code_label'.tr,
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
                text: 'auth.verify_email.not_received'.tr,
                style: base,
                children: [
                  waiting
                      ? TextSpan(
                          text: 'auth.verify_email.resend_in'.trParams({
                            'time': controller.countdownLabel,
                          }),
                        )
                      : TextSpan(
                          text: 'auth.verify_email.resend'.tr,
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
