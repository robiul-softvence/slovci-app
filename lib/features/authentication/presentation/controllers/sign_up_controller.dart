import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/verify_email_controller.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool obscurePassword = true.obs;
  final RxBool agreedToTerms = true.obs;

  void togglePasswordVisibility() => obscurePassword.toggle();

  void setAgreed(bool value) => agreedToTerms.value = value;

  void continueWithApple() =>
      AppHelperFunctions.showSnackBar('auth.social.apple_unavailable'.tr);

  void continueWithGoogle() =>
      AppHelperFunctions.showSnackBar('auth.social.google_unavailable'.tr);

  void createAccount() {
    final email = emailController.text.trim();
    final error =
        AppValidator.validateEmail(email) ??
        (passwordController.text.length < 8
            ? 'auth.validation.password_min_length'.tr
            : null) ??
        (agreedToTerms.value ? null : 'auth.sign_up.accept_terms_error'.tr);
    if (error != null) {
      AppHelperFunctions.showSnackBar(error);
      return;
    }

    // TODO(milon): call the sign-up use case once the auth API is ready.
    Get.toNamed(
      AppRoute.verifyEmailScreen,
      arguments: VerifyEmailArgs(email: email, flow: VerifyFlow.signUp),
    );
  }

  void openSignIn() => Get.offNamed(AppRoute.signInScreen);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
