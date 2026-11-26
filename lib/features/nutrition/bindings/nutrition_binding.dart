import 'package:get/get.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';

class NutritionBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<NutritionController>()) {
      Get.put<NutritionController>(NutritionController());
    }
  }
}
