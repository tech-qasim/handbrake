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

  DateTime get atStartOfDayUtc => DateTime.utc(year, month, day);

  /// Custom format
  String format(String pattern) {
    return DateFormat(pattern).format(this);
  }
}

extension WidgetsModifier on Widget {
  @widgetFactory
  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  @widgetFactory
  Widget addPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  @widgetFactory
  Widget center() {
    return Center(child: this);
  }

  @widgetFactory
  Widget sliverToBoxAdapter() {
    return SliverToBoxAdapter(child: this);
  }

  @widgetFactory
  Widget circularIconContainer({
    double size = 40,
    Color backgroundColor = AppColors.whiteColor,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      padding: padding,
      child: this,
    );
  }

  @widgetFactory
  Widget addTitle({
    required String title,
    required BuildContext context,
    TextStyle? textStyle,
    double? gap,
    Widget? icon,
    double? iconGap = 7,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon != null) ...[
              icon,
              if (iconGap != null) SizedBox(width: iconGap),
            ],
            Text(
              title,
              style:
                  textStyle ??
                  context.textTheme.titleLarge?.copyWith(
                    fontSize: 17,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        gap == null ? const SizedBox(height: 15) : SizedBox(height: gap),
        this,
      ],
    );
  }
}
