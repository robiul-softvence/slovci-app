import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

enum VerifyFlow { signUp, resetPassword }

class VerifyEmailArgs {
  const VerifyEmailArgs({required this.email, required this.flow});

  final String email;
  final VerifyFlow flow;
}

class VerifyEmailController extends GetxController {
  static const int codeLength = 6;
  static const int resendSeconds = 60;

  late final VerifyEmailArgs args = Get.arguments is VerifyEmailArgs
      ? Get.arguments as VerifyEmailArgs
      : const VerifyEmailArgs(email: '', flow: VerifyFlow.signUp);

  final codeController = TextEditingController();
  final focusNode = FocusNode();

  final RxString code = ''.obs;
  final RxBool hasFocus = false.obs;
  final RxInt secondsLeft = resendSeconds.obs;

  Timer? _timer;

  bool get isComplete => code.value.length == codeLength;

  String get countdownLabel {
    final s = secondsLeft.value;
    return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }

  @override
  void onInit() {
    super.onInit();
    codeController.addListener(() => code.value = codeController.text);
    focusNode.addListener(() => hasFocus.value = focusNode.hasFocus);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    secondsLeft.value = resendSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft.value <= 1) {
        secondsLeft.value = 0;
        t.cancel();
      } else {
        secondsLeft.value--;
      }
    });
  }

  void resendCode() {
    if (secondsLeft.value > 0) return;
    // TODO(milon): call the resend-code use case once the auth API is ready.
    codeController.clear();
    _startTimer();
    AppHelperFunctions.showSnackBar('A new code is on its way.');
  }

  void verify() {
    if (!isComplete) {
      AppHelperFunctions.showSnackBar('Enter the 6-digit code.');
      return;
    }

    // TODO(milon): call the verify-code use case once the auth API is ready.
    switch (args.flow) {
      case VerifyFlow.signUp:
        Get.offAllNamed(AppRoute.onboardingProfileGoalsScreen);
      case VerifyFlow.resetPassword:
        Get.offNamed(AppRoute.createPasswordScreen);
    }
  }

  void changeEmail() => Get.back();

  @override
  void onClose() {
    _timer?.cancel();
    codeController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
