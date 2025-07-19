import 'package:flutter/material.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:intl/intl.dart';

extension BuildContextExtensions on BuildContext {
  double get deviceTopPadding => MediaQuery.of(this).padding.top;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);

  void showSnackBar(String message, [Duration? duration]) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: AppColors.whiteColor,
        content: Text(
          message,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.whiteColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.red,
        duration: duration ?? const Duration(seconds: 2),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String capitalizeAll() {
    return toUpperCase();
  }
}

extension DateFormatting on DateTime {
  /// Format: "dd-MM-yyyy"
  String toDayMonthYear() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  /// Format: "MMM dd, yyyy"
  String toMonthDayYear() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  /// Format: "EEEE, MMMM d, yyyy" (e.g., "Friday, July 19, 2024")
  String toFullDate() {
    return DateFormat('EEEE, MMMM d, yyyy').format(this);
  }

  /// Format: "yyyy-MM-dd"
  String toDatabaseFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Format: "hh:mm a" (e.g., "02:45 PM")
  String to12HourTime() {
    return DateFormat('hh:mm a').format(this);
  }

  /// Format: "HH:mm" (24-hour format)
  String to24HourTime() {
    return DateFormat('HH:mm').format(this);
  }

  /// Custom format
  String format(String pattern) {
    return DateFormat(pattern).format(this);
  }
}
