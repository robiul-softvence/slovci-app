import 'package:get/get.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/controllers/onboarding_controller.dart';

/// Ensures a single shared [OnboardingController] persists across all 14 steps
/// of the onboarding flow.
class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<OnboardingController>()) {
      Get.put<OnboardingController>(OnboardingController());
    }
  }
}
