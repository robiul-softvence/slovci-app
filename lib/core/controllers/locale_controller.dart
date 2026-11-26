import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_tamplate/core/services/cache/storage_service.dart';
import 'package:flutter_tamplate/core/utils/constants/enums.dart';

/// Single source of truth for the app language (EN / FR).
///
/// Restores the saved choice on start, falls back to the device language,
/// and persists every change through [StorageService].
class LocaleController extends GetxController {
  static LocaleController get to => Get.find();

  static const Locale fallbackLocale = Locale('en');

  late final Rx<AppLanguage> language = _initialLanguage().obs;

  Locale get locale => Locale(language.value.name);

  bool get isFrench => language.value == AppLanguage.fr;

  @override
  void onInit() {
    super.onInit();
    Intl.defaultLocale = language.value.name;
  }

  Future<void> setLanguage(AppLanguage value) async {
    if (language.value == value) return;
    language.value = value;
    Intl.defaultLocale = value.name;
    await Get.updateLocale(locale);
    await StorageService.saveLanguageCode(value.name);
  }

  static AppLanguage _initialLanguage() {
    final code =
        StorageService.languageCode ??
        PlatformDispatcher.instance.locale.languageCode;
    return AppLanguage.values.firstWhere(
      (l) => l.name == code,
      orElse: () => AppLanguage.en,
    );
  }
}
