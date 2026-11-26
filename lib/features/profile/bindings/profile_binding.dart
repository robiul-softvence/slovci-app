import 'package:get/get.dart';
import 'package:flutter_tamplate/features/profile/presentation/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put<ProfileController>(ProfileController());
    }
  }
}
