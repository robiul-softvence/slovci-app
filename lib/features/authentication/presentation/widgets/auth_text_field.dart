import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Figma "Field/Email" & "Field/Password": label above a 14 px-radius box
/// with a leading icon. Resting border is 1 px line grey; focused is
/// 1.5 px ink.
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.onToggleObscure,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onSubmitted,
  });

  final String label;
  final String hint;
  final String icon;
  final TextEditingController controller;
  final bool obscureText;

  /// When set, an eye icon is shown that calls this to show/hide the text.
  final VoidCallback? onToggleObscure;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);
    final radius = BorderRadius.circular(14.r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: text.semiBoldTextStyle(
            fontSize: AppTextStyle.md,
            lineHeight: 20,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: '•',
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autofillHints: autofillHints,
          onSubmitted: onSubmitted,
          cursorColor: AppColors.ink,
          style: text.regularTextStyle(
            fontSize: AppTextStyle.md,
            lineHeight: 20,
            color: AppColors.ink,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: text.regularTextStyle(
              fontSize: AppTextStyle.md,
              lineHeight: 20,
              color: AppColors.subtle,
            ),
            filled: true,
            fillColor: AppColors.white,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 14, right: 10),
              child: SvgPicture.asset(icon, width: 18, height: 18),
            ),
            prefixIconConstraints: const BoxConstraints(minHeight: 18),
            suffixIcon: onToggleObscure == null
                ? null
                : GestureDetector(
                    onTap: onToggleObscure,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 14),
                      child: Opacity(
                        // Dimmed while hidden, full strength while visible.
                        opacity: obscureText ? 1 : 0.5,
                        child: SvgPicture.asset(
                          IconPath.eye,
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ),
            suffixIconConstraints: const BoxConstraints(minHeight: 18),
            enabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(color: AppColors.line),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(color: AppColors.ink, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
