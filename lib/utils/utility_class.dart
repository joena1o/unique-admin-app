import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';

class UtilityClass {
  static EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsets horizontalAndVerticalPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

  static EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 20);

  static EdgeInsets verticalPaddingHalf =
      const EdgeInsets.symmetric(vertical: 10);

  static String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  static String? passwordValidator(String? value) {
    // Check if the password is empty
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    // Check password length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for uppercase letters
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for lowercase letters
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for digits
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }

    // Check for special characters
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // Password is valid
  }

  static String? firstNameValidator(String? value) {
    // Check if the first name is empty
    if (value == null || value.isEmpty) {
      return 'First name cannot be empty';
    }

    // Check for valid length
    if (value.length < 2) {
      return 'First name must be at least 2 characters long';
    }

    // Check for invalid characters (optional)
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'First name can only contain letters';
    }

    return null; // First name is valid
  }

  static String? lastNameValidator(String? value) {
    // Check if the last name is empty
    if (value == null || value.isEmpty) {
      return 'Last name cannot be empty';
    }

    // Check for valid length
    if (value.length < 2) {
      return 'Last name must be at least 2 characters long';
    }

    // Check for invalid characters (optional)
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Last name can only contain letters';
    }

    return null; // Last name is valid
  }

  static List<String> daysOfTheWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

//Button Container Styles

  static final buttonDecorationFill = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primaryColor,
        AppColors.primaryColor,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(0),
  );

  static BoxDecoration setButtonDecoration(Color color) {
    return BoxDecoration(
      border: Border.all(color: color, width: 2),
      color: color,
      borderRadius: BorderRadius.circular(0),
    );
  }

  static BoxDecoration setGradientDecoration(Color color1, Color color2) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          color1,
          color2,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(0),
    );
  }

  static final buttonDecorationOnlyOutline = BoxDecoration(
    border: Border.all(color: AppColors.secondaryColor, width: 1),
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(0),
  );

  static BoxDecoration setButtonOutlineDecoration(Color color) {
    return BoxDecoration(
      border: Border.all(color: color, width: 1),
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(0),
    );
  }
//Button Container Styles'
}
