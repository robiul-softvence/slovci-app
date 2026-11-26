import 'package:get/get.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/create_password_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/forgot_password_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/sign_in_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/sign_up_controller.dart';
import 'package:flutter_tamplate/features/authentication/presentation/controllers/verify_email_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<SignUpController>(SignUpController.new);
}

class SignInBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<SignInController>(SignInController.new);
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<ForgotPasswordController>(ForgotPasswordController.new);
}

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<VerifyEmailController>(VerifyEmailController.new);
}

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<CreatePasswordController>(CreatePasswordController.new);
}
