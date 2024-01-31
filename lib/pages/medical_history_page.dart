import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_medical_history_form/add_medical_history_form.dart';

bool hasData = true;

class MedicalHistoryPage extends StatelessWidget {
  const MedicalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!hasData) ...[
          const Text('No medical history found'),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const AddMedicalHistoryForm();
                }),
              );
            },
            child: const Text('Add Patient Medical History'),
          )
        ],
        
      ],
    );
  }
}
