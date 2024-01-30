import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/add_medicine_dialog.dart';
import 'package:swaasthya/widgets/medicine_card.dart';

List<Map<String, dynamic>> treat = [
  {
    'medicineName': 'Paracetamol',
    'duration': '7 days',
    'numberOfDoses': 3,
    'medicationTime': 'After meal',
    'notes': 'Take with water',
    'progress': 0.7, // 70% progress
  },
  {
    'medicineName': 'Test Medicine 2',
    'duration': '4 days',
    'numberOfDoses': 1,
    'medicationTime': 'Before meal',
    'notes': 'Take with water',
    'progress': 0.4, // 70% progress
  },
  {
    'medicineName': 'Test Medicine 3',
    'duration': '15 days',
    'numberOfDoses': 3,
    'medicationTime': 'After meal',
    'notes': 'Take with water',
    'progress': 0.0, // 70% progress
  },
];

class TreatmentPage extends StatelessWidget {
  const TreatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Medicine'),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AddMedicineDialog();
                    });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 800,
          child: ListView.builder(
            itemCount: treat.length,
            itemBuilder: ((context, index) {
              final treatment = treat[index];
              return MedicineCard(
                medicineName: treatment['medicineName'],
                medicationTime: treatment['medicationTime'],
                numberOfDoses: treatment['numberOfDoses'],
                duration: treatment['duration'],
                notes: treatment['notes'],
                progress: treatment['progress'],
              );
            }),
          ),
        )
      ],
    );
  }
}
