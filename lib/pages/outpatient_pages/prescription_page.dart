import 'package:flutter/material.dart';
import 'package:swaasthya/pages/patient_profile_pages/treatment_page.dart';
import 'package:swaasthya/widgets/forms/add_prescription_dialog.dart';
import 'package:swaasthya/widgets/cards/prescription_card.dart';

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 12,
        ),
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
            const TreatmentPage()
          ],
        ),
      ),
    );
  }
}
