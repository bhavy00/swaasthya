import 'package:flutter/material.dart';

import 'package:swaasthya/theme/pallete.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Palette.primaryColor,
      secondary: Palette.secondaryColor,
      tertiary: Palette.teritiaryColor,
      surface: Palette.teritiaryColor,
    ),
    scaffoldBackgroundColor: Color(0xFFe0efff),
    iconTheme: const IconThemeData(color: Color(0xFFFFB000)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF334966),
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 70,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 25,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      labelStyle: TextStyle(color: Colors.white),
      prefixIconColor: Colors.white,
      suffixStyle: TextStyle(
        color: Colors.white,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
  );
}
