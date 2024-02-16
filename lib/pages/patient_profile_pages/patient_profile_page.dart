import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/symptoms_widget.dart';
import 'package:swaasthya/widgets/patient_page_view.dart';
import 'package:swaasthya/widgets/vitals_widget.dart';

List<Map<String, String>> symptoms = [
  {'name': 'Headache', 'duration': '2 days'},
  {'name': 'Fever', 'duration': '3 days'},
  // Add more symptoms as needed
];

class PatientProfilePage extends StatefulWidget {
  const PatientProfilePage({super.key});

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // rest of the information abour the patient

            PatientProfileCard(),
            SizedBox(
              height: 10,
            ),
            // symptoms
            SymptomsWidget(),
            // vitals
            SizedBox(
              height: 10,
            ),
            VitalsWidget(),
          ],
        ),
      ),
    );
  }
}
