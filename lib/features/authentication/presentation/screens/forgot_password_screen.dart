import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/forgot_password_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_scaffold.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_text_field.dart';

/// Figma "00d · Forgot Password".
class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'auth.forgot_password.title'.tr,
      subtitle: 'auth.forgot_password.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'auth.forgot_password.button'.tr,
          onPressed: controller.sendResetLink,
        ),
        secondary: AuthFooterLink(
          prompt: 'auth.forgot_password.remembered_prompt'.tr,
          action: 'auth.common.log_in_link'.tr,
          onTap: controller.backToSignIn,
        ),
      ),
      children: [
        const SizedBox(height: 20),
        AuthTextField(
          label: 'auth.common.email_label'.tr,
          hint: 'you@example.com',
          icon: IconPath.mail,
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          autofillHints: const [AutofillHints.email],
          onSubmitted: (_) => controller.sendResetLink(),
        ),
      ],
    );
  }
}
