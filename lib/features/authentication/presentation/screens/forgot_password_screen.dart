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
      title: 'Reset your password',
      subtitle:
          "Enter your account email and we'll send you a link to reset your password.",
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Send Reset Link',
          onPressed: controller.sendResetLink,
        ),
        secondary: AuthFooterLink(
          prompt: 'Remembered it?',
          action: 'Log in',
          onTap: controller.backToSignIn,
        ),
      ),
      children: [
        const SizedBox(height: 20),
        AuthTextField(
          label: 'Email',
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
