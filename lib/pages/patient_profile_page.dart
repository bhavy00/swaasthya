import 'package:flutter/material.dart';
import 'package:swaasthya/pages/vitals_info_page.dart';
import 'package:swaasthya/widgets/add_symptom_dialog.dart';

final List<String> symptoms = [
  'Headache',
  'Cold',
  'Sour Throat',
  'Body Pain',
  'Cold'
];

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // rest of the information abour the patient
        const Text('Information about Patient'),
        const SizedBox(height: 8),
        Card(
          elevation: 25.0,
          shadowColor: const Color.fromRGBO(
              0, 0, 0, 1), // Set the elevation to add a shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Set rounded borders
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(),
                    Column(
                      children: [
                        Text(
                          'name',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Age',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'someinfo',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
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
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: symptoms.length,
            itemBuilder: (context, index) {
              final symptom = symptoms[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  backgroundColor: const Color(0xFF1876F3),
                  label: Text(symptom),
                  labelStyle: const TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFF1876F3)),
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                ),
              );
            },
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
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const VitalsInfoPage();
              }),
            );
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
