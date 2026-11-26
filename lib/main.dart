import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'core/controllers/locale_controller.dart';
import 'core/controllers/theme_controller.dart';
import 'core/services/cache/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Needed before any token-based network/storage access.
  await StorageService.init();
  // Date/number symbols for EN + FR so DateFormat follows the app language.
  await initializeDateFormatting();

  Get.put<ThemeController>(ThemeController(), permanent: true);
  Get.put<LocaleController>(LocaleController(), permanent: true);

  runApp(const MyApp());
}
