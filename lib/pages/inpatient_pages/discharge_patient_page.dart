import 'package:flutter/material.dart';
import 'package:swaasthya/pages/patient_profile_pages/patient_info_page.dart';
import 'package:swaasthya/widgets/cards/discharge_patient_list_card.dart';

class DischargePatientPage extends StatelessWidget {
  final List<Map<String, dynamic>> patientList;
  const DischargePatientPage({super.key, required this.patientList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discharge Patient'),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Search'),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Implement search functionality here
              },
            ),
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        scrollDirection: Axis.vertical,
        itemCount: patientList.length,
        itemBuilder: (context, index) {
          final patient = patientList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return const PatientInfo(
                  isInPatient: false,
                  isOPD: false,
                  patient: [],
                );
              })));
            },
            child: DischargePatientListCard(
              patient: patient,
            ),
          );
        },
      ),
    );
  }
}
