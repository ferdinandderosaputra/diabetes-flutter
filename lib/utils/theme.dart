import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryRed = Color(0xFFE31E24);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1F1F1F);
  
  static ThemeData theme = ThemeData(
    primaryColor: primaryRed,
    scaffoldBackgroundColor: primaryWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryRed,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        foregroundColor: primaryWhite,
      ),
    ),
  );
}
