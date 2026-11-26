import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ─── Brand ─────────────────────────────────────────────
  static const Color primary = Color(0xFFFF7176);
  static const Color primarylight = Color(0xFFF6C4C4);
  static const Color primarydark = Color(0xFFF4A0A4);
  static const Color secondary = Color(0xFF282828);
  static const Color accent = Color(0xFF89A7FF);
  static const Color cta = Color(0xFFE04D38);

  // ─── MILON design tokens (Figma "Cover & Design System") ───
  static const Color ink = Color(0xFF111318);
  static const Color muted = Color(0xFF6B6F76);
  static const Color subtle = Color(0xFF9A9EA5);
  static const Color line = Color(0xFFE7E8E4);
  static const Color pearl = Color(0xFFF5F6F4);
  static const Color peach = Color(0xFFFFE8E1);
  static const Color coral = Color(0xFFFF654F);
  static const Color emerald = Color(0xFF25845C);
  static const Color mintLight = Color(0xFFE3F2EA);
  static const Color mintSoft = Color(0xFFEEF7F2);
  static const Color lime = Color(0xFFD8F56A);
  static const Color infoSoft = Color(0xFFE3EDF8);
  static const Color amberSoft = Color(0xFFFDF3E6);
  static const Color coralSoft = Color(0xFFFDE4E0);
  static const Color dangerDark = Color(0xFFC9332B);
  static const Color limeSoft = Color(0xFFF1F9D2);
  static const Color amber = Color(0xFFD68A25);
  static const Color mintRow = Color(0xFFE8F4EE);
  static const Color carbsBlue = Color(0xFF3478C8);

  // ─── Status ────────────────────────────────────────────
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // ─── Light Theme ───────────────────────────────────────
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF9FAFB);
  static const Color lightSurfaceVariant = Color(0xFFF1F3F5);
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color lightDivider = Color(0xFFEEEEEE);

  static const Color lightTextPrimary = Color(0xFF111827);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightTextDisabled = Color(0xFF9CA3AF);
  static const Color lightTextInverse = Color(0xFFFFFFFF);

  // ─── Dark Theme ────────────────────────────────────────
  static const Color darkBackground = Color(0xFF0F1115);
  static const Color darkSurface = Color(0xFF1A1D23);
  static const Color darkSurfaceVariant = Color(0xFF23272F);
  static const Color darkBorder = Color(0xFF2E333B);
  static const Color darkDivider = Color(0xFF2A2E36);

  static const Color darkTextPrimary = Color(0xFFF9FAFB);
  static const Color darkTextSecondary = Color(0xFFB0B7C3);
  static const Color darkTextDisabled = Color(0xFF6B7280);
  static const Color darkTextInverse = Color(0xFF111827);

  // ─── Neutral ───────────────────────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  // ─── Gradient Light Theme ──────────────────────────────────────────
  static const Gradient primaryLightGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [primarydark, primarylight],
  );

  // ─── Gradient Dark Theme ──────────────────────────────────────────
  static const Gradient primaryDarkGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [lightTextPrimary, lightTextSecondary],
  );

  // ─── Theme-aware helpers ───────────────────────────────
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color background(BuildContext context) =>
      isDark(context) ? darkBackground : lightBackground;

  static Color surface(BuildContext context) =>
      isDark(context) ? darkSurface : lightSurface;

  static Color surfaceVariant(BuildContext context) =>
      isDark(context) ? darkSurfaceVariant : lightSurfaceVariant;

  static Color border(BuildContext context) =>
      isDark(context) ? darkBorder : lightBorder;

  static Color divider(BuildContext context) =>
      isDark(context) ? darkDivider : lightDivider;

  static Color textPrimary(BuildContext context) =>
      isDark(context) ? darkTextPrimary : lightTextPrimary;

  static Color textSecondary(BuildContext context) =>
      isDark(context) ? darkTextSecondary : lightTextSecondary;

  static Color textDisabled(BuildContext context) =>
      isDark(context) ? darkTextDisabled : lightTextDisabled;

  static Color textInverse(BuildContext context) =>
      isDark(context) ? darkTextInverse : lightTextInverse;
}
