import 'package:flutter/material.dart';
import 'package:swaasthya/pages/patient_info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Swaasthya',
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system,
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        home: PatientInfo());
  }
}
