import 'package:flutter/material.dart';
import 'package:swaasthya/pages/emergency_pages/emergency_page.dart';
import 'package:swaasthya/pages/home_page/home_page.dart';
import 'package:swaasthya/pages/inpatient_pages/in_patient_list_page.dart';
import 'package:swaasthya/pages/inpatient_pages/discharge_patient_page.dart';
import 'package:swaasthya/pages/outpatient_pages/opd_page.dart';
import 'package:swaasthya/utils/patient_list.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentPage = 0;

  List<Widget> pages = [
    const HomePage(),
    InPatientListPage(patientList: patientList),
    DischargePatientPage(
      patientList: outPatientList,
    ),
    OPDPage(patientList: patientList),
    EmergencyPage(
      patientList: patientList,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPage,
        children: pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          currentIndex: _currentPage,
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'InPatient',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.outbox),
              label: 'Discharged',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.outbond),
              label: 'OPD',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emergency),
              label: 'Emergency',
            )
          ],
        ),
      ),
    );
  }
}
