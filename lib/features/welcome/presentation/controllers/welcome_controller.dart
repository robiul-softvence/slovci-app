import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

enum AppLanguage { en, fr }

class WelcomeController extends GetxController {
  final Rx<AppLanguage> language = AppLanguage.en.obs;

  void selectLanguage(AppLanguage value) {
    if (language.value == value) return;
    language.value = value;
    Get.updateLocale(Locale(value.name));
  }

  void getStarted() => Get.toNamed(AppRoute.signUpScreen);

  void openSignIn() => Get.toNamed(AppRoute.signInScreen);
}
