import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Figma "OTP": six 50 × 56 cells. Filled cells have an ink border, the
/// next cell to type in gets a coral border and caret. A transparent
/// TextField on top handles the keyboard, paste and SMS autofill.
class OtpCodeField extends StatelessWidget {
  const OtpCodeField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.code,
    required this.hasFocus,
    this.length = 6,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final RxString code;
  final RxBool hasFocus;
  final int length;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          Obx(() {
            final value = code.value;
            final active = hasFocus.value ? value.length : -1;
            return Row(
              children: [
                for (var i = 0; i < length; i++) ...[
                  if (i > 0) SizedBox(width: 10.w),
                  Expanded(
                    child: _OtpCell(
                      digit: i < value.length ? value[i] : null,
                      isActive: i == active,
                    ),
                  ),
                ],
              ],
            );
          }),
          Positioned.fill(
            child: Opacity(
              opacity: 0,
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                autofocus: true,
                keyboardType: TextInputType.number,
                autofillHints: const [AutofillHints.oneTimeCode],
                maxLength: length,
                showCursor: false,
                enableInteractiveSelection: false,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpCell extends StatelessWidget {
  const _OtpCell({required this.digit, required this.isActive});

  final String? digit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.cta : const Color(0xFF121212);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isActive ? AppColors.cta : AppColors.ink,
          width: isActive ? 2 : 1.5,
        ),
      ),
      child: Text(
        digit ?? (isActive ? '|' : ''),
        style: AppTextStyle(context).boldTextStyle(fontSize: 22, color: color),
      ),
    );
  }
}
