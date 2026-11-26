import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/verify_email_controller.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  /// Pre-filled with the email typed on the sign-in screen, if any.
  late final TextEditingController emailController = TextEditingController(
    text: Get.arguments is String ? Get.arguments as String : '',
  );

  void sendResetLink() {
    final email = emailController.text.trim();
    final error = AppValidator.validateEmail(email);
    if (error != null) {
      AppHelperFunctions.showSnackBar(error);
      return;
    }

    // TODO(milon): call the forgot-password use case once the auth API is ready.
    Get.toNamed(
      AppRoute.verifyEmailScreen,
      arguments: VerifyEmailArgs(email: email, flow: VerifyFlow.resetPassword),
    );
  }

  void backToSignIn() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
