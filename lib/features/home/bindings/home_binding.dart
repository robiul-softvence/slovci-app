import 'package:get/get.dart';
import 'package:flutter_tamplate/features/home/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<HomeController>()) {
      Get.lazyPut<HomeController>(HomeController.new, fenix: true);
    }
  }
}
