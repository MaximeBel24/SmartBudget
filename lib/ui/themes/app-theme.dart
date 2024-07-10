import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme();

  static final ThemeData _baseTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    iconTheme: const IconThemeData(
      size: 30
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white
    )
  );

  static ThemeData lightTheme() {
    return _baseTheme.copyWith(
      brightness: _lightColorScheme().brightness,
      colorScheme: _lightColorScheme(),
      scaffoldBackgroundColor: _lightColorScheme().background,
      textTheme: _baseTheme.textTheme.apply(
        bodyColor: _lightColorScheme().onBackground,
        displayColor: _lightColorScheme().onBackground
      ),
      iconTheme: _baseTheme.iconTheme.copyWith(
        color: _lightColorScheme().onBackground,
      ),
    );
  }

  static ColorScheme _lightColorScheme() => ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.sbBlue,
      onPrimary: Colors.white,
      secondary: AppColors.sbAzur,
      onSecondary: Colors.white,
      tertiary: Colors.grey[300]!,
      onTertiary: Colors.grey[900]!,
      background: Colors.white,
      onBackground: Colors.grey[900]!,
      error: Colors.red[400]!,
      onError: Colors.white,
      surface: Colors.grey[100]!,
      onSurface: Colors.grey[900]!
  );

  static double get smallSpacing => 8;

  static double get spacing => 15;

  static double get largeSpacing => 30;

  static double get smallPadding => 8;

  static double get padding => 15;

  static double get largePadding => 30;

  static double get smallBorderRadius => 5;

  static double get borderRadius => 20;

  static double get shadowBlurRadius => 5;

  static List<BoxShadow> get boxShadow => [
    BoxShadow(
      color: Colors.black12,
      blurRadius: shadowBlurRadius
    ),
  ];
}