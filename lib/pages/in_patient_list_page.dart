import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_patient_form/add_patient_form.dart';
// import 'package:swaasthya/widgets/patient_info_card.dart';

class InPatientListPage extends StatelessWidget {
  final List<Map<String, dynamic>> patientList;
  const InPatientListPage({super.key, required this.patientList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InPatient'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AddPatientForm(),
        ],
      ),
      // body: ListView.builder(
      //   scrollDirection: Axis.vertical,
      //   itemCount: patientList.length,
      //   itemBuilder: (context, index) {
      //     final patient = patientList[index];
      //     return GestureDetector(
      //       onTap: () {
      //         print(index);
      //       },
      //       child: PatientInfoCard(
      //         patient: patient,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
