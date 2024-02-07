import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_patient_form/add_patient_form.dart';
import 'package:swaasthya/pages/patient_info_page.dart';
import 'package:swaasthya/widgets/patient_info_card.dart';

class EmergencyPage extends StatelessWidget {
  final List<Map<String, dynamic>> patientList;
  const EmergencyPage({super.key, required this.patientList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddPatientForm();
              }));
            },
            icon: const Icon(Icons.add),
          )
        ],
        elevation: 0,
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: patientList.length,
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
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
            child: PatientInfoCard(
              patient: patient,
            ),
          );
        },
      ),
    );
  }
}
