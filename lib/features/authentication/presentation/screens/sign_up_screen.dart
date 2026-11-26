import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/sign_up_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_scaffold.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/social_sign_in.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/terms_checkbox.dart';

/// Figma "00b · Sign Up".
class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'auth.sign_up.title'.tr,
      subtitle: 'auth.sign_up.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'auth.sign_up.button'.tr,
          onPressed: controller.createAccount,
        ),
        secondary: AuthFooterLink(
          prompt: 'auth.sign_up.have_account_prompt'.tr,
          action: 'auth.common.log_in_link'.tr,
          onTap: controller.openSignIn,
        ),
      ),
      children: [
        SocialSignIn(
          onApple: controller.continueWithApple,
          onGoogle: controller.continueWithGoogle,
        ),
        const SizedBox(height: 20),
        AutofillGroup(
          child: Column(
            children: [
              AuthTextField(
                label: 'auth.common.email_label'.tr,
                hint: 'you@example.com',
                icon: IconPath.mail,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
              ),
              const SizedBox(height: 16),
              Obx(
                () => AuthTextField(
                  label: 'auth.common.password_label'.tr,
                  hint: 'auth.common.password_hint'.tr,
                  icon: IconPath.lock,
                  controller: controller.passwordController,
                  obscureText: controller.obscurePassword.value,
                  onToggleObscure: controller.togglePasswordVisibility,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => TermsCheckbox(
            value: controller.agreedToTerms.value,
            onChanged: controller.setAgreed,
          ),
        ),
      ],
    );
  }
}
