import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFFF9F8F3);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color accentPeach = Color(0xFFE3AA87);
  static const Color accentCream = Color(0xFFFCF9E8);
  static const Color darkSlate = Color(0xFF111111);
  static const Color greyBorder = Color(0xFFE5E5E5);
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF7A7A7A);
  static const Color activeRed = Color(0xFFFE5230);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: darkSlate,
      primaryColor: darkSlate,
      colorScheme: const ColorScheme.light(
        primary: darkSlate,
        secondary: accentPeach,
        surface: surface,
        onPrimary: surface,
        onSecondary: textPrimary,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkSlate,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: textPrimary,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: textSecondary, height: 1.4),
      ),
    );
  }
}
