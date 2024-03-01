import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class PatientMedicationForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientMedicationForm({super.key, required this.formKey});

  @override
  State<PatientMedicationForm> createState() => _PatientMedicationFormState();
}

class _PatientMedicationFormState extends State<PatientMedicationForm> {
  @override
  Widget build(BuildContext context) {
    final MedicalHistory history = MedicalHistoryDataHolder.of(context).history;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Text('Does patient take any medicine?'),
          const SizedBox(
            height: 8,
          ),
          CheckboxListTile(
            title: const Text('Prescribed Medicine'),
            value: history.prescribedMedicine,
            onChanged: (value) {
              setState(() {
                history.prescribedMedicine = value!;
              });
            },
          ),
          if (history.prescribedMedicine) ...[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Medicine'),
              keyboardType: TextInputType.multiline,
              onSaved: (value) => history.prescribedMedicineList = value!,
            )
          ],
          CheckboxListTile(
            title: const Text('Self-Prescribed Medicine'),
            value: history.selfPrescribedMedicine,
            onChanged: (value) {
              setState(() {
                history.selfPrescribedMedicine = value!;
              });
            },
          ),
          if (history.selfPrescribedMedicine) ...[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Medicine'),
              keyboardType: TextInputType.multiline,
              onSaved: (value) => history.selfMedicineList = value!,
            )
          ],
        ],
      ),
    );
  }
}
