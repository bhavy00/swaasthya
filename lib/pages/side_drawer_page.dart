import 'package:flutter/material.dart';
import 'package:swaasthya/pages/inpatient_pages/discharge_patient_page.dart';
import 'package:swaasthya/pages/ot_page.dart';
import 'package:swaasthya/pages/welcome_page.dart';
import 'package:swaasthya/utils/patient_list.dart';

class SideDrawerItem {
  final String label;
  final Widget icon;
  final Widget screen;
  const SideDrawerItem(
    this.label,
    this.icon,
    this.screen,
  );
}

List<SideDrawerItem> items = [
  const SideDrawerItem(
    'Home',
    Icon(Icons.home),
    WelcomePage(),
  ),
  SideDrawerItem(
    'Discharge',
    const Icon(Icons.bed_sharp),
    DischargePatientPage(patientList: outPatientList),
  ),
  const SideDrawerItem(
    'OT',
    Icon(Icons.hotel),
    OTPage(),
  )
];

class SideDrawerPage extends StatefulWidget {
  const SideDrawerPage({super.key});
  @override
  State<SideDrawerPage> createState() => _SideDrawerPageState();
}

class _SideDrawerPageState extends State<SideDrawerPage> {
  Widget selectedWidget = items[0].screen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Yantram Medtech',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ...items.map((SideDrawerItem item) {
              return ListTile(
                leading: item.icon,
                title: Text(item.label),
                onTap: () {
                  setState(() {
                    selectedWidget = item.screen;
                    Navigator.pop(context);
                  });
                },
              );
            })
          ],
        ),
      ),
      body: selectedWidget,
    );
  }
}
