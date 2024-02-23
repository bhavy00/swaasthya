import 'package:flutter/material.dart';
import 'package:swaasthya/utils/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class PatientAddictionInfectionForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientAddictionInfectionForm({super.key, required this.formKey});

  @override
  State<PatientAddictionInfectionForm> createState() =>
      _PatientAddictionInfectionFormState();
}

class _PatientAddictionInfectionFormState
    extends State<PatientAddictionInfectionForm> {
  @override
  Widget build(BuildContext context) {
    final MedicalHistory history = MedicalHistoryDataHolder.of(context).history;
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Does patient has/had any of the following infectinos?'),
            const SizedBox(
              height: 8,
            ),
            CheckboxListTile(
              title: const Text('HIV'),
              value: history.hiv,
              onChanged: (value) {
                setState(() {
                  history.hiv = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Hepatitis B'),
              value: history.hepatitisB,
              onChanged: (value) {
                setState(() {
                  history.hepatitisB = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Hepatitis C'),
              value: history.hepatitisC,
              onChanged: (value) {
                setState(() {
                  history.hepatitisC = value!;
                });
              },
            ),
            const Text('Does the patient have any of the following addiction?'),
            const SizedBox(
              height: 8,
            ),
            CheckboxListTile(
              title: const Text('Alcohol'),
              value: history.alcohol,
              onChanged: (value) {
                setState(() {
                  history.alcohol = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Tobacco'),
              value: history.tobacco,
              onChanged: (value) {
                setState(() {
                  history.tobacco = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Drugs'),
              value: history.drugs,
              onChanged: (value) {
                setState(() {
                  history.drugs = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
