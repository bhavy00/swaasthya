import 'package:flutter/material.dart';
import 'package:swaasthya/pages/treatment_page.dart';
import 'package:swaasthya/widgets/add_prescription_dialog.dart';
import 'package:swaasthya/widgets/prescription_card.dart';

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Prescriptions'),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AddPrescriptionDialog();
                      });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const PrescriptionCard(),
          const SizedBox(
            height: 20,
          ),
          const TreatmentPage(),
        ],
      ),
    );
  }
}
