import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/create_password_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_scaffold.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_text_field.dart';

/// Figma "00f · Create New Password".
class CreatePasswordScreen extends GetView<CreatePasswordController> {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Create a new password',
      subtitle: 'Choose a password you don’t use anywhere else.',
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'Update Password',
          onPressed: controller.updatePassword,
        ),
        secondary: AuthFooterLink(
          prompt: 'Back to',
          action: 'Log in',
          onTap: controller.backToSignIn,
        ),
      ),
      children: [
        const SizedBox(height: 20),
        Obx(
          () => AuthTextField(
            label: 'New password',
            hint: 'At least 8 characters',
            icon: IconPath.lock,
            controller: controller.passwordController,
            obscureText: controller.obscurePassword.value,
            onToggleObscure: controller.togglePasswordVisibility,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => AuthTextField(
            label: 'Confirm new password',
            hint: 'Re-enter password',
            icon: IconPath.lock,
            controller: controller.confirmController,
            obscureText: controller.obscureConfirm.value,
            onToggleObscure: controller.toggleConfirmVisibility,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => controller.updatePassword(),
          ),
        ),
      ],
    );
  }
}
