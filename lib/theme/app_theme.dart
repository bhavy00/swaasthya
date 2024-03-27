import 'package:flutter/material.dart';

import 'package:swaasthya/theme/pallete.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    segmentedButtonTheme: const SegmentedButtonThemeData(
      style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(10, 5))),
    ),
  );
}
