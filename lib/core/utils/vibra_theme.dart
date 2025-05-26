import 'package:flutter/material.dart';

class VibraColors {
  static const primary = Color(0xFF00C49A);
  static const secondary = Color(0xFF1C1B1F);
  static const background = Color(0xFFF4F4F4);
  static const text = Color(0xFF202020);
  static const accent = Color(0xFF00796B);
}

class VibraTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: VibraColors.primary,
      secondary: VibraColors.accent,
      surface: VibraColors.background,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: VibraColors.text,
    ),
    scaffoldBackgroundColor: VibraColors.background,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: VibraColors.text),
      bodyMedium: TextStyle(color: VibraColors.text),
    ),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: VibraColors.primary,
      secondary: VibraColors.accent,
      surface: VibraColors.secondary,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: VibraColors.secondary,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    useMaterial3: true,
  );
}
