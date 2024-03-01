import 'package:flutter/material.dart';
import 'package:swaasthya/pages/welcome_page.dart';
import 'package:swaasthya/utils/patient_list.dart';
import 'package:swaasthya/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  fillPatient();
  fillOutPatient();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swaasthya',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      home: const WelcomePage(),
    );
  }
}
