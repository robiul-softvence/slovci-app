import 'package:get/get.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';

class ProgressBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ProgressController>()) {
      Get.put<ProgressController>(ProgressController());
    }
  }
}
