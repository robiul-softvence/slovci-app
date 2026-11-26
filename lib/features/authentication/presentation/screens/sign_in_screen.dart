import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/app_primary_button.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/sign_in_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_scaffold.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:flutter_tamplate/features/authentication/presentation/widgets/social_sign_in.dart';

/// Figma "00c · Sign In".
class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'auth.sign_in.title'.tr,
      subtitle: 'auth.sign_in.subtitle'.tr,
      footer: BottomActionBar(
        primary: AppPrimaryButton(
          label: 'auth.sign_in.button'.tr,
          onPressed: controller.logIn,
        ),
        secondary: AuthFooterLink(
          prompt: 'auth.sign_in.new_prompt'.tr,
          action: 'auth.sign_in.create_account_link'.tr,
          onTap: controller.openSignUp,
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
                  hint: '••••••••••',
                  icon: IconPath.lock,
                  controller: controller.passwordController,
                  obscureText: controller.obscurePassword.value,
                  onToggleObscure: controller.togglePasswordVisibility,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                  onSubmitted: (_) => controller.logIn(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: controller.openForgotPassword,
          behavior: HitTestBehavior.opaque,
          child: Text(
            'auth.sign_in.forgot_password'.tr,
            style: AppTextStyle(context).semiBoldTextStyle(
              fontSize: AppTextStyle.md,
              lineHeight: 20,
              color: AppColors.cta,
            ),
          ),
        ),
      ],
    );
  }
}
