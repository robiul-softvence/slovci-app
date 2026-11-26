import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

/// Drives the launch animation from Figma "00 · Splash":
/// the logo scales up and fades in (0.7 s), the wordmark slides up,
/// then the app moves on after 1.2 s.
class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static const Duration _totalDuration = Duration(milliseconds: 2000);

  late final AnimationController _animation;

  late final Animation<double> logoScale;
  late final Animation<double> logoOpacity;
  late final Animation<double> textOpacity;
  late final Animation<double> textOffset;

  @override
  void onInit() {
    super.onInit();
    _animation = AnimationController(vsync: this, duration: _totalDuration);

    // 0.0 → 0.7 s of 1.2 s
    final logoCurve = CurvedAnimation(
      parent: _animation,
      curve: const Interval(0, 0.58, curve: Curves.easeOutBack),
    );
    // Wordmark + tagline follow the logo.
    final textCurve = CurvedAnimation(
      parent: _animation,
      curve: const Interval(0.35, 0.85, curve: Curves.easeOut),
    );
    // Figma: logo 72 → 120, opacity 0.3 → 1.
    logoScale = Tween<double>(begin: 0.6, end: 1).animate(logoCurve);
    logoOpacity = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(parent: _animation, curve: const Interval(0, 0.58)),
    );
    // Figma: text starts 26 px lower and invisible.
    textOpacity = Tween<double>(begin: 0, end: 1).animate(textCurve);
    textOffset = Tween<double>(begin: 26, end: 0).animate(textCurve);
  }

  @override
  void onReady() {
    super.onReady();
    _animation.forward().whenComplete(_goNext);
  }

  void _goNext() {
    Get.offAllNamed(AppRoute.welcomeScreen);
  }

  @override
  void onClose() {
    _animation.dispose();
    super.onClose();
  }
}
