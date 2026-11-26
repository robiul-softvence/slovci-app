import 'package:get/get.dart';
import 'package:flutter_tamplate/features/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_tamplate/features/coach/presentation/controllers/coach_controller.dart';
import 'package:flutter_tamplate/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/controllers/nutrition_controller.dart';
import 'package:flutter_tamplate/features/progress/presentation/controllers/progress_controller.dart';
import 'package:flutter_tamplate/features/workout/presentation/controllers/workout_controller.dart';

/// Tab controllers for the main shell.
///
/// `fenix: true` keeps the factory alive: `Get.offAllNamed(bottomNavScreen)`
/// disposes the previous shell route *after* the new one is built, which
/// deletes these controllers. With fenix they are recreated on next access.
class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(BottomNavController.new, fenix: true);
    Get.lazyPut<HomeController>(HomeController.new, fenix: true);
    Get.lazyPut<WorkoutController>(WorkoutController.new, fenix: true);
    Get.lazyPut<NutritionController>(NutritionController.new, fenix: true);
    Get.lazyPut<ProgressController>(ProgressController.new, fenix: true);
    Get.lazyPut<CoachController>(CoachController.new, fenix: true);
  }
}
