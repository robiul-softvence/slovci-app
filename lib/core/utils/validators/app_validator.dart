import 'package:get/get.dart';

class AppValidator {
  AppValidator._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'common.validation.email_required'.tr;
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'common.validation.email_invalid'.tr;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'common.validation.password_required'.tr;
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'common.validation.password_min_length'.trParams({'count': '6'});
    }
    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'common.validation.password_uppercase'.tr;
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'common.validation.password_number'.tr;
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'common.validation.password_special'.tr;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'common.validation.phone_required'.tr;
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'common.validation.phone_invalid'.tr;
    }

    return null;
  }
}
