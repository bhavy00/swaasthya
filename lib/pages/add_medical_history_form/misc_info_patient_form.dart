import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class MiscInfoPatient extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const MiscInfoPatient({super.key, required this.formKey});

  @override
  State<MiscInfoPatient> createState() => _MiscInfoPatientState();
}

class _MiscInfoPatientState extends State<MiscInfoPatient> {
  @override
  Widget build(BuildContext context) {
    final MedicalHistory history = MedicalHistoryDataHolder.of(context).history;
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Any known diseases in family?'),
              value: history.geneticDiseases,
              onChanged: (value) {
                setState(() {
                  history.geneticDiseases = value!;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            if (history.geneticDiseases) ...[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Disease Name'),
                keyboardType: TextInputType.multiline,
                onSaved: (value) => history.geneticDiseasesList = value!,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
            CheckboxListTile(
              title: const Text('Pregnant/been pregnant'),
              value: history.pregnant,
              onChanged: (value) {
                setState(() {
                  history.pregnant = value!;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CheckboxListTile(
              title: const Text('Lumps found in physical examination?'),
              value: history.lumps,
              onChanged: (value) {
                setState(() {
                  history.lumps = value!;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CheckboxListTile(
              title: const Text('Cancer Patient/Survivor'),
              value: history.cancer,
              onChanged: (value) {
                setState(() {
                  history.cancer = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
