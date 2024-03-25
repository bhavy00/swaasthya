import 'package:flutter/material.dart';

import 'package:swaasthya/theme/pallete.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    textTheme: const TextTheme(
      //displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //bodyLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
