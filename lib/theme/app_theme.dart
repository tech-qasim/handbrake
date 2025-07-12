import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handbrake/theme/app_colors.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.primaryColor,
    // tertiaryContainer: AppColors.contrastColor,
    // inversePrimary: AppColors.primary,
    // tertiary: AppColors.lightGrey,
    // surface: AppColors.purple,
    // surfaceVariant: AppColors.blackpurple,
    // shadow: AppColors.darkWhite,
    // outline: AppColors.blue,
    // inverseSurface: AppColors.darkblue,
    // tertiaryContainer: AppColors.darkBlue,
    // onInverseSurface: AppColors.lightpurple,
    // onTertiary: AppColors.darkGrey,
  );

  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.primaryColor,
    // tertiaryContainer: AppColors.contrastColor,
    // inversePrimary: AppColors.primary,
    // tertiary: AppColors.darkGrey,
    // onSurface: AppColors.purple,
    // shadow: AppColors.darkWhite,
    // outline: AppColors.blue,
    // onInverseSurface: AppColors.darkblue,
    // onSurfaceVariant: AppColors.blackpurple,
    // inverseSurface: AppColors.primary,
  );
}

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightModeScreenBgColor,
    colorScheme: AppColorSchemes.lightColorScheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.blackColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
    ),
    textTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.whiteColor,
    ),
    // timePickerTheme: const TimePickerThemeData(
    //   dayPeriodColor: AppColors.primary,
    //   dayPeriodTextColor: AppColors.white,
    // ),
    tooltipTheme: TooltipThemeData(
      textStyle: AppTextTheme.textTheme(
        AppColorSchemes.lightColorScheme,
      ).bodyMedium?.copyWith(color: AppColors.whiteColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: const Size(double.infinity, 50),
        textStyle:
            AppTextTheme.textTheme(
              AppColorSchemes.lightColorScheme,
            ).bodyLarge ??
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ), // Add your text style here
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.primaryColor.withOpacity(0.5),
      surfaceTintColor: AppColors.transparentColor,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: AppColorSchemes.darkColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: AppColorSchemes.darkColorScheme.primary,
    ),
    textTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(fontSize: 12),
      ),
    ),
  );
}

class AppTextTheme {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    /// Use this for titles like in app bars etc
    displayLarge: GoogleFonts.lexend(
      color: colorScheme.inverseSurface,
      fontSize: 25,
      fontWeight: FontWeight.w500,
    ),

    /// Use this for attribute title or sub headings
    titleLarge: GoogleFonts.lexend(
      color: colorScheme.inverseSurface,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),

    /// Use this for when to bold any kind of attributes in a card or UI widget
    bodyLarge: GoogleFonts.lexend(
      color: colorScheme.inverseSurface,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),

    /// Use this for any kind of attributes in a card or UI widget
    bodyMedium: GoogleFonts.lexend(
      color: colorScheme.inverseSurface,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),

    /// Used for bold headings of textfields and other widgets
    titleMedium: GoogleFonts.lexend(
      color: colorScheme.inverseSurface,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    /// Used for non bold/regular headings of textfields and other widgets
    titleSmall: GoogleFonts.lexend(
      color: colorScheme.inverseSurface,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),

    /// Use this for any kind of attributes in a card or UI widget
    bodySmall: GoogleFonts.lexend(
      fontWeight: FontWeight.w400,
      color: colorScheme.inverseSurface,
      fontSize: 12,
    ),
  );
}
