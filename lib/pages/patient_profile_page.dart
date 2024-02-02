import 'package:flutter/material.dart';
import 'package:swaasthya/pages/vitals_info_dialog.dart';
import 'package:swaasthya/widgets/add_symptom_dialog.dart';
import 'package:swaasthya/widgets/add_vitals_dialog.dart';
import 'package:swaasthya/widgets/patient_page_view.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // rest of the information abour the patient
        const Text('Information about patient'),
        const SizedBox(
          height: 4,
        ),
        const PatientProfileCard(),
        const SizedBox(
          height: 10,
        ),
        // symptoms
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Symptoms'),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AddSymptomDialog();
                    });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Center(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Symptom Name')),
              DataColumn(label: Text('Duration')),
              DataColumn(label: Text('Action')),
            ],
            rows: List.generate(symptoms.length, (index) {
              return DataRow(cells: [
                DataCell(Text(symptoms[index]['name']!)),
                DataCell(Text(symptoms[index]['duration']!)),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        symptoms.removeAt(index);
                      });
                    },
                  ),
                ),
              ]);
            }),
          ),
        ),
        // vitals
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Vitals'),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AddVitalsDialog();
                    });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const VitalsInfoDialog();
                });
          },
          child: Card(
            elevation: 25,
            shadowColor: const Color.fromRGBO(
                0, 0, 0, 1), // Set the elevation to add a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Set rounded borders
            ),
            child: Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('72 bt/min'),
                          Text('Heart rate'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('95'),
                          Text('SpO2'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('120 mmHg'),
                          Text('Blood Pressure'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('37'),
                          Text('Temprature'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
