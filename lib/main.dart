import 'package:flutter/material.dart';
import 'package:swaasthya/pages/in_patient_list_page.dart';

final List<Map<String, dynamic>> patientList = [];

void main() {
  for (int i = 0; i < 10; i++) {
    patientList.add({
      'name': 'test patient $i',
      'dr_name': 'Dr. Vivek Arora',
      'date': '2024-25-01'
    });
  }
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
        home: InPatientListPage(
          patientList: patientList,
        ));
  }
}
