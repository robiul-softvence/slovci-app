import 'package:get/get.dart';
import 'package:flutter_tamplate/features/welcome/presentation/controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(WelcomeController.new);
  }
}
