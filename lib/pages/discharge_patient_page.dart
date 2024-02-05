import 'package:flutter/material.dart';
import 'package:swaasthya/pages/patient_info_page.dart';
import 'package:swaasthya/widgets/discharge_patient_list_card.dart';

class DischargePatientPage extends StatelessWidget {
  final List<Map<String, dynamic>> patientList;
  const DischargePatientPage({super.key, required this.patientList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discharge Patient'),
        centerTitle: true,
      ),
      body: ListView.builder(
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
