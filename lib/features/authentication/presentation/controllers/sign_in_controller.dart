import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool obscurePassword = true.obs;

  void togglePasswordVisibility() => obscurePassword.toggle();

  void continueWithApple() => AppHelperFunctions.showSnackBar(
    'Sign in with Apple is not connected yet.',
  );

  void continueWithGoogle() => AppHelperFunctions.showSnackBar(
    'Sign in with Google is not connected yet.',
  );

  void logIn() {
    final error =
        AppValidator.validateEmail(emailController.text.trim()) ??
        (passwordController.text.isEmpty ? 'Password is required.' : null);
    if (error != null) {
      AppHelperFunctions.showSnackBar(error);
      return;
    }

    // TODO(milon): call the sign-in use case once the auth API is ready.
    Get.offAllNamed(AppRoute.bottomNavScreen);
  }

  void openForgotPassword() => Get.toNamed(
    AppRoute.forgotPasswordScreen,
    arguments: emailController.text.trim(),
  );

  void openSignUp() => Get.offNamed(AppRoute.signUpScreen);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
