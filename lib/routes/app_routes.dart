import 'package:get/get.dart';
import 'package:flutter_tamplate/features/authentication/bindings/auth_bindings.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/create_password_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:flutter_tamplate/features/authentication/presentation/screens/verify_email_screen.dart';
import 'package:flutter_tamplate/features/bottom_nav/presentaion/UI/bottom_nav_screen.dart';
import 'package:flutter_tamplate/features/splash/bindings/splash_binding.dart';
import 'package:flutter_tamplate/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_tamplate/features/welcome/bindings/welcome_binding.dart';
import 'package:flutter_tamplate/features/welcome/presentation/screens/welcome_screen.dart';

class AppRoute {
  static const String splashScreen = "/splashScreen";
  static const String welcomeScreen = "/welcomeScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String signInScreen = "/signInScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String verifyEmailScreen = "/verifyEmailScreen";
  static const String createPasswordScreen = "/createPasswordScreen";
  static const String bottomNavScreen = "/bottomNavScreen";

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
    GetPage(name: bottomNavScreen, page: () => const BottomNavScreen()),
  ];
}
