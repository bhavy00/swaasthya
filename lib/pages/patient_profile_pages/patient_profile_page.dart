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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaQuery.of(context).size.width < 600
                ? const PatientProfileCard()
                : const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      CardOne(),
                      CardTwo(),
                      CardThree(),
                    ],
                  ),
            const SizedBox(
              height: 10,
            ),
            // symptoms
            const SymptomsWidget(),
            // vitals
            const SizedBox(
              height: 10,
            ),
            const VitalsWidget(),
          ],
        ),
      ),
    );
  }
}
