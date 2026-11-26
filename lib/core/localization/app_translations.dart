import 'package:get/get.dart';

import 'strings/common_strings.dart';
import 'strings/auth_strings.dart';
import 'strings/onboarding_strings.dart';
import 'strings/home_workout_strings.dart';
import 'strings/nutrition_strings.dart';
import 'strings/progress_coach_strings.dart';
import 'strings/profile_strings.dart';

/// GetX translations. Use `'key'.tr`, `'key'.trParams({'n': '3'})` in UI code.
/// Each feature group owns one file in `strings/` with an `En` and `Fr` map.
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
    ...commonEn,
    ...authEn,
    ...onboardingEn,
    ...homeWorkoutEn,
    ...nutritionEn,
    ...progressCoachEn,
    ...profileEn,
    },
    'fr': {
    ...commonFr,
    ...authFr,
    ...onboardingFr,
    ...homeWorkoutFr,
    ...nutritionFr,
    ...progressCoachFr,
    ...profileFr,
    },
  };
}
