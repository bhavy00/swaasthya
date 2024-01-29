import 'package:flutter/material.dart';
import 'package:swaasthya/pages/patient_info_page.dart';
import 'package:swaasthya/utils/patient_list.dart';

void main() {
  fillPatient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swaasthya',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      home: const PatientInfo(),
    );
  }
}
