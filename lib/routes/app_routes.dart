import 'package:get/get.dart';
import 'package:flutter_tamplate/features/authentication/bindings/auth_bindings.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/create_password_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/verify_email_screen.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentaion/UI/bottom_nav_screen.dart';
import 'package:flutter_tamplate/features/home/presentation/screens/home_free_plan_screen.dart';
import 'package:flutter_tamplate/features/nutrition/bindings/nutrition_binding.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_grocery_list_screen.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_meal_planner_screen.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_photo_scan_screen.dart';
import 'package:flutter_tamplate/features/nutrition/presentation/screens/nutrition_recipe_detail_screen.dart';
import 'package:flutter_tamplate/features/onboarding/bindings/onboarding_binding.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_anything_to_report_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_environment_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_food_preferences_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_generating_plan_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_health_screening_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_injury_body_map_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_notifications_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_nutrition_budget_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_plan_ready_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_profile_goals_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_schedule_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_target_weight_screen.dart';
import 'package:flutter_tamplate/features/onboarding/presentation/screens/onboarding_with_milon_screen.dart';
import 'package:flutter_tamplate/features/splash/bindings/splash_binding.dart';
import 'package:flutter_tamplate/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_tamplate/features/welcome/bindings/welcome_binding.dart';
import 'package:flutter_tamplate/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:flutter_tamplate/features/workout/bindings/workout_binding.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_active_set_screen.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_end_feedback_screen.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_exercise_detail_screen.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_rest_countdown_screen.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_session_summary_screen.dart';
import 'package:flutter_tamplate/features/workout/presentation/screens/workout_timed_circuit_screen.dart';

class AppRoute {
  static const String splashScreen = "/splashScreen";
  static const String welcomeScreen = "/welcomeScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String signInScreen = "/signInScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String verifyEmailScreen = "/verifyEmailScreen";
  static const String createPasswordScreen = "/createPasswordScreen";
  static const String onboardingProfileGoalsScreen =
      "/onboardingProfileGoalsScreen";
  static const String onboardingTargetWeightScreen =
      "/onboardingTargetWeightScreen";
  static const String onboardingWithMilonScreen = "/onboardingWithMilonScreen";
  static const String onboardingHealthScreeningScreen =
      "/onboardingHealthScreeningScreen";
  static const String onboardingAnythingToReportScreen =
      "/onboardingAnythingToReportScreen";
  static const String onboardingInjuryBodyMapScreen =
      "/onboardingInjuryBodyMapScreen";
  static const String onboardingEnvironmentScreen =
      "/onboardingEnvironmentScreen";
  static const String onboardingScheduleScreen = "/onboardingScheduleScreen";
  static const String onboardingFoodPreferencesScreen =
      "/onboardingFoodPreferencesScreen";
  static const String onboardingNutritionBudgetScreen =
      "/onboardingNutritionBudgetScreen";
  static const String onboardingGeneratingPlanScreen =
      "/onboardingGeneratingPlanScreen";
  static const String onboardingPlanReadyScreen = "/onboardingPlanReadyScreen";
  static const String onboardingNotificationsScreen =
      "/onboardingNotificationsScreen";
  static const String bottomNavScreen = "/bottomNavScreen";
  static const String homeFreePlanScreen = "/homeFreePlanScreen";
  static const String workoutExerciseDetailScreen =
      "/workoutExerciseDetailScreen";
  static const String workoutActiveSetScreen = "/workoutActiveSetScreen";
  static const String workoutTimedCircuitScreen = "/workoutTimedCircuitScreen";
  static const String workoutRestCountdownScreen =
      "/workoutRestCountdownScreen";
  static const String workoutEndFeedbackScreen = "/workoutEndFeedbackScreen";
  static const String workoutSessionSummaryScreen =
      "/workoutSessionSummaryScreen";
  static const String nutritionMealPlannerScreen =
      "/nutritionMealPlannerScreen";
  static const String nutritionRecipeDetailScreen =
      "/nutritionRecipeDetailScreen";
  static const String nutritionPhotoScanScreen = "/nutritionPhotoScanScreen";
  static const String nutritionGroceryListScreen =
      "/nutritionGroceryListScreen";

  static const String internetlost = "/internetlost";
  static const String communityScreen = "/communityScreen";

  static String getSplashScreen() => splashScreen;
  static String getBottomNavScreen() => bottomNavScreen;

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: welcomeScreen,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: signInScreen,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: verifyEmailScreen,
      page: () => const VerifyEmailScreen(),
      binding: VerifyEmailBinding(),
    ),
    GetPage(
      name: createPasswordScreen,
      page: () => const CreatePasswordScreen(),
      binding: CreatePasswordBinding(),
    ),
    GetPage(
      name: onboardingProfileGoalsScreen,
      page: () => const OnboardingProfileGoalsScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingTargetWeightScreen,
      page: () => const OnboardingTargetWeightScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingWithMilonScreen,
      page: () => const OnboardingWithMilonScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingHealthScreeningScreen,
      page: () => const OnboardingHealthScreeningScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingAnythingToReportScreen,
      page: () => const OnboardingAnythingToReportScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingInjuryBodyMapScreen,
      page: () => const OnboardingInjuryBodyMapScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingEnvironmentScreen,
      page: () => const OnboardingEnvironmentScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingScheduleScreen,
      page: () => const OnboardingScheduleScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingFoodPreferencesScreen,
      page: () => const OnboardingFoodPreferencesScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingNutritionBudgetScreen,
      page: () => const OnboardingNutritionBudgetScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: onboardingGeneratingPlanScreen,
      page: () => const OnboardingGeneratingPlanScreen(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: onboardingPlanReadyScreen,
      page: () => const OnboardingPlanReadyScreen(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: onboardingNotificationsScreen,
      page: () => const OnboardingNotificationsScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: bottomNavScreen, page: () => const BottomNavScreen()),
    GetPage(name: homeFreePlanScreen, page: () => const HomeFreePlanScreen()),
    GetPage(
      name: workoutExerciseDetailScreen,
      page: () => const WorkoutExerciseDetailScreen(),
      binding: WorkoutBinding(),
    ),
    GetPage(
      name: workoutActiveSetScreen,
      page: () => const WorkoutActiveSetScreen(),
      binding: WorkoutBinding(),
    ),
    GetPage(
      name: workoutTimedCircuitScreen,
      page: () => const WorkoutTimedCircuitScreen(),
      binding: WorkoutBinding(),
    ),
    GetPage(
      name: workoutRestCountdownScreen,
      page: () => const WorkoutRestCountdownScreen(),
      binding: WorkoutBinding(),
    ),
    GetPage(
      name: workoutEndFeedbackScreen,
      page: () => const WorkoutEndFeedbackScreen(),
      binding: WorkoutBinding(),
    ),
    GetPage(
      name: workoutSessionSummaryScreen,
      page: () => const WorkoutSessionSummaryScreen(),
      binding: WorkoutBinding(),
    ),
    GetPage(
      name: nutritionMealPlannerScreen,
      page: () => const NutritionMealPlannerScreen(),
      binding: NutritionBinding(),
    ),
    GetPage(
      name: nutritionRecipeDetailScreen,
      page: () => const NutritionRecipeDetailScreen(),
      binding: NutritionBinding(),
    ),
    GetPage(
      name: nutritionPhotoScanScreen,
      page: () => const NutritionPhotoScanScreen(),
      binding: NutritionBinding(),
    ),
    GetPage(
      name: nutritionGroceryListScreen,
      page: () => const NutritionGroceryListScreen(),
      binding: NutritionBinding(),
    ),
  ];
}
