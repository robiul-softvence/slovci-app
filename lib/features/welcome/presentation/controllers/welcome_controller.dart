import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class WelcomeController extends GetxController {
  Rx<AppLanguage> get language => LocaleController.to.language;

  void selectLanguage(AppLanguage value) =>
      LocaleController.to.setLanguage(value);

  void getStarted() => Get.toNamed(AppRoute.signUpScreen);

  void openSignIn() => Get.toNamed(AppRoute.signInScreen);
}
