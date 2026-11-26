import 'package:get/get.dart';
import 'package:flutter_tamplate/core/services/network/internet_service.dart';
import 'package:flutter_tamplate/features/authentication/controllers/auth_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<InternetService>(InternetService(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
   
  }
}
