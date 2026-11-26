import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class CreatePasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirm = true.obs;

  void togglePasswordVisibility() => obscurePassword.toggle();

  void toggleConfirmVisibility() => obscureConfirm.toggle();

  void updatePassword() {
    final password = passwordController.text;
    final error = password.length < 8
        ? 'Password must be at least 8 characters.'
        : password != confirmController.text
        ? 'Passwords do not match.'
        : null;
    if (error != null) {
      AppHelperFunctions.showSnackBar(error);
      return;
    }

    // TODO(milon): call the reset-password use case once the auth API is ready.
    _goToSignIn();
    AppHelperFunctions.showSnackBar(
      'Password updated. Log in with your new password.',
    );
  }

  void backToSignIn() => _goToSignIn();

  /// Drops the reset flow but keeps Welcome underneath, so back still works.
  void _goToSignIn() => Get.offNamedUntil(
    AppRoute.signInScreen,
    (route) => route.settings.name == AppRoute.welcomeScreen,
  );

  @override
  void onClose() {
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }
}
