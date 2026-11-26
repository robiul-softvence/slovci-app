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
      title: 'auth.create_password.title'.tr,
      subtitle: 'auth.create_password.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'auth.create_password.button'.tr,
          onPressed: controller.updatePassword,
        ),
        secondary: AuthFooterLink(
          prompt: 'auth.create_password.back_prompt'.tr,
          action: 'auth.create_password.back_link'.tr,
          onTap: controller.backToSignIn,
        ),
      ),
      children: [
        const SizedBox(height: 20),
        Obx(
          () => AuthTextField(
            label: 'auth.create_password.new_label'.tr,
            hint: 'auth.common.password_hint'.tr,
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
            label: 'auth.create_password.confirm_label'.tr,
            hint: 'auth.create_password.confirm_hint'.tr,
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
