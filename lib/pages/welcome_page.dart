import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/pages/emergency_pages/emergency_page.dart';
import 'package:swaasthya/pages/home_page/home_page.dart';
import 'package:swaasthya/pages/inpatient_pages/in_patient_list_page.dart';
import 'package:swaasthya/pages/ot_page.dart';
import 'package:swaasthya/pages/outpatient_pages/opd_page.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final userData = ref.read(userProvider);
    List<Widget> pages = [
      HomePage(
        user: userData,
      ),
      InPatientListPage(
        userData: userData,
      ),
      const OTPage(),
      OPDPage(userData: userData,),
      EmergencyPage(
        userData: userData,
      ),
    ];
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
              label: 'OT',
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
