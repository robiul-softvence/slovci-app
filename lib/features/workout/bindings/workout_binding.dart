import 'package:get/get.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

class WorkoutBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<WorkoutController>()) {
      Get.put<WorkoutController>(WorkoutController());
    }
  }
}
